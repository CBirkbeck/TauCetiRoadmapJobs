<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6871358946 -->
Review (claude) of 5673023

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) §5.1 states as its own target what PerfectoidShimuraVarieties §§6.13a, 6.14 and 6.15 state

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 842 (§5.1): "Use the general abelian-type toroidal diamond and its Hodge–Tate period map to form finite-level topological inverse images of Bruhat cells and tubes. … The de Rham Levi torsor admits reductions over the truncated cells compatible with finite Hecke correspondences." Line 844 gives a proof route; lines 5–23 (Scope and ownership) do not name PerfectoidShimuraVarieties.

   **Claim:** §5.1 is a target of this roadmap, with locators BP-Coleman Theorem 4.5.2 and Propositions 4.6.12, 4.6.14–4.6.15 and 4.6.19.

   **Witness:** PerfectoidShimuraVarieties (open roadmap, earlier in the merge order), read at its head:

   - §6.13a "Finite-level truncated period maps and Bruhat domains" constructs `π_HT,K_p` and `π^tor_HT,K_p` for abelian-type data and proves that the inverse image of each `K_p`-stable tube is an open analytic domain, compatibly with level, cone refinement and both Hecke legs.
   - §6.14 states the reductions `M_dR,m,n,K_p` for abelian-type quasi-split data, citing Propositions 4.6.12, 4.6.14 and 4.6.15, with the same enlargement of F.
   - §6.15 (Bruhat clause) states their Hecke maps, citing Proposition 4.6.19, and the identity `M_HT = M_dR ×^(μ,ℤ_p^×) ℤ_p(1)`.
   - The remaining sentence of §5.1 (affinoid inverse images at classical flag points, Theorem 4.5.2) is `gap:abelian-affinoid-basis`, which this README hands to the same supplier.

   So every sentence of §5.1 is either stated by the supplier or contracted to it. The object has two owners, and the section does not say how it differs.

   **Exact repair:** keep the heading and number (PadicFamiliesPartII cites §5.1), delete the target statement and the proof route, and state the owners.

   1. Replace line 842 by: "This section states no target of its own. It records, with their owners, the finite-level geometry on which §§5.2–5.8 and Layers 6–7 are built. PerfectoidShimuraVarieties §6.13a owns the truncated period maps to the orbit space of the flag variety under K_p, on the minimal and the toroidal compactification, and the open analytic inverse images of the K_p-stable Bruhat tubes of its §6.13, with their compatibility with change of level, cone refinement and both Hecke projections. Its §6.14 owns the reductions of the de Rham Levi torsor over these tube preimages, for F so large that the cyclotomic µ-image lies in the reducing subgroup. Its §6.15 owns the Hecke maps of these reductions and the identification of the Hodge–Tate Levi torsor with the cyclotomic µ-twist of the de Rham torsor. The affinoid inverse images, in the minimal compactification, of small neighbourhoods of classical flag points are gap:abelian-affinoid-basis. None of this asserts that the general toroidal tower is a perfectoid space, or that the finite-level period map is an algebraic morphism. (BP-Coleman, Theorem 4.5.2, p. 88; §4.6, pp. 89–98.)"
   2. Delete line 844 (the proof route). Keep the Needs line 846 and the closing remark of line 848.
   3. Add to Scope and ownership: "PerfectoidShimuraVarieties §§6.3, 6.8 and 6.10 owns the Hodge–Tate period maps of abelian-type towers, §6.13 the Bruhat tubes, §6.13a their finite-level inverse images, §6.14 the reductions of the de Rham Levi torsor over them and §6.15 their Hecke maps; §5.1 records these and states no target. Layer 5 owns what is built on them: the allowed support pairs, the supported cohomology and its finite-slope theory (§§5.2–5.8)."
   4. Line 826: "After the imported Bruhat geometry (§5.1), the supported objects, their finite-slope continuation and their level control (§§5.2–5.4), …".

   **Repair test:** after the edit each of the four statements of the old §5.1 has exactly one owner (§6.13a; §6.14; §6.15; the gap). The Needs lines of §5.2, §6.1a and the Dependencies of Layers 5 and 6 still resolve, because §5.1 and its Needs line remain. The dependency check is unchanged (the same roadmap-level edges).

2. **F02** (P3) "light table" is not a defined term

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1410 (§9.1): "Define the light table κ_0=(3−ν2,3−ν1), κ_1=(3−ν2,ν1+1), κ_2=(2−ν1,ν2), κ_3=(ν1,ν2)."

   **Claim:** A named object of the section.

   **Witness:** "light table" is neither the literature's nor Mathlib's name and is not defined in the README. The same paragraph ends "The two-coordinate table alone does not define a GSp₄ weight", which is the meaning intended.

   **Exact repair:** "Define the two-coordinate weights κ_0=(3−ν2,3−ν1), κ_1=(3−ν2,ν1+1), κ_2=(2−ν1,ν2), κ_3=(ν1,ν2)."

   **Repair test:** the values are unchanged. Recomputed from `κ_w=−w0M w(ν+ρ)−ρ` with `ν+ρ=(a,b)`: `(1−b,2−a)`, `(1−b,2+a)`, `(1−a,2+b)`, `(a+1,b+2)`. At ν=(0,−2) these are (5,3), (5,1), (2,−2), (0,−2).

3. **F03** (P3) §9.3 closing remark calls the weaker bound "stronger"

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1451 (§9.3): "The stronger pre-comparison estimate for U2 has k2 in its middle entries; Layer 8 justifies k2+1."

   **Claim:** The estimate with k2 is stronger than the one with k2+1.

   **Witness:** These are lower bounds on slopes, and k2 < k2+1, so the bound with k2 is the weaker one. At κ=(5,3;−8), w=s1: `a_w=(−3,5;−8)` and `a_w+w⁻¹2ρ_nc=(0,2;−8)` both pair with t2 to 3=k2, while `A_w=(−2,2;−8)` pairs to 4=k2+1. BP-Coleman line 6557–6562 and 6573–6574 give the same. "Pre-comparison estimate" is also undefined.

   **Exact repair:** "The bounds proved in §5.5, before the comparison of Layer 8, give only k2 in the two middle entries for U2, so the test they support is the more restrictive v_p(U2_naive)<k2; §8.5 justifies k2+1."

   **Repair test:** at κ=(5,3;−8) the §5.5 test is slope <3 and the §8.5 test is slope <4, so slope 3 passes only the second. This agrees with the third Check of §9.3 (U2_naive bounds 3,4,4,8).

Three findings: one P2 (an ownership overlap with a supplier) and two P3 (wording). All three round-10 findings are repaired. The fifteen sampled sections agree with the source texts at their locators, and every cross-roadmap citation resolves at the supplier's head. The four reviewed files were not edited and no manifest entry was added.

## Previous findings (round 10)

| Prior finding | Repaired passage in `packages/HigherHidaAndColemanTheory/README.md` | Status |
|---|---|---|
| F01 (P3): §9.9 locator, and pages at §5.6(b) and §6.1a | Line 1564: "Theorem 5.6.1, p. 115; Theorems 5.7.2 and 5.7.3, pp. 118–119; Theorem 6.7.3, p. 167; Theorem 6.9.7, pp. 171–172". Line 925: "Theorems 5.7.1–5.7.3, pp. 117–119". Line 1014: "Lemma 6.6.4 and its proof, pp. 163–164" | **Repaired** |
| F02 (P3): two Examples with the ideal as target | Line 667: "the perfect complex [ℤ_p --p→ ℤ_p] has H⁰=0 and H¹=𝔽_p". Line 1189: "the complex [A --t→ A] in degrees zero and one has H⁰=0 and H¹=A/(t)" | **Repaired** |
| F03 (P3): Dependencies of Layers 3 and 4 | Line 671 no longer lists AutomorphicBundlesPartII §2.2. Line 821 lists §3.3 and no longer lists §2.1 | **Repaired** |

None was marked not actionable. No maintainer notes were left for this roadmap.

Pattern sweep on the repaired patterns:

- Bracketed two-term complexes: lines 42, 667, 1081, 1189 and 1529 all name the ring as the degree-one term.
- Dependencies against Needs: the repaired Layers 3 and 4 were read against their Needs lines and agree.
- Page pairs: the pages of the fifteen sampled sections were checked against the page markers of the source texts; no slip (table below).

## Verified sound

### Coverage

Read all of `README.md` (1613 lines, nine layers), `Suggested.lean`, `metadata.toml`, `sources.toml` and the gap list of `design/plan.json`. The seven lines the last repair changed were reviewed in full. The fifteen sampled sections were read against the source texts. For sections outside the sample and untouched by the repair, the round-10 rows with computed values were relied on; those in the table below were recomputed.

### Principles

- No route-specific shortcut: every genus, every prime including 2, quasi-split abelian type, singular weights kept.
- No second copy of a roadmap on main; no upward supply; no algorithm; no sorried data; no `set_option`.
- Other roadmaps' texts and the sources were treated as data. None asked for an action.
- One restated supplier target: R01.

### Seeded source sample (15 of 15 read; the author flagged no locator as unverified)

| Target | Text read | Outcome |
|---|---|---|
| §2.5 | BP-Hida line 1039–1056 (§2.6.1, Prop. 2.6.2, Remark 2.6.3, p. 21), 1132–1150 (§2.6.12, Prop. 2.6.13, pp. 22–23) | Supported: F is A-flat, M of finite type, finite S′→S, X and S′ Tor independent. |
| §2.8 | BP-Hida line 1480–1495 (Lemma 2.10.1, p. 29), 1553–1575 (Prop. 2.10.3, p. 30), 1576–1636 (Prop. 2.10.4, pp. 30–31), 1637–1730 (§2.11, Thm 2.11.4, pp. 31–33) | Supported. The printed cross-containment at line 1651–1652 has p1 and p2 exchanged against line 1581–1582; the README uses the corrected direction (its E15). |
| §3.3 | BP-Hida line 2582–2598 (Lemma 4.4.2, p. 50), 2600 (Cor. 4.4.3), 2634–2638 (Prop. 4.4.4, p. 51), 2768–2775 (Thm 5.1.4, p. 53) | Supported: every s≥0, every decomposable compact, t in T++. |
| §3.8 | BP-Hida line 184–190 (§1.4, p. 4), 2234–2249 (§4.2, p. 43), 2954 (p. 57) | The source gives the abstract spherical algebra and its image; the ring-homomorphism statement is the roadmap's own target, stated as such. |
| §4.6 | BP-Hida line 2876–2885 (Prop. 5.3.3, p. 55), 2891–2911 (Thm 5.3.5, p. 56), 2912–2918, 2941–2953 (Remark 5.4.3, p. 57) | Supported: `RHom_(T_K)(ν,·)`, specialization at −ν, κ=−w0M w(ν_alg+ρ)−ρ. |
| §4.7 | BP-Hida line 2954–2955 (p. 57) | Supported: image of the Hecke algebra in the endomorphisms, finite over Λ. |
| §5.1 | BP-Coleman line 4153–4168 (Thm 4.5.2, p. 88), 4211 (§4.6, p. 89), 4427, 4459, 4476, 4561 (Props 4.6.12, 4.6.14, 4.6.15, 4.6.19, pp. 94–97); §5 starts on p. 99 | Locators correct. Ownership: **R01**. |
| §5.4 | BP-Coleman line 5274–5291 (Thm 5.4.14, p. 113) | Supported: pullback for +, trace for −, invariants under `T_b/T_b′`. |
| §6.2 | BP-Coleman line 7225 (§6.4.1, p. 156), 7262, 7282 (Thms 6.4.3, 6.4.5), 7301–7319 (Def. 6.4.7, p. 158), 7322–7337 (Thm 6.4.8, p. 159), 7340–7345 (Thm 6.4.10) | Supported, with the README's E5 (line 7317 prints n for l) and E13. |
| §6.6 | BP-Coleman line 6995 (Thm 6.2.16, p. 151), 7016 (Cor. 6.2.18), 7399–7414 (Thm 6.5.5, pp. 160–161) | Supported: `(w0M w)⁻¹ v (w0M w)·ν_alg`, twist −ν_v in +, ℓ(v)=−p and twist +ν_v in −. |
| §6.10 | BP-Coleman line 7754–7760 (§6.9, p. 169), 3780 (§4.4.41, p. 80), 3926, 3939 (Principle 4.4.44, Thm 4.4.45, p. 84), 4102 (Prop. 4.4.53, p. 87) | Supported; the ring-homomorphism statement is the roadmap's own target. |
| §7.6 | BP-Coleman line 7935–7958 (Thm 6.10.1, pp. 172–173), 7961–7968 (Thm 6.10.2), 7971–7983 (Thm 6.10.3), 7984–7991 (Remark 6.10.4, pp. 173–174), 5784–5797 (Prop. 5.10.2, p. 124) | Supported. The header of Thm 6.10.2(1) prints the strongly-small part while its proof uses the small part (the README's E6). |
| §9.1 | BP-Hida line 1734–1775 (§3.1, pp. 33–34); BP-Coleman line 6548–6550 (§5.14.3, p. 141) | Supported: dominance 0≥k1≥k2, the generators s0, s1 and the four representatives. |
| §9.3 | BP-Coleman line 6548–6579 (§5.14.3, pp. 141–142); BP-Hida line 2989 (Prop. 5.6.3, p. 58), 3114 (Prop. 6.1.11, p. 60), 3210 (Cor. 6.2.10, p. 62) | Supported; values recomputed (table). Closing remark: **R03**. |
| §9.4 | Pilloni-Singular line 2483–2495 (§9.1, Lemma 9.1.1.1, p. 54), 2558–2584 (§9.3, p. 56), 2585–2597 (§9.4), 3060 (§10.7, p. 66), 3293 (Thm 11.3.1, p. 71) | Supported: étale affine transitions, `F_κ` invertible over the completed extension, colimit then limit. |

### Adversarial table (sampled targets, headlines, targets touched by findings)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.5 first formula | A=ℤ/4, X a point, M=𝔽₂; T=id, T=2; non-flat F=𝔽₂ | T=id: `A⊗^L𝔽₂=𝔽₂[0]` on both sides. T=2: T²=0, both sides 0. F=𝔽₂ not A-flat: left side has `Tor_i=𝔽₂` in every degree, right side is `𝔽₂[0]` | Holds; flatness is needed |
| §2.8(b) | two points a,b; pairs (∅,∅), ({a},∅) | `𝔽₂²` against `𝔽₂`; the cross-containment reads {a}⊆∅ and fails | Holds (excluded) |
| §2.8(c), third Check | σ(a)=a, σ(b)=a, σ(c)=b | `σ⁻¹{b,c}={c}`, `σ⁻¹{c}=∅`; T(f)=(f(a),f(a),f(b)), T²(f)=(f(a),f(a),f(a)); both ordinary parts `𝔽₂[0]` | Holds |
| §3.3 | t=1 | identity correspondence: `(u^a)⊄(u^b)` for a<b, so strictness fails; t in T++ is needed | Holds |
| §3.8 Hecke relation | ℓ=2, ℓ=3 | `(ℓ+1)²=(ℓ²+ℓ)+(ℓ+1)`: 9=6+3, 16=12+4; all-ones assignment modulo 9: 1≠4 | Holds |
| §3.8 endomorphism bijection | C=O[0]; C=[O --p→ O] | `O=lim O/p^s`. Second: `End_(D(O))=𝔽_p`; modulo p^s the group is 𝔽_p² and the transition on the `Tor_1` summand is multiplication by p, which is 0, so the limit is 𝔽_p | Holds |
| §4.6 (headline) | ν(u)=u^k | `[u]↦u^(−k)`, as Remark 5.4.3 has it | Holds |
| §4.7 | Λ=ℤ₃[[X]], M=Λ[0], degree character | ring image ℤ·id, not a Λ-module; Λ-span Λ·id of rank one | Holds |
| §4.8, §4.9, §8.4 (headlines) | g=1; g=2, w=s1 | `w*=w0M w w0`: id↔long for g=1; g=2: canonical [1,3], cuspidal partner [0,2] | Holds |
| §5.4 | b′≥b | finite group `T_b/T_b′`, invariants exact over a field of characteristic 0 | Holds |
| §5.8 (headline), §7.6 first Check | GL₂, k=2 and k=1 | k=2: threshold 2 for `U_naive`, 1 for `U_std`, endpoint excluded; k=1: both chambers, no exclusion | Holds |
| §6.2 fourth Check | GL₂, w=id, p=3, C=2, n=1, U=B(1,−1), Z=B(cl 0,cl 1) | `Z∩U=U={v(z)>1}=B(1,1)`; relative bounds hold with m=l=0, s=1; the absolute bound fails at z=3 for m=0 and U⊂B(2,−1) fails at z=9 for m≥1 | Holds |
| §6.6 with §6.7 fourth Check | GSp₄, w=1, v=s0, κ=(k1,k2;−k1−k2) | `ν_alg=(3−k2,3−k1;k1+k2)`; `ν_v=(2−k1,4−k2;k1+k2)` pairs with t2 to −3; `a_an=(3,3;0)` pairs to −3; `w⁻¹2ρ_nc` pairs to 3; thresholds 0 and 3 | Holds |
| §6.6 | GL₂ | `W_M={1}`: one column, `ν_1=ν_alg`, no BGG condition | Holds |
| §6.10 fifth Check | T_ℓ on a non-CM point x | x′=x would give an endomorphism of degree ℓ, not a square; so x′≠x and the pair (U,Z∪{x}) is not preserved | Holds |
| §7.1, §7.5 (headlines) | acyclic family; H¹ only; t:A→A | empty Z and E; nonempty support; image (t) with fibre F against specialized image 0 | Holds |
| §7.6 degree-zero statement | singular κ with id in Cκ+; GSp₄ κ=(5,3;−8) | Cκ+ is the stabilizer `W_J` of the dominant weight `−w0M(κ+ρ)`; J has no compact simple root because κ+ρ is M-regular, so `W_J⊂MW` and contains a length-one element. `−w0M(κ+ρ)=(−1,−4)` is regular, Cκ+={id}; least wrong-chamber pairing 4, so `U2_naive` slopes in [3,4) | Holds |
| §7.6 weight-one Check | k=1 | `αβ=χ(p)` with both of absolute value 1: slope 0 | Holds |
| §9.1 | ν=(0,−2); ν=(1,1−k) | (5,3), (5,1), (2,−2), (0,−2); `κ_0=κ_1=(k+2,2)`; duals `(3−κ2,3−κ1)`: (5,3)↔(0,−2), (5,1)↔(2,−2); `κ_r∨=κ_(3−r)` | Holds; wording **R02** |
| §9.1 lengths | simple roots for ρ=(−1,−2) | positive roots `e1−e2`, `−2e1`, `−2e2`, `−e1−e2`; simple `e1−e2` (compact) and `−2e1`; (a,b)↦(−a,b) has length 1, (−b,a) length 2, (−b,−a) length 3 | Holds |
| §9.3, §7.6, §8.5 (headlines) | κ=(5,3;−8) | `A_w=(0,2),(−2,2),(3,−3),(−5,−3)`; with (−½,−½;−½): 3,4,4,8; with (0,−1;−1): 6,6,11,11; wrong-basis cocharacter (−½,−3⁄2;−½): 1,2,7,11 | Holds |
| §9.3 torus elements | t1, t2 | t2=diag(p⁻¹,p⁻¹,1,1), t1=diag(p⁻¹,p⁻²,1,p⁻¹); products `x1x4=x2x3=p⁻²` for t1; both satisfy `v(t3)≥v(t4)≥v(t1)≥v(t2)` | Holds |
| §9.3 closing remark | κ=(5,3;−8), w=s1 | §5.5 bound 3=k2, sharp bound 4=k2+1 | **R03** |
| §9.4 | r=2 | Ω(k,2) has weight (k+2,2); one weight variable | Holds |
| §9.6(4) | U(f)(z)=f(pz), k=0; k=3 | `D(Uf)=p·U(Df)`; eigenvalue λ↦`p^(−k−1)λ`; third-term slopes ≥k−2 and ≥k+1 on H⁰: (−2,1), (1,4) | Holds |
| §9.8 (headline) | k=0; p=2 | threshold `k+2r−3=1` contains slope 0; torsion statement from k=4 at p=2 | Holds |
| Layer 3 and Layer 6 Examples (repaired) | `[ℤ_p --p→ ℤ_p]`, `[A --t→ A]` | kernel 0, cokernel 𝔽_p; kernel 0, cokernel A/(t), derived fibre F in degrees 0 and 1 | Holds |

### Library declarations opened at the pin

- `Module.End`: `Mathlib/Algebra/Module/LinearMap/End.lean:33`.
- `zpow_sub₀`: `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402` (hypothesis `a ≠ 0`).
- `HasDerivedCategory` and `DerivedCategory`: `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74` and `:87`.
- `CondensedMod` and its `Abelian` instance: `Mathlib/Condensed/Module.lean:41` and `:43`.
- `CondensedMod.IsSolid`: `Mathlib/Condensed/Solid.lean:83`, with the limiting docstring above it.

All are as the README states. These six are the only backticked identifiers in the README, and none is presented as this roadmap's own. A search of the pinned Mathlib and Tau Ceti for Shimura varieties, Igusa towers, Iwasawa algebras and coherent cohomology finds no carrier.

### Duplication, ownership and supplier drift

`roadmaps resolve` on the README: no citation and no Lean name found nowhere. In addition, all 117 cited sections of 22 supplier roadmaps were matched by script against the headings of each supplier, on main or at its open head; none is missing. The following were read in full for content:

- PerfectoidShimuraVarieties §§6.6, 6.8, 6.10, 6.13a, 6.14, 6.15: as cited, and the source of R01.
- OverconvergentAutomorphicForms §8.7: coefficient sheaves, radius and level maps and local projectivity only; no Hecke action and no supported cohomology, so §§6.1–6.2 have no second owner.
- SolidAnalyticRings §7.3: discrete animated Huber pairs and polynomial pairs, "with no geometric localization-kernel assertion", so the two solid gaps ask for nothing supplied.
- ShimuraData §5.5: `ρ_i=−i`, `ρ_nc,i=−(g+1)/2`, compact roots `e_i−e_j`, noncompact `−e_i−e_j`; agrees with §9.1 and with the cocharacter pairing used in §9.3.
- AutomorphicBundlesPartII §4.4 and §5.13: as the contract bullets describe; §5.13 excludes arbitrary p-level.
- LieHighestWeight Layer 3 (on main): enveloping algebra and Verma modules.

`scratch/overlaps.md` lists no dropped id, no id defined only by an open revision, no second copy and no conflicting head. PadicFamiliesPartII (after this roadmap in the merge order) cites §§5.5 and 5.8 in the former numbering; the table of Layer 5 maps them, so the citations stay valid.

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms (and PerfectoidShimuraVarieties, AlgebraicModularFormsAndSerreWeightsPartII); shared objects: finite-level Bruhat domains, torsor reductions and their Hecke maps — owner PerfectoidShimuraVarieties §§6.13a–6.15, restated by §5.1 here (R01); analytic coefficient sheaves — owner OverconvergentAutomorphicForms §§8.6–8.7, cited; individual coherent Hecke operators and the coherent tower — owner AutomorphicBundlesPartII §§3.13, 4.4, cited; the spherical integral operator and its divisibilities — owner AlgebraicModularFormsAndSerreWeightsPartII §§7.1–7.4, cited; the Klingen complex, its control and the Klingen integrality for F=ℚ — owner this roadmap §§9.4, 9.8, consumed by PadicFamiliesPartII.

### Supplier order

    depcheck: 242 roadmaps, 2212 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. This roadmap is line 255 of the merge order; its latest suppliers are AutomorphicBundlesPartII (254) and AlgebraicModularFormsAndSerreWeightsPartII (249). No forbidden roadmap is cited.

### Declared gaps

All ten slugs appear in the `gaps` list of `design/plan.json` and under `## Exact supplier contracts`, each with a named supplier and section. `gap:abelian-affinoid-basis` was checked against PerfectoidShimuraVarieties §6.8(3) and §6.13a: the supplier has an affinoid cover for the infinite-level image-type compactification and no finite-level statement at classical points, so the gap asks for a real extension. No dependency is written as supplied that should have been a gap.

### Shape, Lean form and padding

- Shape: summary, scope, conventions, contracts, build guide, nine layers each ending in Examples and Dependencies, consumers, references. Present.
- Checks: each sampled section that defines an object has at least three (§2.8 four, §3.8 four, §4.7 three, §6.2 four, §6.10 five, §7.6 four, §9.1 three, §9.3 three, §9.4 three).
- Style: no LaTeX delimiters, pull-request numbers, machine paths, HTML anchors or process words (searched by pattern). Vocabulary: R02 and R03.
- Elaboration: `lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean`, run from the content checkout, exits 0 with no output and no warning.
- The Lean file is `import Mathlib`, one module docstring and an empty namespace. It declares nothing, so the one-tactic probe and the `#check @name` comparison have empty domains and there is no padding.
- Headline theorems (README line 292): §4.6, §4.8, §4.9, §8.4, §5.8, §7.1, §7.5, §7.6, §8.5, §9.8. Each is named in the module docstring with the carrier it lacks. None is statable at the pins.
- Manifest: every numbered theorem, proposition, lemma, corollary, remark, definition and conjecture cited in the README lies in the `locator` string of its source (checked by script, ranges included). Four sources, all recorded and read.

### Copyright, licences and scope

Wording: the fifteen sampled statements and five further passages were set beside the sources (§7.1 against BP-Coleman line 7745–7772, §4.5 against BP-Hida line 2919–2940, §3.4 against BP-Hida line 2639–2652, the §2.8 proof route against BP-Hida line 1615–1636, the module docstring). The longest shared run is six words ("is locally quasi-finite and partially proper"), a forced statement.

Arrangement: BP-Coleman has 69 of 152 source mentions. The structure of the README is unchanged since round 10, whose comparison with the contents of BP-Coleman (line 17–75) I reread: Layers 5 and 6 draw on its §§4–6 out of order, and the order of Layers 5, 6, 7 is forced by the Needs lines of §6.2 (§§5.2–5.3) and §7.1 (§§6.3, 6.9, 6.10). Reuse: the eight §9.3 values are those of the first table of BP-Coleman §5.14.3, restated in a sentence and recomputed at a chosen weight; no table, figure or data is taken over.

Source independence: 20 passages compared with 4 sources, none shared; largest share BP-Coleman, 69 of 152 locators; contents compared with BP-Coleman: independent.

## Not verifiable

- The journal paginations of BP-Hida and Pilloni-Singular: the README cites the author editions only, and those were read.
- Overlined symbols in BP-Coleman §6.10 (interior cohomology) are lost in the text extraction; I read Theorems 6.10.1–6.10.2 as statements on interior cohomology from their proofs and the sentence introducing them (line 7953–7960).
- Sections outside the sample that no repair touched were not reread against the sources this round.

## Source issues

- **Misprint** in BP-Hida at §2.11, standing assumptions before Remark 2.11.1, printed p. 31: the source says the first-projection pullback of the middle positive support lies in the second-projection pullback of the inner one; it should be the second-projection pullback inside the first-projection pullback, as in Proposition 2.10.4; affects the proof.
- **Misprint** in BP-Coleman at Definition 6.4.7, printed p. 158: the source says the first negative-support inclusion uses the coefficient radius as second depth; it should be the free geometric depth used in the positive case; affects nothing.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), printed p. 173: the source says the vanishing holds on the strongly-small part; it should be the small part, which is what its proof establishes; affects a stated result.

## For the human reviewers

- Licence: BP-Hida, BP-Coleman and Pilloni-Singular are read from the author's page (`licence_class = "author-page"` in `packages/HigherHidaAndColemanTheory/sources.toml`); the locator edition of BP-Coleman is an unpublished 180-page revision of arXiv:2110.10251.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5673023dfdd603a3529f8080bbfbf7ee8b68390e", "job": "REV-PKG-HigherHidaAndColemanTheory~11", "model": "fable", "worker": "chris-x26"} -->
