<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6868273915 -->
Review (claude) of f353385

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P1) §2.8(c): the cross-containments have p1 and p2 exchanged, so no consumer can satisfy them

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 473: "the cross-containments p1*D′+⊆p2*D″+ and p2*D′−⊆p1*D″− hold in Cbar"; repeated in the third Check, line 483, and consumed by §8.2, line 1334.

   **Claim:** Three nested pairs with these containments give the strict/compact bridge, and §8.2 applies it to the degree neighbourhoods at thresholds w, w±ε′, w±ε.

   **Witness:** With §2.2 for the double-primed pair, `p1⁻¹D′+ ⊆ p2⁻¹D″+ ⊆ p1⁻¹D″+ ⊆ p1⁻¹D′+`, so `p1⁻¹(D′+∖D″+)=∅`. BP-Hida line 3152 (Proposition 6.2.3(2)–(3), p. 61) supplies the opposite: `p2*D+,ε′ ⊆ p1*D+,ε`.

   For a surjective p1 the printed hypothesis forces `D′+=D″+`, hence `D″+ ⊆ int(D″+)` is open and closed; likewise `D′−=D″−` when p2 is surjective. In §8.1 the pairs are `D″+=D+,ε ⊊ D′+=D+,ε′`, and the Hecke projections are surjective, so the hypothesis of (c) never holds there and the route of §8.2 has no instance. The printed containment is a slip in BP-Hida line 1651 (§2.11, p. 31): Remark 2.11.2 (line 1656) derives compactness of the primed and double-primed pairs from Proposition 2.10.4, whose hypothesis (line 1581) is `p1*D+ ⊇ p2*D′+`, that is `p2*D′+ ⊆ p1*D″+` for the pair (D″,D′); and the proof (line 1716) uses maps from support D′+ to support D″+, which exist only in that direction.

   Computed instance: `Xbar=Cbar={a,b,c}` (three copies of `Spec 𝔽₂`), `p1=id`, `p2=σ` with `σ(a)=a, σ(b)=a, σ(c)=b`, `D″+=∅ ⊂ D′+={c} ⊂ D+={b,c}`, all `D−` empty, `F=O`, `T f=f∘σ`. Each pair satisfies §2.2 (`σ⁻¹{c}=∅⊆{c}`, `σ⁻¹{b,c}={c}⊆{b,c}`), strictness holds on `C″=Cbar` (the ideals are idempotent). Printed containment: `p1*D′+={c} ⊆ p2*D″+=∅` is false. Corrected containment: `p2*D′+=σ⁻¹{c}=∅ ⊆ p1*D″+=∅` is true. Conclusion on the corrected side: `T(f)=(f(a),f(a),f(b))`, `T²(f)=(f(a),f(a),f(a))`, so `K(∅,∅)^ord` is the constants, `𝔽₂[0]`, equal to `RΓ^ord(X={a},O)=𝔽₂[0]`.

   **Exact repair:**

   - In §2.8(c) replace the sentence by: "the cross-containments p2*D′+⊆p1*D″+ and p1*D′−⊆p2*D″− hold in Cbar (these are the containments of (b) for the pairs (D″±,D′±); BP-Hida §2.11 prints them with p1 and p2 exchanged, source issue E15)".
   - Rewrite the third Check: the cross-containment of (c) is that of (b) for (D″,D′), so (b) makes the primed and double-primed pairs compactly dynamical with no further argument; keep the `D″±=∅` reduction; add the three-point instance above as the negative control for the exchanged form.
   - §8.2: no wording change is needed once (c) is corrected; add "(BP-Hida, Proposition 6.2.3, p. 61)" after "the cross-containments of §2.8(c)".
   - Add E15 to "Source issues and conventions" (text under `## Source issues` below) and `"Source issues/E15"` to `cited_for` of `BP-Hida` in `sources.toml`; add "Proposition 6.2.3" to its locator.

   **Repair test:** on the three-point instance the corrected hypotheses hold and both sides are `𝔽₂[0]`; on the Siegel pairs the corrected containments are exactly Proposition 6.2.3(2)–(3).

2. **F02** (P2) §9.8: the large-weight step of the route uses two inputs that no target or supplier provides

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1530: "Use the isolated spherical refinement of §9.5 for the weight-large equality of dimensions"; *Needs* line 1532; §9.5, line 1469: "Let π_p be a generic irreducible unramified representation".

   **Claim:** §9.5 and the listed needs suffice for the equality `d_i(k)=d†_i(k)` at large k (Pilloni-Singular Lemma 14.8.3).

   **Witness:** Pilloni-Singular line 4663–4667: the step compares `eH^i(X,Ω(k,2)(−D))` with `fH^i(X_Kli(p),Ω(k,2)(−D))` through the representations `π_p` contributing to each, using Proposition 5.1.5.2 (line 955) as well as Lemma 5.1.5.2.

   §9.5 assumes `π_p` generic and unramified. For a class at Klingen level this is a conclusion, not a hypothesis: it is Proposition 5.1.5.2 (an irreducible smooth `π_p` with nonzero Klingen invariants whose parameters satisfy `ξ⁻¹ξ′≠p` for all pairs is an irreducible unramified principal series), together with the criterion at line 938–940 for a spherical `π_p`. Neither is a target of §9.5, and SmoothRepresentationsOfLocalGroups §SR.1.4 and §SR.4.5 do not state them (searched: no roadmap on main or at an open head states Proposition 5.1.5.2). The step also needs the smooth admissible `GSp₄(ℚ_p)`-representation `colim_(K_p) H^i(X_(K^pK_p),Ω(k,2)(−D))⊗C`, whose `K_p`-invariants are the finite-level groups, and the valuations `(0,0,k+1,k+1)` of Corollary 14.9.1 (line 4684); the *Needs* line names no supplier for the first.

   Check on the parameters: with valuations `(0,0,k+1,k+1)` the ratios have valuations 0 and ±(k+1), so `ξ⁻¹ξ′=p` is possible only for k=0, and the four products have valuations `0,k+1,k+1,2k+2`, so αβ is isolated for every k≥0. The large-k step is therefore sound once the two inputs are owned.

   **Exact repair:**

   - §9.5: add the statement "Let π_p be an irreducible smooth representation of GSp₄(ℚ_p) with π_p^Kli(p)≠0 and parameters (α,β,γ,δ). If ξ⁻¹ξ′≠p for all ξ,ξ′ among them, then π_p is an irreducible unramified principal series with these Satake parameters; a spherical π_p is generic exactly under the same condition (Pilloni-Singular, Proposition 5.1.5.2 and the paragraph before Proposition 5.1.5.1, pp. 21–22)", with one API bullet and one Check (parameters `(1,1,p,p)`: the ratio p occurs and the conclusion is not asserted).
   - §9.8 route: replace the quoted sentence by "For k large, prove that `eH^i(X,Ω(k,2)(−D))⊗C→fH^i(X_Kli(p),Ω(k,2)(−D))⊗C` is an isomorphism for i=0,1: form the smooth admissible GSp₄(ℚ_p)-representation `colim_(K_p)H^i`, whose invariants are exact in characteristic zero, bound the parameters of its constituents by Corollary 14.9.1, and apply both statements of §9.5 to each constituent."
   - §9.8 *Needs*: add AutomorphicBundlesPartII §3.13, ShimuraCompactifications §4.10 and SmoothRepresentationsOfLocalGroups §SR.0.2; add them to the Layer 9 dependencies where missing.
   - Add "Corollary 14.9.1, p. 102" to the §9.8 locators and to `sources.toml`.

3. **F03** (P3) §9.8: a Hecke action on `M_Kli` is promised but never constructed here

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1528: "The same away-p spherical Hecke actions are retained."

   **Claim:** `M_Kli` and its control isomorphisms carry an away-p spherical Hecke action.

   **Witness:** §9.4 defines `M_Kli` with the operator U only; §3.8 acts on the Borel-type supported complexes `C_w`, not on `M_Kli`. PadicFamiliesPartII §3.4 (open, later in the merge order; `README.md` line 582) constructs that action and needs §9.4.

   **Exact repair:** delete the sentence. The action stays with PadicFamiliesPartII §3.4, which already cites §9.4; nothing here consumes it.

4. **F04** (P3) a supplier declaration name that the supplier does not declare

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 219: "§6.3: cartierSeparation for two effective Cartier divisors on any scheme".

   **Witness:** `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md` line 913–915, §6.3 "Cartier separation", declares no such name, and line 955 says the construction is a README target; `roadmaps grep --fixed cartierSeparation` finds nothing on main or at any open head.

   **Exact repair:** write "§6.3: Cartier separation of two effective Cartier divisors on any scheme, with residual disjointness and preserved difference."

5. **F05** (P3) locator slip for BP-GL2 §2.1

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1420: "§2.1, pp. 4–5"; the same string in the `BP-GL2` locator of `packages/HigherHidaAndColemanTheory/sources.toml`.

   **Witness:** BP-GL2 line 114 (§2.1 begins, p. 4) and line 158–160 (p. 5 begins with §2.2): §2.1 lies on p. 4 only.

   **Exact repair:** "§2.1, p. 4" in both files.

6. **F06** (P3) title shared with another roadmap, and one process word

   **Location:** `packages/HigherHidaAndColemanTheory/README.md` line 1: "# Roadmap: p-adic families, part II — higher Hida and Coleman theory"; line 7: "This Part II owns"; line 51: "This design needs no additional Tau Ceti declaration".

   **Witness:** the open roadmap PadicFamiliesPartII is headed "p-adic families, part II — higher coherent cohomology in PEL, singular and Hilbert weights" (its `README.md` line 2) and cites this roadmap as HigherHidaAndColemanTheory. Two roadmaps then answer to "PadicFamilies, part II". "Design" is a stage name.

   **Exact repair:** head the README "# Roadmap: higher Hida and Coleman theory"; write "This roadmap owns" on line 7 (the first sentence of that paragraph already says where PadicFamilies stops); write "This roadmap needs" on line 51.

Six findings: one P1, one P2, four P3. Both findings of the previous round are repaired. The four reviewed files were not edited; no manifest entry was added (all four sources were already recorded and readable).

## Previous findings (round 7)

| Prior finding | Repaired passage in `packages/HigherHidaAndColemanTheory/README.md` | Status |
|---|---|---|
| F01 (P1): standard pairs fail the allowed-support definition | §5.2, line 839: "U∩B(m,cl(n+s))⊂Z∩U⊂B(0,cl(Cn)) and B(m+s,cl n)⊂U⊂B(Cm,−1)"; the same relative bound in §6.2, line 1022, with l for n | **Repaired.** Recomputed below (GL₂, GSp₄, rootless rows). |
| F02 (P3): no empty-root convention | §5.2, line 839: "When Φ⁺ is empty, that is when G_F is a torus, put min(t)=max(t)=C=1" | **Repaired.** The torus Check of §5.2 and of §7.6 now agree: U=Z=X, `F^N` in degree 0. |

Neither was marked not actionable. No maintainer notes were left for this roadmap.

Pattern sweep for the repaired patterns: (i) a source inequality restated without testing it on the roadmap's own standard example; (ii) an extremum over a possibly empty index set. Pattern (i) recurs in §2.8(c) and is R01. Pattern (ii): `l_min`, `l_max` in §5.8 range over `Cκ±`, which is nonempty (BP-Coleman line 5784, Proposition 5.10.2(1)); no second instance.

## Verified sound

### Coverage

Read all of `README.md` (1592 lines, 66 numbered sections in nine layers), `Suggested.lean`, `metadata.toml`, `sources.toml` and the nine `gaps` entries of `design/plan.json`. Rows of the round-7 table that carried computed values were relied on only for text no repair touched and outside this round's sample; the fifteen sampled sections and every headline were read against the sources again.

### Principles

No route-specific shortcut (every genus, every prime with cofinal levels at p=2, quasi-split abelian type, singular weights kept); no second plan of a roadmap on main; no upward supply; no algorithm; no sorried data; no `set_option`. Fetched roadmap text and source text were treated as data; nothing in them asked for an action.

### Seeded source sample (15 of 15 read; no locator was flagged unverified by the author)

| Target | Text read | Outcome |
|---|---|---|
| §2.7 | BP-Hida line 1157 (Prop. 2.7.2, p. 23), 1185 (2.7.3), 1202 (Thm 2.7.4, p. 24) | Smooth C and X, Artinian A, strict compactification, finite locally free F all present. Supported. |
| §2.8 | BP-Hida line 1480 (Lemma 2.10.1(4), p. 29), 1553 (Prop. 2.10.3, p. 30), 1576 (2.10.4, pp. 30–31), 1637–1692 (§2.11, Thm 2.11.4, pp. 31–32) | (a) and (b) match. (c) copies an exchanged containment: R01. |
| §4.2 | BP-Hida line 1268 (Prop. 2.8.2, p. 25), 2800 (Prop. 5.2.5, pp. 54–55) | Equal torus parts required; supported. |
| §4.6 | BP-Hida line 2876 (Prop. 5.3.3, p. 55), 2891 (Thm 5.3.5, p. 56), 2941–2953 (Remark 5.4.3, p. 57) | Supported; the M-dominance of κ is correctly added. |
| §4.7 | BP-Hida line 2954 (§5.4, p. 57) | Supported; the Λ-linear image is the roadmap's own precision. |
| §5.5 | BP-Coleman line 5667 (Conj. 5.9.2, p. 122), 5694 (Thm 5.9.6, p. 122), proof to line 5776 (p. 124) | Both proved bounds and both signs match. |
| §5.6 | BP-Coleman line 2450 (Thm 4.1.7, p. 51), 5377 (Thm 5.6.1, p. 115), 5458–5552 (Thms 5.7.1–5.7.3, pp. 117–119), 1456 and 1489 (pp. 31–32) | Supported. |
| §5.8 | BP-Coleman line 6247 (Thm 5.12.3), 6255 (Thm 5.12.5), p. 135; Definition 5.11.14 at line 6210 | Supported on the strongly small region. |
| §6.1 | BP-Coleman line 7189–7215 (Lemmas 6.3.10–6.3.11, pp. 155–156), 7385–7397 (§6.5.4, p. 160) | Trace character, unit action and both twists match. |
| §6.2 | BP-Coleman line 7225–7259 (§6.4.1), 7262, 7282, 7301–7319 (Def. 6.4.7, p. 158), 7322, 7340 (p. 159) | Supported with E5 and E13 as stated. |
| §6.3 | BP-Coleman line 6686–6694 (Prop. 6.1.11, p. 144), 6780–6789, 6796–6805 (p. 146), 6812–6832 (Lemma 6.1.18, p. 147) | Supported. |
| §7.3 | BP-Coleman line 7826–7860 (definition and Prop. 6.9.5, pp. 170–171) | Supported. |
| §7.6 | BP-Coleman line 7935–7958 (Thm 6.10.1), 7961–7968, 7971–7983 (Thm 6.10.3), 7984–7991 (Remark 6.10.4, pp. 173–174), 5784–5787 (Prop. 5.10.2, p. 124) | Supported, with E6. |
| §8.3 | BP-Hida line 3246–3291 (Props 6.2.12–6.2.14, Thm 6.2.15, pp. 63–64) | Supported, with E8 for the inversion. |
| §9.2 | BP-Coleman line 6536–6547 (§5.14.2, p. 141); BP-GL2 line 61–106 (Thms 1.1–1.4, pp. 2–3), line 114 | Supported; page slip R05. |

### Adversarial table (sampled targets, headlines and targets touched by findings)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.7 duality | Point over 𝔽₂; ℙ¹ over 𝔽₂ with T=id; 𝔸¹ in ℙ¹ | Point: 𝔽₂×𝔽₂→𝔽₂. ℙ¹: `RΓ(O)=𝔽₂[0]`, `RΓ(Ω¹[1])` has `H⁰=H¹(Ω¹)=𝔽₂`, dual `𝔽₂[0]`. 𝔸¹: `(u^a)⊄(u^b)` for a<b, not strict, ordinary `H⁰=𝔽₂[t]` | Holds; strictness needed |
| §2.8(b) | Two points, pairs (∅,∅), ({a},∅) | `K=𝔽₂²` and `𝔽₂`; containment `{a}⊆∅` false, so excluded | Holds |
| §2.8(c) | Three points with σ; Siegel pairs | Printed: `{c}⊆∅` false; forces `p1⁻¹(D′+∖D″+)=∅`. Corrected: `∅⊆∅`; ordinary parts both `𝔽₂[0]` | **R01** |
| §4.2 | Equal versus different torus parts | Equal: quasi-isomorphism of Prop. 5.2.5. Different: at `T_K=T′` versus `T(ℤ_p)` the perfect models are over `ℤ_p[T/T′]` and `ℤ_p`, ranks differ by `[T:T′]` | Holds; scoped correctly |
| §4.6 control (headline) | `R=C⁰(T′,ℤ_p)[0]`, `ν(u)=u^k` | `M=Λ′[0]`; `[u]↦u^(−k)`; `M⊗O=O[0]`; `RHom_(T′)(ν,C⁰)=O[0]`, rank 1 in degree 0 on both sides | Holds |
| §4.7 | `Λ=ℤ₃[[X]]`, degree character; `1+E₁₂` on `Λ²` | Ring image `ℤ·id` omits `X·id`; Λ-image `Λ·id`. `Λ[N]`, `N²=0`, rank 2 | Holds |
| §4.8 duality (headline) | g=1; g=2, w=s1 | g=1: `ℓ(w*)=1−ℓ(w)`, [0,1] dual shifted by 1 is [0,1]. g=2: [1,3] ↔ [0,2], `3−3=0`, `3−1=2` | Holds |
| §4.9, §8.4 amplitude (headlines) | g=1,2,3 | g=1: id in degree 0, long in degree 1 (BP-Hida line 2990). g=3: d=6, rational range `[ℓ(w),6]` (line 3302); integral statement not asserted | Holds |
| §5.2 relative bound | GL₂, p=3, C=2, depth 1; GSp₄; torus | `Z∩U={v>1}`. Printed bound needs `m≥1` and `2m≤1`. Relative with (0,0,1): `U∩{v>0}={v>1}`. GSp₄: `Cm≤s≤m` forces s=0 when C≥3. Torus: `X⊂X` | Repair confirmed |
| §5.5 | GL₂ weight k, U_naive | id bound 1, long bound k (BP-Coleman line 6542–6545); proved pair for GSp₄ `3,k₂,k₂,k₁+k₂` versus sharp `3,k₂+1,k₂+1,k₁+k₂` | Holds; sharp bound not used |
| §5.6 | d=0 point; GL₂ | Point: F×F→F. GL₂, w=id: cuspidal [0,0], canonical [0,1]; w=long: cuspidal [0,1], canonical [1,1] | Holds |
| §5.8 (headline) | GL₂, k=2 and k=1; κ=(k+2,2) | k=2: `Cκ+={id}`, threshold 2 for U_naive, endpoint excluded. k=1: both chambers, range [0,1]. GSp₄ wall: `l_min=0`, `l_max=1` | Holds |
| §6.1 | `ν_A(u)=c`; `ν_alg(t)=p^a` | V: c, D: c⁻¹, product 1; slope shifts by −a | Holds |
| §6.2 | n=1, m′≥3, pair of §5.2; `m′=n` | Allowed with (m,l,s)=(0,0,1), `Z∩U=B(1,1)`; `m′>n` needed for the saturation range `0≤r<m′` | Holds |
| §6.3 | `A→A` by t over `F⟨t⟩`; cone of identity | Block has `H¹=A/(t)`, not projective; cone: zero cohomology, nonempty determinant locus | Holds |
| §7.1 (headline) | Acyclic family; `H¹` only | Empty Z and E; nonempty support retained | Holds |
| §7.3 | `t:A→A`; D=∅ | Image (t), fibre F at t=0, specialised image 0; D=∅ gives the whole sheaf | Holds |
| §7.5 (headline) | Torsion-free rank one over a domain; `A/(t)` | Faithful image torsion-free, components surject (BP-Coleman line 7890–7895); `A/(t)` is torsion and is not an interior module | Holds |
| §7.6 (headline) | GL₂ k=2, k=1; GSp₄ (5,3;−8); torus | U_std window [0,1) at k=2; k=1 excluded; `A_w(t₂)=3,4,4,8` recomputed from `(0,2),(−2,2),(3,−3),(−5,−3)` with central −8; torus: single term | Holds |
| §8.3 | `ν_A(u)=u^k`, u=1+p, k=0,1 | `[u]↦(1+p)^(−k)`: 1 and `(1+p)⁻¹` | Holds |
| §8.5 (headline) | Genus two, t₂ and t₁ | `3,k₂+1,k₂+1,k₁+k₂` and `k₂+3,k₂+3,k₁+2k₂,k₁+2k₂` (BP-Coleman line 6555–6556); at (5,3): 3,4,4,8 and 6,6,11,11 | Holds |
| §9.1 | ν=(0,−2); ν=(1,1−k) | (5,3),(5,1),(2,−2),(0,−2); `κ_0=κ_1=(k+2,2)`; duals (5,3)↔(0,−2), (5,1)↔(2,−2) | Holds |
| §9.2 | k=2, 1, 0 | `p^(−min(1,k))U_naive` bounds: (0,k−1) for k≥1, (1−k,0) for k≤0; thresholds `k−1` and `1−k` (BP-GL2 line 94–95); both 0 at k=1 | Holds |
| §9.8 (headline) | k=0, k=3, p=2 | Threshold `k+2r−3=1` at (0,2); degree-one equality from k≥3; torsion statement from k>3 at p=2; parameters `(0,0,k+1,k+1)` | Statement holds; route input missing, **R02** |

### Library declarations opened at the pin

`Module.End` (`Mathlib/Algebra/Module/LinearMap/End.lean:33`), `zpow_sub₀` (`Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402`), `HasDerivedCategory` and `DerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74`, `:87`), `CondensedMod` and its `Abelian` instance (`Mathlib/Condensed/Module.lean:41`, `:43`), `CondensedMod.IsSolid` with its limiting docstring (`Mathlib/Condensed/Solid.lean:74–83`). All as the README states. A search of the pinned Tau Ceti and Mathlib for Shimura varieties and Igusa towers finds none, as the module docstring says.

### Duplication and ownership

Every one of the 23 suppliers was resolved at main or at its open head, section by section (about 110 distinct section citations; all headings exist). Statements were opened for SolidAnalyticRings §§7.2–7.4, AutomorphicBundlesPartII §§3.0a, 3.13, 5.13, PadicFamilies §§2a.15–2a.17, LocallyAnalyticDistributions §4.17, ResolutionOfSingularitiesCharacteristicZero §6.3 and SmoothRepresentationsOfLocalGroups §SR.1.4; each makes the statement it is cited for (the Euler-characteristic local constancy is in PadicFamilies §2a.16, over reduced affinoids, as §9.6(3) uses it). One invented name: R04. `scratch/overlaps.md` lists no dropped id, no id defined only by an open revision, no second copy and no conflicting head. The former-numbering table of Layer 5 keeps the ids that PadicFamiliesPartII cites.

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms; shared objects: the Klingen BGG intertwining `d1∘U=p^(k+1)U∘d1` for F=ℚ (owner: this roadmap §9.6(4); PadicFamiliesPartII §5.7 owns the Hilbert case and its scope paragraph still describes the earlier exponent here), the away-p Hecke action on `M_Kli` (owner: PadicFamiliesPartII §3.4; R03), individual coherent Hecke operators (owner: AutomorphicBundlesPartII §3.13; algebra relations on supported and family complexes here, §3.8 and §6.10), analytic coefficient sheaves (owner: OverconvergentAutomorphicForms §§8.6–8.7).

### Supplier order

    depcheck: 240 roadmaps, 2187 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The roadmap stands at line 255 of the merge order, after its last supplier AutomorphicBundlesPartII (254). No forbidden roadmap is cited.

### Declared gaps

All nine slugs appear in `design/plan.json` and under `## Exact supplier contracts` with the same supplier, section and sentence. Each names a supplier and a section, and asks for an extension the supplier does not state (checked for the two SolidAnalyticRings gaps against its §7.3, which says its polynomial structures carry "no geometric localization-kernel assertion", and for coherent-correspondences against AutomorphicBundlesPartII §§3.10–3.13). None is vague, unowned or already provided.

### Shape, Lean form and padding

Summary, scope, conventions, contracts, build guide, nine layers each ending in Examples and Dependencies, consumers, references: present. 24 blocks have an API list, each with at least three Checks (3 to 8). No LaTeX delimiters, pull-request numbers, paths or HTML anchors; one process word (R06).

`lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file is `import Mathlib`, one module docstring and an empty namespace. It declares nothing, so the one-tactic probe and the `#check @name` comparison have empty domains, and there is no padding.

Headline theorems (README line 277): §4.6, §4.8, §4.9, §8.4, §5.8, §7.1, §7.5, §7.6, §8.5, §9.8. Each is named in the module docstring with the carrier it lacks. I agree that none is statable: each needs Siegel or abelian-type Shimura varieties, Igusa towers or supported coherent cohomology, none of which exists at the pins. No backticked name in the README is presented as this roadmap's own.

### Copyright, licences and scope

Wording: the fifteen sampled statements and eight further passages (Conventions on the two support orders, the §2.4 route, the §3.2 normalization, the §5.3 route, the §6.5 statement, the §7.5 route, the §9.6(4) argument, the module docstring) were set beside BP-Hida, BP-Coleman, Pilloni-Singular and BP-GL2 at their locators. No shared run beyond formulas and standard names. Arrangement: BP-Coleman has 70 of 143 locator mentions. Its contents (line 20–46 and the section heads of §§5–6) against Layers 5–7: Layer 5 takes §5 in the order 5.4, 5.3, 5.4, 5.9, 5.6–5.7, 5.5 and 5.8, 5.12; Layer 6 takes 6.3, 4.4–4.6, 6.4, 6.1, 6.5, 6.2, 6.5, 6.8, 6.6–6.7, 6.9; Layer 7 follows 6.9–6.10, where each section needs the one before (§7.2–§7.6 *Needs* lines). No one-to-one run that the dependencies leave free. Reuse: no table, figure or data taken over; the genus-two pairing values are recomputed in the README's own Check.

Source independence: 23 passages compared with 4 sources, none shared; largest share BP-Coleman, 70 of 143 locators; contents compared with BP-Coleman: independent.

## Not verifiable

- none. All four sources were read from the cache; the journal paginations of BP-Hida and Pilloni-Singular were not compared, and the README cites the author editions only.

## Source issues

- **Misprint** in BP-Hida at §2.11, standing assumptions before Remark 2.11.1, p. 31: the source says the first-projection pullback of D′+ lies in the second-projection pullback of D″+, and symmetrically for D−; it should be the second-projection pullback of D′+ inside the first-projection pullback of D″+, and symmetrically, as in Proposition 2.10.4 and Proposition 6.2.3; affects a stated result.
- **Misprint** in BP-Coleman at Definition 5.4.10 and Example 5.4.11, pp. 111–112, and Definition 6.4.7, p. 158: the source says the whole tube of the first lower bound lies in Z∩U; it should be that tube intersected with U (already E13 of the README; confirmed this round); affects a stated result.

## For the human reviewers

- Licence: BP-Hida, BP-Coleman and Pilloni-Singular are read from the author's page (`licence_class = "author-page"` in `packages/HigherHidaAndColemanTheory/sources.toml`); BP-Coleman's locator edition is an unpublished 180-page revision of arXiv:2110.10251.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f3533856bfe8099097e1cf43d639e28bbafab810", "job": "REV-PKG-HigherHidaAndColemanTheory~8", "model": "fable", "worker": "chris-x52"} -->
