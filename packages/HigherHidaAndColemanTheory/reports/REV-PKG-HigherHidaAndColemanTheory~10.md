<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6870267822 -->
Review (claude) of c88b41d

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) §9.9 locator: two theorems the statement uses are not cited, and two page ranges are off

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1564: "(BP-Coleman, §1.1, pp. 2–4; Theorems 5.7.3, 6.7.3 and 6.9.7, pp. 118–120, 166–167, 171–172)". Same pattern at line 925: "Theorems 5.7.1–5.7.3, pp. 117–120", and line 1014: "Lemma 6.6.4 and its proof, p. 164".

   **Claim:** The cited theorems, at those pages, give the cuspidal ranges `[0,r]`, the canonical ranges `[r,n]`, Serre duality and interior deformation for split U(n,1).

   **Witness:** BP-Coleman line 5551–5552: Theorem 5.7.3 (canonical amplitude only) and its proof lie on p. 119 (p. 119 is line 5506–5552). The cuspidal range is Theorem 5.6.1 (line 5377, p. 115) and the duality is Theorem 5.7.2 (line 5491, p. 118). Theorem 6.7.3 with its proof is line 7660–7675, on p. 167 (begins line 7654). Lemma 6.6.4 is stated at line 7510, p. 163.

   **Exact repair:**

   - Line 1564: "(BP-Coleman, §1.1, pp. 2–4; Theorem 5.6.1, p. 115; Theorems 5.7.2 and 5.7.3, pp. 118–119; Theorem 6.7.3, p. 167; Theorem 6.9.7, pp. 171–172)".
   - Line 925: "Theorems 5.7.1–5.7.3, pp. 117–119".
   - Line 1014: "Lemma 6.6.4 and its proof, pp. 163–164", as line 1020 already has.

   No manifest change is needed: Theorems 5.6.1 and 5.7.1–5.7.3 are in the BP-Coleman `locator` string.

   **Repair test:** line 5377 lies in p. 115 (5346–5385), line 5491 in p. 118 (5468–5505), line 5551 in p. 119, line 7660 in p. 167, line 7872 in p. 171 with its proof on p. 172.

2. **F02** (P3) two Examples are false as written: the target of the differential is the ideal

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 667 (Layer 3 Examples): "the perfect complex [ℤ_p→pℤ_p] has H⁰=0 and H¹=𝔽_p"; line 1189 (Layer 6 Examples): "the complex A→tA in degrees zero and one has H⁰=0 and H¹=A/(t)".

   **Claim:** A two-term complex with a torsion `H¹`.

   **Witness:** Read as written, the degree-one term is the ideal: multiplication by p maps `ℤ_p` onto `pℤ_p`, so `H¹=pℤ_p/pℤ_p=0`, and likewise `A→tA` has `H¹=tA/tA=0`. The values `𝔽_p` and `A/(t)` need the target `ℤ_p`, respectively `A`. Line 1081 writes the same complex correctly as "[A --t→ A]".

   **Exact repair:** line 667: "the perfect complex [ℤ_p --p→ ℤ_p] has H⁰=0 and H¹=𝔽_p". Line 1189: "the complex [A --t→ A] in degrees zero and one has H⁰=0 and H¹=A/(t)".

   **Repair test:** `ℤ_p --p→ ℤ_p`: kernel 0, cokernel `ℤ_p/p=𝔽_p`. `A --t→ A` over `A=F⟨t⟩`: kernel 0, cokernel `A/(t)`; derived fibre at `t=0` is `F --0→ F`, so `H⁰=H¹=F`, the values the next sentence of line 1189 states.

3. **F03** (P3) Layer 3 and Layer 4 Dependencies disagree with their Needs lines

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 821 (Layer 4 Dependencies) and line 671 (Layer 3 Dependencies).

   **Claim:** Each layer's Dependencies list is the union of what its sections need from outside the layer.

   **Witness:** Line 799, §4.8: "*Needs:* §4.5; §2.7; §3.3; §4.6; …"; line 821 has §3.4, §3.5, §3.8 and no §3.3. Line 821 lists §2.1, which no Needs line of §§4.1–4.9 names. Line 671 lists "AutomorphicBundlesPartII §2.2", which no Needs line of §§3.1–3.8 names (it is used by §2.6 and §4.1).

   **Exact repair:** line 821: add "§3.3" and delete "§2.1;". Line 671: delete "AutomorphicBundlesPartII §2.2;".

   **Repair test:** a script comparing, layer by layer, the union of the Needs items outside the layer with the Dependencies line gives empty differences for Layers 1, 2 and 5–9 now, and for all nine after the three edits. The dependency check is unaffected (the roadmap-level edges stay the same: AutomorphicBundlesPartII §2.2 remains in Layers 2 and 4).

Three findings, all P3, none blocking. All five findings of round 9 are repaired, and the repaired §9.8 route holds against Pilloni-Singular §14.9 and the cited supplier sections. The mathematics of the fifteen sampled sections and the ten headlines agrees with the sources. What remains is one locator, two Examples whose notation makes them false as written, and two Dependencies lists that disagree with their layer's Needs lines. The four reviewed files were not edited; no manifest entry was added (all four sources are recorded and were read).

## Previous findings (round 9)

| Prior finding | Repaired passage in `packages/HigherHidaAndColemanTheory/README.md` | Status |
|---|---|---|
| F01 (P2): §9.8 re-proves the spherical half of §14.9 | Line 1549: "the integral operator T_p,2=p⁻³T′_(p,2) on RΓ(X^≥1,Ω(k,2)(−D)) is AlgebraicModularFormsAndSerreWeightsPartII §7.3 at (d,r)=(k,2)"; contract subsection at line 72; scope bullet at line 21; spherical Check deleted | **Repaired.** The four cited sections read at that roadmap's head (below). |
| F02 (P2): "positive valuation" | Line 1549: "have only eigenvalues of nonnegative valuation on these cohomologies"; new Check at line 1556; E16 | **Repaired.** Pilloni-Singular line 4719–4737 assumes `v(α)<0`. |
| F03 (P3): §2.8 third Check | Line 498: "Of (c), this instance satisfies the hypotheses of the first conclusion only." | **Repaired.** Recomputed (table). |
| F04 (P3): two BP-Coleman pages | Line 854: "Example 3.3.9 and Definition 3.3.10, p. 40"; line 885: "Theorem 5.4.3, p. 109" | **Repaired.** |
| F05 (P3): manifest | `sources.toml`: E13, E14, E16 in `cited_for`; the listed locators added | **Repaired.** |

None was marked not actionable. No maintainer notes were left for this roadmap.

Pattern sweep. The repaired patterns were looked for in the whole package:

- An owned input left uncited: the new route cites AlgebraicModularFormsAndSerreWeightsPartII §§7.1–7.4 and the new gap for the Klingen model; AutomorphicBundlesPartII §4.2 was read for a second owner and asserts no integral p-operator. None found.
- A source misprint restated: none in the text the repair added.
- Page ranges: every "kind number, p. N" pair was checked again by script; three slips (R01).
- A Check or Example that its own section refutes: two Examples (R02).

## Verified sound

### Coverage

Read all of `README.md` (1613 lines, 66 numbered sections in nine layers), `Suggested.lean`, `metadata.toml`, `sources.toml` and the ten `gaps` of `design/plan.json`. The passages the last repair changed (§2.8 third Check, §§5.2–5.3 pages, §9.8 route, Checks and closing remark, the new contract subsection, the new gap, E16) were reviewed in full against the sources. The fifteen sampled sections were read against the source texts. For the other sections the round-9 rows with computed values were relied on, and those listed in the table below were recomputed.

### Principles

No route-specific shortcut (every genus, every prime including 2, quasi-split abelian type, singular weights kept; Pilloni-Singular has no restriction on p, line 70–96). No second plan of a roadmap on main. No upward supply, no algorithm, no sorried data, no `set_option`. Other roadmaps' texts and the sources were treated as data; none asked for an action.

### Seeded source sample (15 of 15 read; the author flagged no locator as unverified)

| Target | Text read | Outcome |
|---|---|---|
| §1.2 | BP-Coleman line 5630–5648 (§5.9, Lemma 5.9.1, p. 121), 5667–5699 (Conj. 5.9.2, Thm 5.9.6, p. 122), 6022–6032 (Def. 5.11.2, p. 130), 6210–6215 (Def. 5.11.14, p. 134) | Supported: `A_w`, `a_w`, the disjunction of two failures, the cocharacter test. |
| §3.5 | BP-Hida line 2647–2661 (Prop. 4.4.5 and proof, p. 51) | Supported: independent of t, perfect, locally algebraic with algebraic part ν. |
| §3.6 | BP-Hida line 2666–2674 (Thm 4.5.2, Remark 4.5.3, p. 51; proof from line 2689, p. 52) | Supported: indexing `ℓ(w)=p`, `H^(p+q)`, sum over `C(κ)`; model-dependence of abutment. |
| §3.8 | BP-Hida line 184–196 (§1.4, p. 4), 2234–2249 (§4.2, pp. 43–44), 2954–2955 (p. 57) | The source gives the correspondences and "image of the Hecke algebra"; the ring-homomorphism statement is the roadmap's own target, stated as such. |
| §4.2 | BP-Hida line 1268 (Prop. 2.8.2, p. 25; proof to p. 27), 2800–2810 (Prop. 5.2.5, p. 54) | Supported; equal torus parts required. |
| §4.5 | BP-Hida line 2919–2926 (§5.4, Lemma 5.4.1, p. 56), 2930–2953 (Lemma 5.4.2, Remark 5.4.3, p. 57) | Supported: `M_w`, perfectness, double dual, specialization at −ν. |
| §5.2 | BP-Coleman line 2177–2187 (min, max, p. 45), 5209–5235 (Def. 5.4.10, Example 5.4.11, pp. 111–112), 5236–5262 (Thm 5.4.12 and proof, p. 112) | Supported with the relative lower bound of E13, which I recomputed (table). |
| §5.3 | BP-Coleman line 5236–5251 (Thm 5.4.12), 5252–5262 (proof: Lemma 2.5.19, Cor. 5.3.8, Lemma 3.5.11) | Supported: action of `T^s`, potent compact, independence of the pair. |
| §6.4 | BP-Coleman line 7362–7372 (Thm 6.5.2, Remark 6.5.3, p. 160) | Supported: `Tor_(−p)` of `H^q` against `k(x)`, window `h′`. |
| §6.9 | BP-Coleman line 7416 (Thm 6.6.1, p. 161), 7557, 7603, 7660–7675 (Thms 6.7.1–6.7.3, pp. 164–167) | Supported, including torsion-freeness over a domain from the truncated perfect complex. |
| §7.1 | BP-Coleman line 7716 (§6.9, p. 168), 7771 (Thm 6.9.3, p. 169) | Supported: locally quasi-finite, partially proper. |
| §8.2 | BP-Hida line 3064, 3114 (Props 6.1.7, 6.1.11, pp. 59–60), 3150–3157 (Prop. 6.2.3, p. 61), 3170–3207 (Prop. 6.2.7, §6.2.8, Thm 6.2.9 and proof, pp. 61–62) | Supported: t acts, ordinary part is higher Hida, rationalization, lattice on slope ≤h. |
| §9.3 | BP-Coleman line 6548–6556 (§5.14.3, p. 141) | Supported; table recomputed at κ=(5,3;−8). |
| §9.4 | Pilloni-Singular line 2483–2495 (§9.1, Lemma 9.1.1.1, p. 54), 2560–2584 (§9.3, pp. 55–56), 2585–2597 (§9.4), 3101 (normalization `p^(−3−r)`), 3293–3303 (Thm 11.3.1, p. 71) | Supported: étale affine transitions, `F_κ` invertible over the completed extension, colimit then limit. |
| §9.9 | BP-Coleman line 5377, 5491, 5551 (Thms 5.6.1, 5.7.2, 5.7.3), 7660 (Thm 6.7.3), 7872–7887 (Thm 6.9.7, p. 171) | Statement supported; locator incomplete and pages off: **R01**. |

Also read for the repairs: Pilloni-Singular line 4677–4833 (all of §14.9), 1154–1156 (Prop. 6.1.4.1, p. 26), 1286–1292 (Thm 6.1.5.1(3)–(4), p. 29), 3283–3289 (Cor. 11.2.1), 82–96 (Thm 1.1); BP-Coleman line 7510–7545 (Lemma 6.6.4), 7935–7984 (Thms 6.10.1–6.10.3).

### Adversarial table (sampled targets, headlines, targets touched by findings)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.2 proved region implies sharp region | general w | `A_w−a_w=w⁻¹w0Mρ+ρ`, dominant-pairing ≥0 (Remark 5.9.4); `A_w−a_w−w⁻¹2ρ_nc=ρ−w⁻¹ρ≥0` since `w0Mρ−2ρ_nc=−ρ`. So `λ≥A_w` gives both proved inequalities | Holds |
| §1.1 dual and GL₂ example | ν=0, GL₂ | `κ_1=−2ρ=(1,−1)` (weight 2), `κ_s=ρ−ρ=0` | Holds |
| §2.2 strict contraction | Frobenius on ℙ¹, `D−=V(t)` | `I=(t)`, `I′=(t^p)`: `(I′)¹⊂I^p`, s=1/p<1. Identity: `(u^a)⊄(u^b)` for a<b | Holds |
| §2.7 degree witness | ℙ¹ over 𝔽₂ | `RΓ(Ω¹[1])`: `H^(−1)=0`, `H⁰=𝔽₂`; dual `𝔽₂[0]` | Holds |
| §2.8 third Check | σ(a)=a, σ(b)=a, σ(c)=b | `σ⁻¹{b,c}={c}`, `σ⁻¹{c}=∅`; `T(f)=(f(a),f(a),f(b))`, `T²(f)=(f(a),f(a),f(a))`, `T³=T²`; ordinary parts both `𝔽₂[0]`; `T(e_b)(c)=1` while `σ*O(D+)_c=0` | Holds as reworded |
| §3.2 unit part | GL₂, k=2, p=3 | `ν_id=(−1,−1)`, `ν_long=(0,−2)`; t=diag(2,3): 1/6, 1/9, `c=3/2`; t=diag(2,6): 1/12, 1/36, `c=3` | Holds |
| §3.5, §3.6 | g=1, k=2 and k=1 | k=2: one column, `C_id`; k=1: two columns in degrees 0, 1, no degeneration claimed | Holds |
| Layer 3 Example | `[ℤ_p→pℤ_p]` | as written `H¹=0`; with target `ℤ_p`, `H¹=𝔽_p` | **R02** |
| §3.8 Hecke relation | ℓ=3, ℓ=2 | `(ℓ+1)²=(ℓ²+ℓ)+(ℓ+1)`: 16=12+4, 9=6+3; modulo 9 the all-ones assignment reads 1=4 | Holds |
| §4.5, §4.6 (headline) | `ν(u)=u^k`; `R=C⁰(T′,ℤ_p)[0]` | `[u]↦u^(−k)`; `M=Λ′[0]`; Remark 5.4.3 specializes at −ν | Holds |
| §4.8 (headline) | g=1; g=2, w=s1 | `w*=w0M·w·w0`: id↔long, degrees 0+1=d; g=2: ℓ(w*)=3−1=2, amplitudes [1,3] and [0,2] | Holds |
| §4.9, §8.4 (headlines) | g=1, 2, 3 | g=2: `[ℓ(w),3]` and `[0,ℓ(w)]`; g=3 rational `[ℓ(w),6]` only (Cor. 6.2.17 after inverting p) | Holds |
| §5.2 relative bound, E13 | standard pair `U=B(s,−1)`, `Z=B(cl 0,cl s)`, s≥1 | Absolute: `B(m,·)⊂U` forces m≥s, `U⊂B(Cm,−1)` forces Cm≤s; both hold only for C=1. Relative, m=n=0: `U∩B(0,cl s)⊂Z`, `Z∩U⊂B(0,cl 0)`, `B(s,cl 0)⊂U⊂B(0,−1)` all hold | Holds |
| §5.3 | pair inside `(U_m,Z_n)` | `U⊂B(Cm,−1)⊂U_m`; `U∩Z_(n+s)⊂U∩B(m,cl(n+s))⊂Z∩U⊂B(0,cl(Cn))⊂Z_n`; `U_(m+s)∩Z_n⊂B(m+s,cl n)⊂U` | Holds |
| §5.8 (headline) | GL₂, k=2 and k=1 | k=2: threshold 2 for `U_naive`, 1 for `U_std`, endpoint excluded; k=1: both chambers | Holds |
| §6.4 | `A=F⟨t⟩`, `[A --t→ A]` | `H⁰=0`, `H¹=A/(t)`; `E2^(−1,1)=Tor₁(A/(t),F)=F` in total degree 0 | Holds |
| Layer 6 Example | "A→tA" | as written `H¹=0` | **R02** |
| §6.5 Check | SL₂, κ=1, t=diag(p,p⁻¹) | `d²/dz²(z²)=2≠0`; slopes 0,2,4 twisted by −1 give −1,1,3 | Holds |
| §6.9 | perfect complex with fibres in `[ℓ,d]` | truncation `τ_(≥ℓ)` stays perfect, so bottom `H^ℓ` embeds in a projective module: torsion-free over a domain (line 7671–7675) | Holds |
| §7.1, §7.5 (headlines) | acyclic family; `H¹` only; `t:A→A` | empty Z and E; nonempty support; image (t) with fibre F against specialized image 0 | Holds |
| §7.6 degree-zero statement | singular κ with id∈Cκ+ | Cκ+ is the stabilizer `W_J` of the M-regular dominant weight `−w0M(κ+ρ)`; each `s_α`, α∈J, is noncompact simple, of length 1 and in `MW` | Holds |
| §7.6, §8.5 (headlines), §9.3 | κ=(5,3;−8) | `A_w=(0,2),(−2,2),(3,−3),(−5,−3)`; with (−½,−½;−½): 3,4,4,8; with (0,−1;−1): 6,6,11,11; wrong-basis cocharacter (−½,−3⁄2;−½): 1,2,7,11 | Holds |
| §9.1 | ν=(0,−2); ν=(1,1−k) | (5,3),(5,1),(2,−2),(0,−2); `κ_0=κ_1=(k+2,2)` | Holds |
| §9.4 | r=2 | normalization `p^(−3−r)=p⁻⁵` (line 3101); Ω(k,2) has weight (k+2,2) | Holds |
| §9.5 criterion | (1,1,9,9), p=3; (1,1,p,p) | Ratio set `{χ₁^±1,χ₂^±1,(χ₁χ₂)^±1,(χ₁/χ₂)^±1}`; values 1, 9, 1/9, none 3: irreducible. `γ/α=p`: excluded | Holds |
| §9.6(4) | k=0, k=3; p=3, f=z | third-term slopes ≥k−2, ≥k+1 on `H⁰`: (−2,1), (1,4); `D(Uf)=3=p·U(Df)`; antiderivative of `Σ2^m z^(2^m−1)` has coefficients 1 | Holds |
| §9.8 Klingen divisibility | H multiplicative; H étale, cases 1–4 | 2+1=3, 0+3=3; `k+4`, 2+1=3, 2+3·1=5, 0+3·1=3 (the last two need `I^(−3)`): each ≥3 (line 4803–4832) | Holds |
| §9.8 restriction | depth | lci over `ℤ_p` gives Cohen–Macaulay reductions; rank-zero locus of the Klingen special fibre has dimension 1 in dimension 3; `H⁰_Z=H¹_Z=0` | Holds, on the declared gap |
| §9.8 eigenvalue Check | (1,1,9,9), p=3 | `α+β+γ+δ=20`; orbit of `α+β`: 2, 10, 10, 18; valuations 0; 0, 0, 0, 2 | Holds |
| §9.8 (headline) | k=0; p=2 | threshold `k+2r−3=1` contains slope 0; torsion statement from k=4 at p=2 (Thm 1.1(2), Cor. 11.2.1) | Holds |
| §9.9 | n=2, ν=(4,2,0) | `ν+ρ=(5,2,−1)`; `w_1x=(5,−1,2)`, `w_2x=(2,−1,5)`; weights (−3,−5,2), (0,−5,−1), (0,−2,−4), each M-dominant; `w_2⁻¹(1)=2<3=w_2⁻¹(2)`, so `w_2∈MW` | Holds; locator **R01** |

### Library declarations opened at the pin

- `Module.End`: `Mathlib/Algebra/Module/LinearMap/End.lean:33` (an `abbrev` over `[Semiring R] [AddCommMonoid M] [Module R M]`).
- `zpow_sub₀`: `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402` (`a ≠ 0`).
- `HasDerivedCategory` and `DerivedCategory`: `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74` and `:87`.
- `CondensedMod` and its `Abelian` instance: `Mathlib/Condensed/Module.lean:41` and `:43`.
- `CondensedMod.IsSolid`: `Mathlib/Condensed/Solid.lean:83`, with the limiting docstring at 74–82.

All are as the README states. These six are the only backticked identifiers in the README and none is presented as this roadmap's own. A search of the pinned Mathlib and Tau Ceti for Igusa towers, Shimura varieties and Iwasawa algebras finds no carrier.

### Duplication and ownership

`roadmaps resolve` on the README: no citation and no Lean name found nowhere. Section headings were opened at the heads for the citations the repair added or that this round sampled:

- AlgebraicModularFormsAndSerreWeightsPartII §7.1 (finite `p₁` with Σ″=Σ on `X^(≥1)`), §7.2 (first Check `4+0, 2+1, 0+3`; `r=1` excluded), §7.3 (`p³T=T′`, canonical and subcanonical), §7.4 (`H⁰` bijective, `H¹` injective, n≥1 and n=∞). The four contract bullets agree with them. That roadmap does not cite this one.
- SolidAnalyticRings §§7.2–7.4: §7.3 does treat discrete animated Huber pairs and the polynomial structures, and its consumers paragraph leaves the localization kernel and triangles to this roadmap's two gaps.
- ShimuraCompactifications §7.19 ("Finite normalizations at higher p-level"): no moduli model, so the new gap asks for nothing supplied.
- AutomorphicBundlesPartII §4.2: "no integral p-operator or ordinary projector is asserted here", so it is no second owner of the §9.8 operators; §§3.0a, 3.0b, 3.13, 4.4, 5.1, 5.13 exist.
- PadicFamilies §§0a.24–0a.25, 2a.15–2a.17; SmoothRepresentationsOfLocalGroups §§SR.1.4, SR.3.4, SR.4.5; AdicSpacesPartIII §§R3.1, R3.4, R3.6, R3.8; AdicSpacesPartIV §F1.10; PerfectoidShimuraVarieties §§3.13, 6.10, 6.12, 6.13a, 6.14, 6.15; HodgeTateAndCanonicalSubgroups §5.1: headings present.

`scratch/overlaps.md` lists no dropped id, no id defined only by an open revision, no second copy and no conflicting head. PadicFamiliesPartII (merge order line 256, after this roadmap at 255) consumes §§1.1, 2.3, 9.1, 9.4–9.8 here; the former-numbering table of Layer 5 keeps the ids it cites.

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms (and GSp4NonregularModularityLifting, AlgebraicModularFormsAndSerreWeightsPartII); shared objects: the spherical integral `T_p,2`, its trace divisibilities and codimension-two restriction — owner AlgebraicModularFormsAndSerreWeightsPartII §§7.1–7.4, cited; the Klingen complex `M_Kli`, its control and the Klingen `I^(−3)` operator for F=ℚ — owner this roadmap §§9.4, 9.8, consumed by PadicFamiliesPartII; individual coherent Hecke operators and the coherent tower — owner AutomorphicBundlesPartII §§3.13, 4.4; analytic coefficient sheaves — owner OverconvergentAutomorphicForms §§8.6–8.7.

### Supplier order

    depcheck: 242 roadmaps, 2212 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. AlgebraicModularFormsAndSerreWeightsPartII is line 249 of the merge order, this roadmap line 255. No forbidden roadmap is cited. Inside the roadmap, no Needs line names a later section (checked by script over all 66 sections).

### Declared gaps

All ten slugs appear in `design/plan.json` and under `## Exact supplier contracts` with the same supplier and section; eight `needs` sentences are identical and two (coherent-correspondences, klingen-lci-model) differ only by added page locators and "two closed subschemes". Each names a supplier and asks for an extension the supplier's section does not state. The new `gap:klingen-lci-model` matches Pilloni-Singular Proposition 6.1.4.1 and Theorem 6.1.5.1(3)–(4). No dependency is written as supplied that should have been a gap.

### Shape, Lean form and padding

Summary, scope, conventions, contracts, build guide, nine layers each ending in Examples and Dependencies, consumers, references: present. 36 sections carry Checks; every section that defines an object has at least three (the two with one Check, §5.6 and §8.3, are theorems). No LaTeX delimiters, pull-request numbers, paths, HTML anchors or process words. Dependencies lists: R03.

`lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace. It declares nothing, so the one-tactic probe and the `#check @name` comparison have empty domains and there is no padding.

Headline theorems (README line 292): §4.6, §4.8, §4.9, §8.4, §5.8, §7.1, §7.5, §7.6, §8.5, §9.8. Each is named in the module docstring with the carrier it lacks. None is statable at the pins: each needs Siegel or abelian-type Shimura varieties, Igusa towers or supported coherent cohomology.

### Copyright, licences and scope

Wording: the fifteen sampled statements and six further passages (the §9.8 Klingen-correspondence sentence against Pilloni-Singular line 4766–4779, the §9.8 nonnegativity deduction against line 4719–4737, the new gap sentence against line 1154–1156 and 1286–1292, §6.9 against BP-Coleman line 7660–7675, §7.5 against line 7872–7887, the module docstring) were set beside the sources. No shared run beyond formulas and standard names; the longest is four words.

Arrangement: BP-Coleman has 70 of 156 source mentions. Its contents (BP-Coleman line 17–75) against Layers 5–7:

- Layer 5 draws on source §§4.5–4.6, 5.4, 5.1/5.3/5.4, 5.4, 5.9, 4.1/5.6/5.7/2.7, 5.5/5.7/5.8, 5.12, in that order.
- Layer 6 draws on §§6.3, 4.4/4.6/6.6, 6.4, 6.1, 6.5, 6.2, 6.5, 6.8, 6.8, 6.6–6.7, 6.9.
- Layer 7 draws on §§6.9–6.10, where the Needs lines of §§7.2–7.6 force the order.

No one-to-one run that the dependencies leave free; the order of Layers 5, 6, 7 is forced by §6.2 (needs §§5.2–5.3) and §7.1 (needs §§6.3, 6.9, 6.10), and that of Layers 2, 3, 4 by §3.3 (needs §2.2), §3.5 (needs §§2.5–2.6) and §4.1 (needs §3.5). Reuse: no table, figure or data taken over; the §9.3 values are recomputed at a chosen weight, not the source's table.

Source independence: 21 passages compared with 4 sources, none shared; largest share BP-Coleman, 70 of 156 locators; contents compared with BP-Coleman: independent.

## Not verifiable

- The journal paginations of BP-Hida and Pilloni-Singular: the README cites the author editions only, and those were read.
- Reference [24] of Pilloni-Singular, to which the proofs of Propositions 5.1.5.1–5.1.5.2 defer: not opened. The README gives its own route for the criterion, whose parameter algebra I checked against the standard irreducibility conditions.
- BP-Hida §2.11 (source issue E15) and Pilloni-Singular §5.1.5 (E9) were not reread this round; round 9 read them and no repair touched the passages.

## Source issues

- **Error** in BP-Coleman at Definition 5.4.10 with Example 5.4.11, printed pp. 111–112: the source says the whole tube of depths (m, n+s) lies in Z∩U and that every standard pair qualifies; it should be that tube intersected with U, since the absolute bound fails once max(t)≥2; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 14.9.1, printed p. 102: the source says the two operators have only eigenvalues of positive valuation; it should be nonnegative valuation, which is what the proof on pp. 103–104 shows; affects a stated result.

## For the human reviewers

- Licence: BP-Hida, BP-Coleman and Pilloni-Singular are read from the author's page (`licence_class = "author-page"` in `packages/HigherHidaAndColemanTheory/sources.toml`); BP-Coleman's locator edition is an unpublished 180-page revision of arXiv:2110.10251.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c88b41daa0d7c0f749f2bfd431e2a2964636b891", "job": "REV-PKG-HigherHidaAndColemanTheory~10", "model": "fable", "worker": "chris-x29"} -->
