<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6898271389 -->
Review (claude) of a04e459

Verdict: needs_changes

1. **F01** (P3) the list of supplier statements used one universe up is not complete

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, Conventions (Universes), line 54: "a supplier's statement about small ∞-categories is applied in the universe u+1 exactly where the text says so (straightening over the ∞-categories of test rings in 1.2 and 2.1, sheafification in 3.1)".

   **Claim:** these three places are all the places where a supplier's small-base statement is used in the universe u+1.

   **Witness:** 2.3's route applies PresheavesAndCompletions §1.4.3, stated "for a small simplicial set" (its README line 457; "small" is the base universe, line 95), to `T^op`, which is not u-small. 2.5 straightens over the nerve of affine schemes; 7.1 treats `PreStk_T` as a presheaf ∞-topos.

   **Exact repair:** replace the parenthesis and its lead-in by a rule: "every supplier statement about small ∞-categories, presheaf ∞-categories or ∞-topoi that is applied to `T`, `T^op`, `Pts(X)`, `PreStk_T` or its sheaves is applied in the universe u+1, with `Ŝ` as the ∞-category of spaces: straightening (1.2, 2.1, 2.5), coCartesian sections over `Pts(X)` (2.2), the free cocompletion (2.3, 3.1), sheafification and hypercompletion (3.1, 3.4) and the ∞-topos statements (7.1)". Tested on the witness: with `S = T^op` taken (u+1)-small and `P(S) = Fun(T, Ŝ) = PreStk_T`, §1.4.3 gives exactly the colimit-to-limit statement of 2.3 for (u+1)-small colimits, and `QCoh(⨿_K Spec ℤ) = ∏_K D∞(ℤ)` for K not u-small is covered.

2. **F02** (P3) 7.1 derives "geometric" from surjectivity, which does not need flatness, and never states that the atlas is flat

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, 7.1, API, line 701: "If moreover G is flat over S, `X → [X/G]` is an fpqc surjection, so `[X/G]` is geometric in the sense of 6.2." Plan: 7.1, API `geometric_quotient`.

   **Claim:** flatness of G gives the fpqc surjection, and the surjection gives "geometric".

   **Witness:** over `S = Spec ℤ` take the closed subgroup G of the constant group ℤ/2 with `O(G) = ℤ × 𝔽_p`. `S → [S/G]` pulled back along itself is `G → S`, split by the unit: an fpqc surjection, not flat. 6.2(b) asks for a flat affine atlas.

   **Exact repair:** replace the sentence by: "The map `X → [X/G]` is affine (the diagonal is) and an fpqc surjection for every such G, since its base change along itself is the projection `G ×_S X → X`, split by the unit. If moreover G is flat over S, this map is flat: every point of `[X/G]` lifts to X after an fpqc cover, over which the fibre is a base change of G, and flatness is fpqc-local (6.1). So `[X/G]` is geometric in the sense of 6.2." Add 6.1 and 6.2 to the *Needs* line of 7.1 and to its plan prerequisites (both precede 7.1), and mirror the sentence in the plan's `geometric_quotient`. Tested on the witness: the non-flat G no longer yields "geometric", and for `G = G_m` over ℤ the fibre `G_m × Spec R′` is flat, so `BG_m` is geometric, as 6.2's Check uses.

Both findings of the previous review are repaired. This round finds no P1 or P2 and two P3 findings (R01, R02), each with a repair to apply, so it asks for changes. The two declared supplier gaps, `gap:chevalley-quasiprojective-quotient` (ReductiveGroups Layer 3) and `gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16), are precise, minimal and declared in both files; they are not findings. No maintainer notes were supplied. This review changed neither the design, the plan nor the manifest.

## Verified sound

### Findings of the previous review

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P3) "small" in two universe senses | repaired | Conventions (line 54): "Unqualified "small" means u-small and "large" means not u-small; "(u+1)-small" is always written out." 2.1 (line 326): "(u+1)-small limits and colimits in `PreStk_T` are computed pointwise". 2.3 (line 362): "QCoh carries (u+1)-small colimits of prestacks to limits". 2.4 (line 377): "`u_!` preserves (u+1)-small colimits". 3.1 (line 434): "to an ∞-category with (u+1)-small limits". 3.3(b) (line 469): "(u+1)-small colimits of sheaves". A script found one unqualified "small" left in the plan, in the §4.4.2 supplier entry ("localization at a small set"), which quotes the supplier's statement and is qualified by "in the universe u+1". The same pattern, for the list of supplier uses, is R01. |
| F02 (P3) quasi-affine clause of 6.2(b) | repaired | 6.2(b) (line 640): "In the classical context the same holds for a hypercomplete fpqc sheaf X that has quasi-affine diagonal and admits a flat fpqc surjection `p : Spec A → X`. Here the diagonal is quasi-affine when every base change of `X → X × X` along a point … is the classical prestack `h_Z` (2.5) of a quasi-affine scheme Z." The doubled-plane Check is at line 650, 2.5 is in *Needs* (line 652) and in the plan prerequisites; the plan statement and hypotheses of 6.2 carry the same clause. SAG Definition 9.1.0.1 (SAG line 26462) and the proof of Proposition 9.1.3.1 (SAG lines 26670–26688) support it. |

No finding of the repair report is marked "not actionable", so nothing is re-raised. Repaired patterns searched in the rest of the design: "quasi-affine" occurs only in 6.2; "geometric" is used in 6.4, 7.1 and 8.4 in the affine sense (R02 concerns how 7.1 reaches it).

### Adversarial pass

Values computed by hand this round. Rows cover the passages the last repair changed, the fifteen sampled targets, the headline theorems and both findings.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, universes (changed) | `Mod_ℤ`, K not u-small; `PreStk_T`; `T^op` | a coproduct C of K copies of ℤ would have `Hom(C, ℚ/ℤ) = ∏_K ℚ/ℤ`, of cardinality at least `2^|K|`, not u-small; constant prestacks on (u+1)-small Kan complexes form a (u+2)-set; `CommRingCat.{u}` has a (u+1)-set of objects | holds; list of uses incomplete (R01) |
| 2.1 points (sample; changed) | `Pts(Spec A)`; `Spec 0` against ∅; product over K of `Spec ℤ` | initial object `(A, id)`; value at the zero ring `∗` against ∅; `Spec ℤ` is final, product final | sound |
| 2.3 formal properties (sample; changed) | `⨿_K Spec ℤ`; ∅; `BΓ × Spec 𝔽₂`, `Γ = ℤ/2`; `Spec ℤ` | `∏_K D∞(ℤ)`; terminal category = 0; `π₀Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = 𝔽₂` with every evaluation in `π₋₁A = 0`; `Ext¹_ℤ(ℤ/p, ℤ/p) = ℤ/p` | sound |
| 2.4 (changed) | `ι_!` on `Spec 𝔽_p ×_{Spec ℤ} Spec 𝔽_p`; `ι^* Spec(𝔽_p ⊗ᴸ 𝔽_p)` | `Spec 𝔽_p` against `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `Hom(π₀, R) = Hom(𝔽_p, R)`, so `Spec 𝔽_p` | sound |
| 3.1 universal property (changed) | `F = QCoh`; both directions | (⇐) for d in the target, `Map(d, F(−))` is represented by the sheaf `Map(d, F(Spec −))`, local objects see L-equivalences as equivalences; (⇒) `|Č| → Spec A` is an L-equivalence and F turns the realization into `lim F(Č_n)` | holds in both directions |
| 3.2 flat hyperdescent (headline) | `A → A`; `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → 𝔽_p` | constant nerve; kernel of `(a, b) ↦ a − b` is ℤ and the cokernel 0, so the fibre is `ℤ[1/6][−1]`, `Ext²_ℤ(ℤ[1/6], ℤ) = 0`, `Hom(ℤ[1/2], ℤ) = 0`: index 2; `ℚ ⊗ᴸ 𝔽_p = 0` | sound |
| 3.3 sheafification, Čech descent (sample, headline) | `∅ → Spec 0`; `Spec 𝔽_p → Spec ℤ`; arbitrary X in (c) | `0 = 0`; totalization kills ℚ; `|U_•| → X` is the image of `U → X`, a monomorphism that L turns into an effective epimorphism, hence an equivalence | sound |
| 3.4 Zariski gluing (sample) | ∅; `ℙ¹`, `O(−2)`; doubled plane, `R = k[x,y,a,b]/(ax+by−1)` | `h_∅ = Spec 0`, limit `Mod_0 = 0`; image of `(a, b) ↦ a − t⁻²b` is spanned by `tⁿ`, `n ≥ 0` or `n ≤ −2`, cokernel `k·t⁻¹`; opens containing `𝔸² ∖ 0` are `𝔸² ∖ 0`, U, U′, Z, of which U, U′ affine: fibre two points; over `D(x)`, `D(y)` a least affine open exists | sound |
| 4.1 affine morphisms (sample) | `h_{𝔸²∖0} → h_{𝔸²}`; `Spec k → BG`, `BG → Spec k`; `G = 1` | base change along the identity not affine; fibre a torsor; `id_G ≠ e` in `G(O(G))` unless `O(G) = k`; identities | sound |
| 4.2 pushforward (sample, headline) | `Spec R[t] → Spec R`; classical `Spec 𝔽_p → Spec ℤ` twice | `R[t]`, base change `R′[t]`; `𝔽_p ⊗ᴸ 𝔽_p` (`π₁ = 𝔽_p`) against `𝔽_p` | sound; flatness needed classically |
| 1.3 t-structure, flatness (sample) | `A = 𝔽_p ⊗ᴸ 𝔽_p`; `ℤ → ℤ[1/p] × ℤ_p`; `ℤ → ℚ`; `ℤ → 𝔽_p` | heart `ModuleCat 𝔽_p`, unit has `π₁ = 𝔽_p`; `(p)` under `pℤ_p`, other primes under `ℤ[1/p]`; `ℚ ⊗ ℤ/p = 0`; `𝔽_p ↦ 𝔽_p ⊗ᴸ 𝔽_p`, not discrete | sound |
| 1.4 perfect, almost perfect, locally free (sample) | `ℤ ⊕ ℤ[3]`; k over `k[ε]/ε²`; k over `k[x₁, …]`; `ℤ/p`; almost compact against HA 7.2.4.8 | dual `ℤ ⊕ ℤ[−3]`; `Tor_i = k` for all i; maximal ideal not finitely generated; dual `ℤ/p[−1]` not connective; `Map(M, N) = Map(τ_{≤n}M, N)` for N n-truncated, so the two formulations agree | sound |
| 5.1 affine comparison (sample) | `ℤ → 𝔽_p` on `ℤ/p`; `(ℤ/2)~ ⊗ᴸ (ℤ/2)~` | cohomology `𝔽_p` in degrees 0, −1; `(ℤ/2)~` in degrees 0, −1 | sound |
| 5.2 Zariski descent of `Dqc` (sample) | tower `τ^{≥−m}K` on an affine; `⨿_ℕ ℙ¹`; `j_!O` on a DVR | `H^q` constant for `q ≥ −m`, `K ≃ Rlim` (Stacks 08D3, 0A0J); product of the `Dqc(ℙ¹)`; stalks K and 0, not quasi-coherent | sound |
| 5.3 schemes (headline) | `⨿_ℕ Spec ℤ`; `ℙ¹` | `∏_ℕ D∞(ℤ)` on both sides; `H¹(O(−2)) = k` | sound |
| 6.1 pointwise properties (sample) | truncatedness; `⊕_ℕ O` on `Spec ℤ`; local freeness against SAG 2.8.4.2 | `𝔽_p ↦ 𝔽_p ⊗ᴸ 𝔽_p`, `π₁ ≠ 0`; flat, not perfect; not in the list (1)–(10), but flat (6) and almost perfect (9) are, and SAG Remark 2.9.1.2 joins them | sound |
| 6.2(b) quasi-affine clause (sample; changed) | doubled plane Z; `𝔸² ∖ 0`; `Spec 0`; `BE`, E elliptic | diagonal over `U × U′` is `𝔸² ∖ 0`; atlas base change `U ⊔ (𝔸² ∖ 0) → U`, flat, not affine; closed-immersion diagonal, both clauses agree; `QCoh = 0`; diagonal fibre E proper of dimension 1, excluded | sound |
| 6.2(b) route: quasi-affine terms as finite colimits | W quasi-affine, n affine opens | separated, so all intersections affine; W is the colimit in sheaves over the nonempty subsets of the cover, a finite diagram | (a) applies |
| 6.3 perfect = dualizable (headline) | `O[1]`; `O²` over a field; `ℤ/p` on `Spec ℤ` | inverse `O[−1]`; evaluation of rank 4 → 1; dual not connective | sound |
| 6.4 almost perfect (sample) | k over `k[ε]/ε²`; `⊕_ℕ O`; boundedness in the criterion | `Tor_i = k`; `π₀ = ⊕_ℕ ℤ`; `F → τ_{≤n}F = colim_m τ_{≥−m}τ_{≤n}F` factors through a finite stage, so `π_{−j}F = 0` for `j > m`: the criterion forces bounded below | sound |
| 7.1 quotient geometric | G with `O(G) = ℤ × 𝔽_p` over ℤ; `G_m` | `G → S` split, not flat; fibre `G_m × Spec R′` flat | wording (R02) |
| 7.3 fixed points (sample, headline) | Γ trivial; ℤ trivial on `Spec C`; `σ(x) = 2x` on `ℚ[x^{±1}]`; coconnectivity | `QCoh(X)`; `H¹(ℤ; C) = C` against 0; `id(x·1) = x ≠ 2x`; `Map(G[1], F) = Map(UG[1], UF)^{hΓ}` contractible, and `Map(M[1], UF) = Map(Ind M[1], F)` with `Ind M = ⊕_γ γ^*M` connective | sound |
| 7.4 quotient stacks | `X` quasi-compact with affine diagonal | `G × X → X × X` factors as a base change of `Δ_X` and a projection with fibre G: affine | sound |
| 8.2 perfect stacks (headline) | `⨿_ℕ Spec ℤ`; `Ind(Perf)` both ways | `Hom(O, ⊕O_i) = ∏ℤ ≠ ⊕ℤ`; compact objects of `Ind(Perf)` are the retracts of `Perf`, and dualizable objects are closed under retracts | sound |
| 8.3 permanence (sample, headline) | doubled line Z, `L_{±1}`; `A = k[ε]/ε²`; (a) diagonal | sections `(t, 1)` of `L_1` and `(1, t)` of `L_{−1}` have non-vanishing loci U′ and U; `Ω¹_{A/k} ≠ 0`, diagonal not flat; `Spec f_η → Spec(f_η ⊗_A f_η)` affine | sound |
| 8.4 characteristic zero (headline) | `BG_m`/ℚ, `M = O[1]`; t-exactness of `RΓ` on unbounded M; `ℤ/2`, `P = Spec ℚ(i)` | `π₀ = 0`, `π₁ = ℚ`; `π_i RΓ(τ_{≤n}M) = (π_i M)^G` is constant in n, no `lim¹`; invariants `ℚe₁ ⊕ ℚ·ie₂` | sound, conditional on the gaps |
| 8.5 characteristic p (headline) | `ℤ/p`/`𝔽_p`; `S₃`/`𝔽₃`; Γ trivial | `Hⁱ = 𝔽_p`; inversion acts by −1 on `H¹` and `H²` of `C₃`, invariants 0, coinduced witness of dimension `[S₃ : C₃] = 2`; no witness | sound |
| gap:twist-quasiprojective | P trivial; `G = 1` | `X_R` with the pulled-back L; `X_R` | precise, one sentence, not provided |
| gap:chevalley-quasiprojective-quotient | `H = GL_n`; `H = 1` | a point; `GL_n`, affine | precise, one sentence, not provided |

A remark that needs no change: 6.2(b) asks for a hypercomplete fpqc sheaf, where SAG Definition 9.1.0.1(a) asks for an fpqc sheaf. The route uses only 3.3(c), which holds for every prestack, and `L X = |X_•|`; I know no sheaf with affine diagonal and flat atlas that is not hypercomplete, so I raise nothing.

### Sources: the seeded sample

No locator is flagged unverified in the plan. Every sampled target was read at its locators.

| Target | Locators read | Result |
| --- | --- | --- |
| 1.3 | HA lines 46134–46144 (Proposition 7.1.1.13, p. 1202), 47511–47525 (Definition 7.2.2.10, Remark 7.2.2.12, Proposition 7.2.2.13, p. 1240), 47532 (Theorem 7.2.2.15), 6013 (Proposition 1.4.4.11, p. 160), 47387 (Proposition 7.2.1.19, p. 1236) | match; HA is for `E₁`-rings in `Sp`, the README transfers, as its route says |
| 1.4 | HA lines 48274 (Definition 7.2.4.1, p. 1260), 48281, 48357 (pp. 1261, 1263), 48424–48441 (Definitions 7.2.4.8, 7.2.4.10, Proposition 7.2.4.11, p. 1265), 48551–48559 (Definition 7.2.4.16, Proposition 7.2.4.17, p. 1268); SAG lines 10004–10009 (p. 277), 10022 (p. 278), 17974–17986 (Proposition 6.2.5.2, pp. 494–495); BZFN line 830 (p. 17) | match |
| 2.1 | SAG lines 17853, 17867 (p. 491) | match |
| 2.3 | SAG lines 17905–17914 (Proposition 6.2.3.4, pp. 492–493), 17758 (Lemma 6.2.1.12, p. 488), 18050–18072 (§6.2.6, pp. 496–497); GR-I lines 7322, 8013 (printed pp. 143, 159) | match |
| 3.3 | SAG lines 17889–17901 (p. 492); GR-I lines 7458–7474 (printed p. 147) | match |
| 3.4 | GR-I line 7572 (Proposition 1.4.4, printed p. 149); SAG line 17912 (p. 493) | match |
| 4.1 | SAG lines 18224–18236 (§6.3.2, pp. 501–502) | match |
| 4.2 | SAG lines 18368 (p. 505), 18458 (p. 507); GR-I line 7740 (Proposition 2.2.2, printed p. 153) | match; both sources treat a wider class, of which affine maps are a case |
| 5.1 | Stacks line 145 (06Z0); SAG lines 7269 (p. 202), 17859 (p. 491) | match |
| 5.2 | Stacks lines 86, 102 (0A0J, 08D3) | match |
| 6.1 | SAG lines 17990–18016 (Definition 6.2.5.3 to Example 6.2.5.7, p. 495), 9916–9930 (Proposition 2.8.4.2, p. 275) | match |
| 6.2 | SAG lines 18017–18030 (pp. 495–496), 26462–26467 (Definition 9.1.0.1), 26667–26696 (p. 733); GR-I lines 7581, 7600 (printed pp. 149, 150); Stacks, Morphisms of Schemes, 02JR and Descent, 023Q, read through the sources service | match |
| 6.4 | SAG lines 26798–26802 (p. 736); HA lines 48432, 48556; Stacks line 1059 (08E8) | match |
| 7.3 | GR-I line 7463 (Corollary 1.3.8, printed p. 147) | match |
| 8.3 | BZFN lines 1149, 1189–1199, 1209–1219 (pp. 23–25); Stacks line 1897 (0BQR); Stacks, Morphisms of Schemes, 0FXR, 0FXS, 0FXT, read through the sources service | match |

Every cited work is in the manifest (nine entries, all `certified`). The two Stacks chapters were fetched into a scratch copy of the manifest, so the package manifest is unchanged. No reference request was written.

### Pins, suppliers and ownership

Lean elaboration: not available (this lane does not elaborate). The design has no `Suggested.lean`, so there is nothing to probe or to compare.

The pinned checkouts are at the plan's baseline (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`). Opened at the cited file and line, 22 declarations: `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `SSet.KanComplex` (KanComplex.lean:40), `CategoryTheory.nerve` (Nerve.lean:37) and its instance (Quasicategory/Nerve.lean:32), `AlgebraicGeometry.Spec`, `Scheme.Spec` (Scheme.lean:466, 494), `fpqcPrecoverage`, `fpqcTopology` (Sites/Fpqc.lean:61, 76), `Module.Flat` (Flat/Basic.lean:114), `Module.FaithfullyFlat` (FaithfullyFlat/Basic.lean:64), `DerivedCategory` (Basic.lean:87), `DerivedCategory.TStructure.t` (TStructure.lean:33), `Pseudofunctor.IsStack` (IsStack.lean:49), `DescentData` (DescentData.lean:59), `CoGrothendieck` (Bicategory/Grothendieck.lean:235), `groupCohomology` (Basic.lean:183), `Rep.coind` (Coinduced.lean:120), `groupCohomology.coindIso` (Shapiro.lean:58), `groupCohomologyIsoEven`, `groupCohomologyIsoOdd` (FiniteCyclic.lean:80, 114), `exists_prime_orderOf_dvd_card` (Cycle/Type.lean:491, `[Fintype G]`), and Tau Ceti `exists_isClosedImmersion_generalLinear` (TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212; `k : Type u`, `[Field k]`, `[LocallyOfFiniteType G.obj.X.hom]`). No Kan-complex instance for the nerve of a groupoid exists at the pin, as the README says.

Supplier citations resolved this round:

- EnhancedDerivedSheaves on main: every name and section label of the README's contract (over seventy) searched by script, none missing; twelve of them, taken across E1–E5, are also present at the heads of both open revisions of that roadmap, so no cited id is dropped.
- SchemeAndStackFoundations on main: every name of the README's contract (over thirty) searched by script, none missing; headings §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 at lines 2793–5030.
- DerivedModuleAlgebra §0.2 and §1.E.0 (lines 794, 2472). ReductiveGroups Layers 1, 3 and 6 (lines 1275, 1537, 2448); no statement that `GL_n/H` is quasi-projective.
- PrismaticCohomologyPartII §4.0 at its head (heading line 709; all cited names at lines 711–732). LanglandsParameterStacks §§1.7, 1.8 (lines 380, 390). HabiroCohomologyFoundations §§1.27, 1.28 (lines 807, 821).
- InfinityCategoryTheory family at its head: all 19 labelled statements found with the cited content.
- The nine leads of `scratch/citations.md` are these suppliers' names, not library names; each resolves as above.

`scratch/overlaps.md` and a fresh run of `roadmaps overlaps` list no competing pull request, no dropped id, no id defined only by a revision and no second copy.

Ownership searched by object at the open heads and on main: "perfect stack" and "quasi-geometric" (no match), `Ind(Perf` (GeometryOfNumbersAndQuadraticArithmetic and RefinedTraceMethods, for `Ind(Perf(k))` of a ring only), flat hyperdescent (LanglandsParameterStacks §1.7, cited), `QCoh` as a right Kan extension (HabiroCohomologyFoundations §1.27 and AnalyticStacks, cited), quasi-projective `GL_n/H` (no statement), ample bundles on contracted products (no statement). SchemeAndStackFoundations names StableReduction Layer 2's polarised descent, a tool the supplier of `gap:twist-quasiprojective` may use; it does not state the gap. The board index lists two unrelated packages. Ownership against pull requests outside the index was not checked.

Overlap check: read EnhancedDerivedSheaves (main and both open revisions), SchemeAndStackFoundations (main), AnalyticStacks, HypercompletenessAndCoherence with the InfinityCategoryTheory family; shared objects: `Mod_R(D(ℤ))` on animated rings — owner EnhancedDerivedSheaves E5:animation.4, cited by both; general ∞-category theory — owner the InfinityCategoryTheory family, cited; abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations, cited.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The plan has 33 targets, each with at least three tests (3 to 6). A script compared the `target:` prerequisites with the README *Needs* lines: they agree on all 33, and none is at or after its own target.

- `gap:twist-quasiprojective`: same slug in the README (line 135) and the plan; supplier SchemeAndStackFoundations §1.16; one `needs` sentence with all hypotheses; §1.16 on main states `contractedProduct_isAlgebraicSpace` only.
- `gap:chevalley-quasiprojective-quotient`: same slug in the README (line 178) and the plan; supplier ReductiveGroups Layer 3; one `needs` sentence; not stated on main or in Part II.

### Shape, principles, headlines

The README has the required parts in order; every definition has API prose and at least three Checks, every theorem a locator, every layer Examples and Dependencies. Regex scan: no LaTeX delimiters, process words, pull-request numbers, machine paths, HTML anchors or `set_option`; "lemma" occurs only in "Shapiro's lemma". No algorithm, no sorry'd data, no route-specific shortcut. The README does not say it follows a source, and no layer is named after a source's chapter.

Headline theorems (from the Summary): flat hyperdescent (3.2) with sheafification invariance and Čech descent (3.3); affine pushforward with base change and projection formula (4.2); `QCoh(h_X) ≃ Dqc(X)` for every scheme (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and their permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5). None is statable at the pins without the suppliers' ∞-categorical carriers; the package stage decides the Lean file.

Source independence: 12 passages compared with 5 sources (HA lines 46134, 47511, 48274, 48428; SAG lines 10004, 17905, 17912, 17990, 26801; BZFN line 1189; Stacks, Morphisms of Schemes, 0FXR; GR-I line 7463), beside the sampled locators, none shared beyond what a statement forces (at most six consecutive words, in the statement that `QCoh(X)` is stable with small colimits); largest share SAG, 48 of 170 locators; contents compared with SAG §§6.2.1–6.2.6, 6.3.1–6.3.4 and 9.1.1–9.1.4: independent. Layer 1 draws on HA; Layer 2 joins SAG 6.2.2 with parts of 6.2.3 and 6.2.6 and its own 2.5; Layer 3 is Appendix D.6 with 6.2.3; Layer 4 (SAG 6.3) precedes Layer 5 (SAG 6.2.4) because 5.4 needs 4.2; Layer 6 joins 6.2.5, 6.2.6 and 9.1; Layers 7–8 have no SAG counterpart.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available in this lane, and the design has no `Suggested.lean`.
- The two gaps are declared contracts: their statements were checked, not their future proofs.
- Suppliers still in pull requests (PrismaticCohomologyPartII, LanglandsParameterStacks, HabiroCohomologyFoundations, the InfinityCategoryTheory family) were read at the heads of the index of 2026-11-15; they can move before they merge.

## Source issues

- none

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a04e45959a0062d2c2a91caadbdcbb351d30fd1d", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~10", "model": "fable", "worker": "chris-x52"} -->
