# Review of GlobalHolomorphicFunctions (pull request #992 at db419f3)

**Verdict:** needs changes

Five findings, one blocking. This head repairs all six findings of the previous review (below). The gate passes. `Suggested.lean` elaborates with exactly 22 `sorry` warnings and no other output. The dependency check reports 0 problems. Every sampled locator opens on the cited statement. The blocking finding is new: ComplexKahlerGeometry's open revision (#1398) now claims four objects this roadmap also owns.

## Repairs of the previous review's findings

- *R01 (form-level headlines and H² absent; "not statable" and "no supplier owns a de Rham quotient" false).* **Repaired.** `Suggested.lean:32`–39 now reads "The form-level statements of README Layer 7.2 are on Tau Ceti's smooth-form carrier … Every headline theorem of the roadmap is statable at the pins". `exists_smooth_closed_completion_form` (`:281`), `exists_mextDeriv_eq_complex_two_form` (`:298`), `exists_mextDeriv_eq_real_two_form` (`:306`) and `subsingleton_deRhamCohomology_two` (`:314`) are stated. `README.md:20`–24 now says "the de Rham complex of real smooth forms with its cohomology `deRhamCohomology` … Layer 7.2 proves the vanishing `H²_dR(U;ℝ)=0`", and 7.2 gives the proof (`:1912`–1917).
- *R02 (Layer 2.2 restated `holomorphicFunctions`).* **Repaired.** `HolomorphicMapSpace`, its two scoped instances and `complete_holomorphicMapSpace` are deleted. `README.md:839`–855 now says "`H(U)` is Tau Ceti's `holomorphicFunctions U` … Its contract is consumed, not restated", and the `From Tau Ceti` contract (`:182`–196) cites the closedness, completeness, convergence, restriction, jet and restriction-estimate declarations. The kept targets are the comparison metric and continuity of differentiation (`:857`–900).
- *R03 (Layer 5 re-planned AnalyticNumberTheoryPartI §0.15a).* **Repaired.** Layer 5 and `entire_weierstrass_factorization` are deleted. The contract `README.md:216`–232 consumes "its full Weierstrass factorization … without a growth hypothesis" with the three Checks, and the Summary and "How to read" (`:3`–8, `:249`–250) no longer claim it.
- *R04 (ZerosOfLFunctions citations shifted; 1.1 a stub).* **Repaired.** The citations now read "Layer 5.1–5.4" (`:33`), and 5.1 support, 5.2 factor, 5.3 canonical product, 5.4 entire logarithm (`:203`–206, `:569`, `:573`, `:647`, `:1437`). These match ZerosOfLFunctions on main (`README.md:929`, `:938`, `:957`, `:979`). Section 1.1 (`:563`–593) now owns the derivative identities, the logarithmic derivative and the genus-one logarithmic bound, with four Checks.
- *R05 (DeRhamCohomologyAndDuality consumer claim).* **Repaired.** `:2045`–2046 now reads "Layer 7.2 proves `H²_dR(U;ℝ)=0` … on Tau Ceti's `deRhamCohomology`, available to every consumer".
- *R06 (`IsRungeCompactPair` wrote out the native predicate).* **Repaired.** The definition is now `IsOpen Ω ∧ IsCompact K ∧ K ⊆ Ω ∧ TauCeti.IsFilledIn K Ω` (`Suggested.lean:114`–115, `README.md:989`–991).

## R01 (P2) — ComplexKahlerGeometry's revision owns the finite-rank Runge operator, scalar Runge, the scalar ∂̄ solver and planar complex two-form exactness; this roadmap owns them too

**Location:** `README.md:50`–51 ("ComplexKahlerGeometry K2 owns parameter-dependent solvers … they consume this roadmap's scalar results and complex two-form exactness"); `:1042` ("`exists_finite_rank_runge_operator`, the finite-rank linear Runge operator used by GH5 and CKG K2"); `:1919`–1920; `:2042`–2045. Lean: `Suggested.lean:125` (`isRungeCompactPair_iff_approximation`), `:150` (`exists_finite_rank_runge_operator`), `:261` (`exists_smooth_conjWirtingerDeriv_eq`) and `:298` (`exists_mextDeriv_eq_complex_two_form`).

**Claim:** these four objects are this roadmap's, and ComplexKahlerGeometry consumes them.

**Witness:** ComplexKahlerGeometry at #1398:

- `README.md:29`–32: "Layer 2 owns finite-rank Runge approximation and the simultaneous smooth and holomorphic parameter solver … Layer 5 its planar de Rham consequence".
- `:56`–59: "nothing is imported from them for those objects. GlobalHolomorphicFunctions §§0.3, 2.5 and 7.2 state … the finite-rank Runge operator and planar two-form exactness".
- `Suggested.lean:74` `finite_rank_runge_approximation` is `exists_finite_rank_runge_operator` with the weights absorbed (`g′ⱼ = wⱼ gⱼ`) and `hRunge` the body of `IsFilledIn` (`TauCeti/Topology/FilledIn.lean:61`).
- `README.md:551`–553 makes scalar Runge a target.
- `:611`–617: `mixed_parameter_solver` "includes Q=P=point (the scalar case)".
- `:1621`–1629: every smooth complex two-form on an open `Ω⊆ℂ` is exact.
- Its supplier contracts (`:130` onward) cite nothing from this roadmap.

On main, ComplexKahlerGeometry consumes this roadmap instead (`README.md:35`, `:200`, `:1637`), and so do the ComplexKahlerGeometry folders of #1807, #1808 (`:84`) and #1854. So once #1398 merges, these objects have two owners.

**Exact repair:** agree one owner per object with the ComplexKahlerGeometry revision before either merges. The merge order allows only one direction without a new dependency. ComplexKahlerGeometry is on main and must not consume a roadmap that is not, which is why commit `7ddea985` of its revision ("restore scalar prerequisites without upward dependency") took these objects.

Either:

- **(a)** this roadmap consumes them:
  - add `### From TauCetiRoadmap.ComplexKahlerGeometry`, citing Layer 2's scalar Runge and `finite_rank_runge_approximation`, the scalar case of `mixed_parameter_solver`, and Layer 5's complex two-form exactness;
  - delete `exists_finite_rank_runge_operator`, `exists_smooth_conjWirtingerDeriv_eq` and `exists_mextDeriv_eq_complex_two_form` from `Suggested.lean`, and reduce `isRungeCompactPair_iff_approximation` to what that layer does not state;
  - make the operator paragraph of 2.5 (`:1042`–1054), the solver of 7.1 (`:1783`–1810) and the complex case of 7.2 (`:1904`–1907) consumers;
  - delete the consumer sentences at `:50`–51, `:1919`–1920 and `:2042`–2045;
  - name the ComplexKahlerGeometry revision in this pull request's merge-order paragraph.

  The real exactness, `H²_dR(U;ℝ)=0`, the closed completion and Cousin I then rest on the consumed solver.
- **(b)** the ComplexKahlerGeometry revision drops these claims and goes back to consuming GH0 and GH5. That is that pull request's change, and it brings back the upward edge from main that the revision removed.

Test on the instance: with (a), `finite_rank_runge_approximation` at `gⱼ := wⱼ • gⱼ` gives the bound `‖f z − Σ wⱼ f(ζⱼ) gⱼ z‖ ≤ ε B` of `:150` symbol for symbol, so nothing this roadmap's consumers use is lost.

## R02 (P3) — Layer 7.2 plans to prove two coordinate facts Tau Ceti already has

**Location:** `README.md:1862`–1865 ("Prove that the degree-zero form of a smooth function on `M` is a smooth form, `IsSmoothForm`, by its chartwise definition"); `:1881`–1886 ("prove `du=(∂z u) dz+(∂barz u) dbarz` as an identity of complex-valued one-forms: both sides are the real-linear map…"); the API list at `:1922`–1925. Neither the contract (`:164`–173) nor the *Needs:* list (`:1949`–1955) names them.

**Witness:**

- `TauCeti/Geometry/Manifold/DifferentialForm/Regularity.lean:387` `isSmoothForm_ofFunction_iff : IsSmoothForm I n (RoughForm.ofFunction I f) ↔ ContMDiff I 𝓘(ℝ, F) n f`.
- `Plane/Complex.lean:103` `mpullback_complexDz f z`: `f*dz = wirtingerDeriv f z 1 • dz + conjWirtingerDeriv f z 1 • dz̄`, with no regularity hypothesis. `:117` gives its evaluation.
- `Naturality.lean:63` `mpullback_mextDeriv_ofFunction` gives `f*(dg) = d(g ∘ f)`.

At `g = id`, `d(ofFunction id) = complexDz` pointwise (`ExtDeriv.lean:371`, `Plane/Complex.lean:51`), so `du = u*dz`. For `u = z̄` this is `0·dz + 1·dz̄ = dz̄`.

**Exact repair:**

- Add `isSmoothForm_ofFunction_iff`, `mpullback_complexDz`, `mpullback_complexDz_apply` and `mpullback_mextDeriv_ofFunction` to the `From Tau Ceti` contract and to 7.2's *Needs:*.
- Replace the sentence at `:1862`–1864 by a citation of `isSmoothForm_ofFunction_iff`.
- Derive `du = u*dz` and its Wirtinger decomposition from those three declarations, restricting along `ι` with `Naturality.lean:249` `mpullback_mextDeriv` or `Opens.lean:63`.
- Keep as a target only the comparison of the restricted coordinate derivatives with the ambient ones.
- Drop "smoothness of degree-zero forms" and "the decomposition of du" from the list of what 7.2 proves.

## R03 (P3) — Layer 2.3 rebuilds the laws of Tau Ceti's holomorphic germ algebra

**Location:** `README.md:930`–934 ("define O(K) as the complex subspace of native `C(K,ℂ)` consisting of restrictions of functions holomorphic on some open neighborhood of K … Prove the subspace laws by intersecting two neighborhoods"); `:946`–947 ("complex subspace operations, restriction to smaller compacts, the continuous restriction from H(Ω)"). `holomorphicGerms` appears nowhere in the README.

**Witness:**

- `TauCeti/Analysis/Complex/Germ/Algebra.lean:37` `holomorphicGerms (s : Set ℂ) : Subalgebra ℂ (Germ (𝓝ˢ s) ℂ)`: germs of functions holomorphic near `s`, with no compactness assumed.
- `:112` `eval x hx : holomorphicGerms s →ₐ[ℂ] ℂ`.
- `:132` `restrict` along `t ⊆ s`.
- `:175` `isUnit_iff`: a germ is a unit iff it does not vanish on `s`.
- `HolomorphicFunctions/Germ.lean:45` `toGerm : holomorphicFunctions U →ₐ[ℂ] holomorphicGerms s`.

O(K) is the image of `holomorphicGerms K` under pointwise evaluation. It is not the germ algebra itself: for `K = {0}` the germs of `z` and `0` differ but have equal values, so O(K) = ℂ. So O(K) remains a definition here, but its subspace laws and restrictions are native.

**Exact repair:**

- Define O(K) as the range of the evaluation of `holomorphicGerms K` into `C(K,ℂ)`.
- Cite `holomorphicGerms`, `eval`, `restrict` and `toGerm` under `From Tau Ceti` and in the Scope.
- Delete "Prove the subspace laws by intersecting two neighborhoods" and the first three API items.
- Keep the non-open and non-closed examples, finite-K interpolation and the density statement.

## R04 (P3) — The exhaustion theorem cited for the explicit stages does not state them

**Location:** `README.md:805`–808 ("The Runge exhaustion is the native filled compact exhaustion `IsOpen.exists_isFilledIn_compact_exhaustion` applied to Ω: compact stages `K_n=closedBall 0 (n+1) \ thickening (n+1)⁻¹ Ωᶜ`"); `:868` ("Its compactness and `K_n ⊆ int K_(n+1)` are native"); 3.3 at `:1276`–1277 ("exactly the native filled exhaustion stages").

**Witness:** `TauCeti/Analysis/Normed/Module/Exhaustion.lean:86` concludes only `∃ K, (∀ n, IsCompact (K n)) ∧ (∀ n, K n ⊆ interior (K (n+1))) ∧ ⋃ n, K n = Ω ∧ ∀ n, IsFilledIn (K n) Ω`. The stage formula is a `set` inside its proof (`:89`), so a consumer cannot recover those stages from it. The exported fact about the explicit sets is `:57` `IsOpen.isFilledIn_closedBall_sdiff_thickening : IsFilledIn (closedBall a r \ thickening δ Ωᶜ) Ω`.

Instance: for Ω the unit disk the stages are `K_0 = {0}` and `K_1 = {|z| ≤ 1/2}`. Nesting holds, but no pinned statement gives it.

**Exact repair:**

- In 2.1, define the stages explicitly and cite `IsOpen.isFilledIn_closedBall_sdiff_thickening` for their filledness. Compactness is `isCompact_closedBall` minus the open `thickening`.
- Make `K_n ⊆ interior K_(n+1)` and `⋃ K_n = Ω` targets of 2.1.
- Change `:868` to "compactness is native; nesting is 2.1's".
- Cite the existential theorem only where an unspecified exhaustion suffices: 3.2, 4.1 and 7.1.

## R05 (P3) — The isolated-singularity target cites a theorem that assumes global singular parts

**Location:** `README.md:1324`–1327 ("for each a∈E let U_a be an open neighborhood of a and φ_a holomorphic on U_a\{a}"); `:1346` ("This is Rainer, Theorem 12.1, p. 31 and Theorem 15.6, p. 39"). This is `Suggested.lean:219` `exists_holomorphic_prescribed_isolated_singularities`.

**Witness:** rainer lines 1603–1605: Theorem 12.1 takes `p_a ∈ H(ℂ∖{a})`. rainer lines 2126–2129: Theorem 15.7 (pp. 39–40) takes a neighbourhood `U_a`, `ϕ_a ∈ H(U_a∖{a})` and gives `f ∈ H(U∖A)` with `f − ϕ_a` holomorphic at `a`; this is the target's form.

Instance: `P(z) = 1/z + 1/(z − 1/2)` on `U_0` = the ball of radius 1/2 about 0. Theorem 12.1 excludes it (it is not holomorphic on ℂ∖{0}); Theorem 15.7 and the target accept it, with `f = 1/z`.

**Exact repair:** cite "Rainer, Theorem 15.7, pp. 39–40 (rainer line 2126)" for the isolated-singularity statement, keeping Theorem 12.1 for the finite-principal-part form and Theorem 15.6 for the quotient.

## Verified sound

**Gate and build.**

- The worker's gate at `db419f3` passes every check, and `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) exits 0 with exactly 22 `declaration uses sorry` warnings and no other output.
- A scratch copy with `#check @name` for all 24 declarations elaborated. The file has no `variable` line; every hypothesis is in the declaration's own signature. Each printed type matches its README statement, and nothing changed.
- One-tactic probe (`simp`, `infer_instance`, `rfl`, `norm_num`, `aesop` on every theorem): it closed 0 of 22.
  - `Subsingleton (TauCeti.deRhamCohomology 𝓘(ℝ, ℂ) U 2)` has no instance (synthesis fails).
  - `exact Finset.norm_prod_one_add_sub_one_le s u` fails with a type mismatch against the sharp bound.

**Dependency check.** The brief's command returned exactly:

```text
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at 48, AnalyticNumberTheoryPartI at 49, this roadmap at 95, RelativisticQuantumFieldTheory at 210 and AutomorphicSpectralTheoryPartII at 301. ZerosOfLFunctions, ComplexKahlerGeometry, Hyperfunctions and DifferentialGeometry are on main, and ConformalMapping is under `Completed/`.

**Citations resolved, at the copy named.**

- **ZerosOfLFunctions (main)**:
  - 5.1 (`:929`): the support of `MeromorphicOn.divisor f univ`, countable and locally finite.
  - 5.2 (`:938`): `E₁`, `deriv E₁ z = −z exp z`, the small-disk estimate, and `deriv E₁ 1 = −e`.
  - 5.3 (`:957`) and 5.4 (`:979`).
- **AnalyticNumberTheoryPartI (#1126, via `roadmaps show`)**:
  - §0.15 (`:531`): `elementaryFactor`, `exists_entire_primary_product_exact` with countable `ι`, cofinite escape and `Σ(R/|a_i|)^(p_i+1) < ∞`, the sharp disc estimate, compact-sup products, and grouping of finite fibres.
  - §0.15a (`:555`): both nontriviality hypotheses, and the full factorization sentence that the contract `README.md:216`–222 restates faithfully.
- **ConformalMapping (`Completed/`)**: §5.3 is the Jordan curve theorem (`:48`), and `:1374` lists this roadmap as its consumer for §5.3.
- **Downstream citations of this roadmap:**
  - ComplexKahlerGeometry on main cites GH0, GH2, GH5 and GH5.1, all present here.
  - RelativisticQuantumFieldTheory #1772 cites Layer 4 (GH2) Laurent phases, present at 4.1.
  - Hyperfunctions on main cites GH0.
  - AutomorphicSpectralTheoryPartII #1761 cites a heading "Preparatory primary factors and locally uniform products" that this head does not carry. That citation is stale and is #1761's to repoint to AnalyticNumberTheoryPartI §0.15; this roadmap is not on main, so no id is dropped from main.

**Pinned declarations opened.** Tau Ceti `2fd255d9`, all under `TauCeti/`:

- **Differential forms** (`Geometry/Manifold/DifferentialForm/`):
  - `Basic.lean:48` `RoughForm.ofFunction`.
  - `Smooth.lean:380` `IsSmoothForm`, `:479` `SmoothForm`.
  - `ExtDeriv.lean:145` `mextDeriv`, `:371` `mextDeriv_ofFunction`.
  - `Squared.lean:72` and `:92`.
  - `Regularity.lean:387`.
  - `Wedge/Basic.lean:238` `wedgeWith` and `:269` `wedgeWith_apply_one_one`, which is the determinant `μ(φv,ψw) − μ(φw,ψv)` with no ½.
  - `Wedge/Leibniz.lean:97`: `d(φ∧ψ) = dφ∧ψ + (−1)^k φ∧dψ`, with differentiability of both forms at the point.
  - `Pullback/Basic.lean:241`.
  - `Naturality.lean:63`, `:249`.
  - `Opens.lean:63`, `:72`, `:354`.
  - `Plane/Complex.lean:41`, `:46`, `:51`, `:103`, `:117`.
  - `Dolbeault/*`: these hold only almost-complex `∂bar` identities, with no `∂̄`-Poincaré lemma and no global solver.
- **de Rham** (`Geometry/Manifold/DeRham/`):
  - `Basic.lean:77` `closedForms`, `:95` `exactForms`, `:109`, `:121` `mem_closedForms_of_finrank_le` (`[IsManifold I 2 M]`, `[FiniteDimensional ℝ E]`, `finrank ℝ E ≤ k`), `:127` `deRhamCohomology`, `:141`, `:159` `mk_surjective`, `:170` `mk_eq_zero_iff`.
  - `NormedSpace.lean`, `SimplyConnected.lean`, `Punctured.lean`, `Euclidean.lean`: none proves `H²` of an open plane set.
- **Holomorphic functions** (`Analysis/Complex/HolomorphicFunctions/`):
  - `Basic.lean:39`, `:71`, `:82`, `:91`, `:118`, `:125`, `:149`, `:155`, `:161`, `:173`, `:193`. There is no derivative map, so 2.2's derivative target stands.
  - `Jet.lean:39`, `:72`, `:95`.
  - `RestrictionEstimate.lean:45`, which asks for a bound on the open disc, and `:79`.
  - `Germ.lean:45`.
- **Germs**: `Analysis/Complex/Germ/Algebra.lean:37`, `:112`, `:132`, `:175`.
- **Exhaustion and filling**: `Analysis/Normed/Module/Exhaustion.lean:57`, `:86`; `Topology/FilledIn.lean:61`; `Topology/FilledHull.lean:99`.
- **Contour** (`Analysis/Contour/`): `Primitive.lean:183`, `:263`, `:293`; `Cycle/Basic.lean:67`, `:192`, `:261`, `:447`; `Cycle/Winding.lean:137`; `Cycle/HomologyCauchy.lean:261`, the cycle Cauchy theorem that 3.1 uses.
- **Other analysis**: `Analysis/Green/Cycle.lean:36`; `Analysis/Complex/Conformal/Morera.lean:40`; `Wirtinger/Basic.lean:91`, `:96`, `:102`, `:170`; `Wirtinger/Holomorphic.lean:53`; `Pompeiu/Basic.lean:163`, `:261`, `:286`; `Wirtinger/Potential.lean:41`, `:64` (which is local only); `CauchyKernel.lean:44`.
- **Absent at the pin**: a grep for Runge, Mittag-Leffler, Cousin and Looman found no holomorphic owner in Tau Ceti or Mathlib.

Mathlib `1b1ccf4b`:

- `Log/Summable.lean:137`, which gives the exponential bound only.
- `Complex/Exponential.lean:679`.
- `Cotangent.lean:91`, `:122`, `:136`, `:215`, `:233` (`cot_series_rep`, root namespace).
- `EulerSineProd.lean:272` (`Complex.tendsto_euler_sin_prod`).
- `IntegerCompl.lean:23`.
- `EulerMascheroni.lean:153`.
- `Gamma/Beta.lean:335`, `:543`.

A grep for cosine-product, sinh-product and Weierstrass-Gamma product declarations found none, so Layers 1.4 and 6 restate no Mathlib theorem.

**Sources (sample and flagged).** Rainer uses the README's institutional copy (printed page = PDF page − 6):

- 0.1: line 1189 (§10, p. 23).
- 1.2, 1.5, 6.3: line 1868 (Theorem 14.3, pp. 35–36; it assumes uniform convergence of Σ|fₙ| on compacts and gives the order sum).
- 1.4: lines 1843–1853 (proof of Proposition 14.2, p. 35; the monomial remark supports the sharp bound).
- 2.1: line 1437 (Lemma 11.3, items (1) distance, (2) convex hull, (4) compactness and idempotence; item (3) is the hull equality of 2.5) and line 1609 (the hull exhaustion in the proof of Theorem 12.1).
- 2.2: lines 1313–1332 ((11.2), Exercises 19–20, p. 25).
- 2.3: line 1333 (O(K), p. 25).
- 3.1: lines 1950 and 1997 (Proposition 15.2 with `K = K̂_U`, Theorem 15.3, pp. 36–37).
- 3.2: line 2086 (Theorem 15.5, for a region; the README states the extension to arbitrary open sets).
- 4.1: lines 1603 and 2116 (R05).
- 7.1: line 1630 (Theorem 12.2, p. 31).
- Cousin I: lines 1658 and 1689 (Proposition 12.3 and Theorem 12.4, with the cocycle `f_ik = f_ij + f_jk`, p. 32).

Gray–Morris (author copy):

- line 66: Theorem 3 on p. 247, with (i) four partials everywhere, (ii) Cauchy–Riemann everywhere and (iii) continuity, as the Lean states;
- line 310: Appendix and Lemma 1, pp. 252–253 (see Source issues).

Sections 2.4 and 6.2 cite no source. Both are elementary derivations (the contour norm estimate; a strip and Liouville proof of the paired cotangent series), and the numbers they quote are recomputed in the table. Earlier reviews kept 6.2 as a worked example, and this one does not reopen it.

**README shape and policy.**

- The README has every required section, with a Tau Ceti contract and a contract for each of ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping.
- The structure is right: `### k.n` prose, `*Needs:*` lines, at least three Checks per definition, and per-layer Examples and Dependencies.
- There are no LaTeX delimiters, pull-request numbers or machine paths.
- The gap at Layer 5 keeps the GH(k−2) labels that main's consumers cite (`:249`–250).
- Imports are `import Mathlib` plus five existing `TauCeti.*` modules, with no `set_option`, `lemma` or sorry'd data.

**Headline theorems.**

- Looman–Menchoff (0.2); the sharp product bound (1.4); weighted genus-one products (1.2).
- Runge equivalence, hull equality and the finite-rank operator (2.5).
- Zero-free approximation, divisor realization and boundary noncontinuation (3.1–3.2).
- Mittag-Leffler, isolated singularities and the quotient theorem (4.1).
- Cauchy–Pompeiu on a cycle (6.5).
- The ∂̄ solver and closed completion, in scalar and form-level versions (7.1–7.2).
- Complex and real two-form exactness and `H²_dR(U;ℝ)=0` (7.2); Cousin I (7.4).

All are stated, and the docstring's claim that every headline is statable holds. Full factorization is AnalyticNumberTheoryPartI's.

**Ownership by object.** The roadmap grep over main and the 466 open heads finds no second owner of Looman–Menchoff, holomorphic Mittag-Leffler, holomorphic Cousin I (the Cousin complexes of SchemeAndStackFoundations and AutomorphicBundlesPartII are a different object), the holomorphic hull or Cauchy–Pompeiu. ComplexKahlerGeometry #1398 is R01.

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`; values were recomputed this round.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| R 0.1 operators | u = z, z̄, \|z\|² at z = i | (∂z,∂̄) = (1,0), (0,1), (z̄,z) = (−i, i); native `conjWirtingerDeriv_apply` at v = 1 is (fx + i fy)/2 | Pass |
| S Looman–Menchoff | f = z; f = z̄; Looman's exp(−z⁻⁴); Ω = ∅ | fx = 1, fy = i = i·fx; fy = −i ≠ i; discontinuous at 0, so excluded by `ContinuousOn`; vacuous | Pass |
| R 0.2 balanced estimate vs Gray–Morris Lemma 1 | R = [0,3]×[0,1] with E two opposite corners, N = 1; R = [0,1]², φ = y | unbalanced: 21 > 15 (the source fails; the README excludes it by 1/2 ≤ w/h ≤ 2); balanced: N(2w_J + h_J) ≤ 5N h_R since w_J ≤ 2h_R; φ = y gives 1 − 1 = 0 ≤ 0 | Pass (source issue) |
| R 0.2 square-to-ball | r = 1 | area 4 vs 2π; ratio π/2 | Pass |
| R 0.3 kernel sign | radial cutoff, φ(0) = 1 | ∫(πζ)⁻¹∂̄φ dA = ∫₀¹g′ = −1 = −φ(0); kernel z − ζ as in `Pompeiu/Basic.lean:163` | Pass |
| R 0.3 kernel norm | r = 1 | ∫_{\|ζ\|<1}\|ζ\|⁻¹ dA = 2π | Pass |
| R 1.1 derivatives | E₂′(−1); E₁′(1); E₀′(0.3+0.2i) | −0.606531 = −e^{−1/2}; −2.718282 = −e; −1.000000 | Pass |
| R 1.1 log bound | 59 radii × 360 angles; w = 1/2; w = 1 | max(log\|E₁\| − \|w\|²) = −0.00014; −0.1931 ≤ 0.25; 0 ≤ 1 | Pass |
| S `exists_entire_genusOne_product` | S = ∅; S = {1}, m = 2; S = {2}, m = 0 | F = 1; (1−z)²e^{2z}, order 2 = divisor 2; factor 1, order 0 | Pass |
| S `…_of_divisor` | D = 0; D = 2[1] | F = 1, divisor 0; Σ D/\|ρ\|² = 2, `toNat` 2, divisor 2[1] | Pass |
| R 1.2 majorant | S = {1}, m = 2 | Σ_ι (R/\|aᵢ\|)² = 2R² = R²·2 | Pass |
| S sharp bound | u = (1,1); (1,−1); (−1,0); ∅; 20 000 random families of size ≤ 5 | 3 ≤ 3; 1 ≤ 3; 1 ≤ 1; 0 ≤ 0; max(LHS − RHS) = 2·10⁻¹⁶ (rounding); Mathlib's bound at (1,1) is e² − 1 = 6.389 | Pass |
| R 1.5 uniform tail | X = ℕ, uₙ = 1/(n+1)·1_{x=n}; u₀ = −1 | tail sup 1/(N+1) → 0, Σ sup = harmonic = ∞; product 0, order ⊤ | Pass |
| S `IsRungeCompactPair` | (∅,∅); unit circle in ℂ; annulus 2 ≤ \|z\| ≤ 3 in D₄; in 1 < \|z\| < 4 | true; false (open disk component, closure compact in ℂ); false; true | Pass |
| S `holomorphicHull` | K = ∅; circle in ℂ; annulus in 1 < \|z\| < 4 | ∅ (B = −1, f = 0); closed disk; K (1/z excludes \|z\| < 2) | Pass |
| R 2.1 distance, convex hull | K = {2 ≤ \|z\| ≤ 3}, Ω = D₄ | dist(K,Ωᶜ) = dist(K̂,Ωᶜ) = 1; K̂ = closed 3-disk = conv K | Pass |
| R 2.1/2.2 stages | Ω = unit disk; Ω = ℂ | K₀ = {0}, K₁ = {\|z\| ≤ 1/2}; closedBall 0 (n+1) | Pass (R04) |
| R 2.2 metric | constants differing by 1; 1/(n+1) on ℂ; t = 1; zⁿ/n on the disk | 1/2; 1/(n+2); min(1,t)/2 = t/(1+t) = 1/2; sup norms 1/n and 1 | Pass |
| R 2.3 O(K) | K = ∅; {0,1}; {0}; εz̄; Σzⁿ/(n+1)² | one element; a + (b−a)z; O(K) = ℂ while the germ algebra is infinite-dimensional; ∂̄ = ε ≠ 0; Σ n/(n+1)² = ∞ | Pass (R03) |
| R 2.4 estimate | unit circle, f − g = 1; reversed | 0 ≤ 2π; ∮dz/z = 2πi becomes −2πi, length 2π | Pass |
| S Runge equivalence | annulus in D₄, f = 1/z; (∅,∅) | circle period 2πi vs 0 for disk-holomorphic g; both sides true | Pass |
| S `holomorphicHull_eq_fill` | K = ∅, Ω = D₁; unit circle in ℂ | the component D₁ has closure ⊄ Ω, so the fill is ∅ = hull; closed disk on both sides | Pass |
| S finite-rank operator | K = {0}, U = Ω = ℂ, f = c; K = ∅ | N = 1, ζ = 0, w = 1, g = 1: error 0 ≤ εB; L = ∅ vacuous; ComplexKahlerGeometry's form with g′ = w g is identical | Pass (R01) |
| S zero-free approximation | annulus, u = z | g = z, nowhere zero on Ω, winding 1; exponentials have winding 0 | Pass |
| S zero orders, divisor | m = 0; m = 2[2]; ν = −[0] | f = 1; (z−2)²; 1/z with order −1 ≠ ⊤ | Pass |
| S boundary germ | Ω = ∅, ℂ; ℂ∖{0} at 0; ℂ∖ℝ at 0 | vacuous; zeros in the component accumulate at 0, so F vanishes off a discrete set and contradicts f ≠ 0 off E; both half-disk components | Pass |
| S Mittag-Leffler | E = ∅; E = {0}, P = 1/z² + z | f = 0; f = 1/z², f − P = −z analytic | Pass |
| S isolated singularities | P = exp(1/z); P = 1/z + 1/(z−1/2) on the ball of radius 1/2 | remainder 0; P ∉ H(ℂ∖{0}): Theorem 12.1 excludes it, Theorem 15.7 and the target accept it, with f = 1/z | Pass (R05) |
| S quotient | F = 1/z; F ≡ 0 on one component; Ω = ∅ | f = 1, g = z; f = 0, g = 1; vacuous | Pass |
| R 6.1 products | cos at 1/4; 1/Γ(1/2); α = 1/2 | 0.707107 = cos(π/4); 0.564190 = 1/√π; prefactor 1 and π cot(π/2) = 0 | Pass |
| R 6.2 strip | z = i; z = 1/2 + i, n = 1; y = 1 | \|q(i)\| = π coth π = 3.153348 ≤ 4 + 3π/2 = 8.712389; term 1.1094 ≤ 2.4; S₁ = 1.076674 = (π coth π − 1)/2, π/2 − S₁ = 0.494123 ∈ [0,1]; c-bound 3.153348 | Pass |
| R 6.3 theta | r = 1/2, z = 0.3 + 0.1i | H(z + 2 log r)/H(z) = 1.474234 − 0.147917i = r⁻¹e^{−z} | Pass |
| R 6.3 sinh, lattice | z = 1/2; Manhattan shells N = 1, 2 | πz∏ = 2.301296 vs sinh(π/2) = 2.301299 (truncation); 4 points, Σ\|λ\|⁻³ = 4 ≤ 8√2 = 11.31; 8 points | Pass |
| R 6.3 ratio | aₙ = 2/n², bₙ = 1/n² | Σ\|aₙ − bₙ\| = π²/6; m² = 2n² has no solution | Pass |
| R 6.4 crescent | z = −1/2; −t; −1 + t | \|z\| = 1/2, \|2z−1\| = 2; \|1/z\| = 1/t; \|1/(z+1)\| = 1/t | Pass |
| S `cauchyPompeiu` | unit disk, ξ = 0, f = \|z\|², 1, z̄ | 1 − 1 = 0; 1 − 0 = 1; 0 − 0 = 0 | Pass |
| R 6.5 Euler example | z = 1 | z e^{z/2}∏ = 1.718282 = e − 1 | Pass |
| S ∂̄ solver | f = z̄, z, z e^{−\|z\|²} | z̄²/2 (1 at z = 1); \|z\|²; −e^{−\|z\|²} (e⁻¹ at 1); ComplexKahlerGeometry's `mixed_parameter_solver` at P = Q = point gives the same | Pass (R01) |
| S closed completion, scalar and form | f = z; f = z̄; f = 0 with g = z̄ | g = z̄: ∂̄g = 1 = ∂_z f, d(z̄ dz + z dz̄) = dz̄∧dz + dz∧dz̄ = 0, while g = 0 leaves dz∧dz̄ (value −2i); g = 0: dz̄∧dz̄ = 0; ∂_z z̄ = 0 but d z̄ = dz̄ | Pass |
| S complex exactness | η = dz∧dz̄ on (1,i) | value −2i; h = 1, u = z̄, d(−z̄ dz) = dz∧dz̄; ComplexKahlerGeometry's route d(u dz) = 2i ∂̄u dx∧dy agrees | Pass (R01) |
| S real exactness | η = dx∧dy on (1,i) | value 1; u = z̄/2, β = (x dy − y dx)/2, dβ = dx∧dy; the swapped β gives 0 | Pass |
| S `H²` vanishing | U = ∅, ℂ; circle comparison | only the zero form; [dx∧dy] = d((x dy − y dx)/2); on S¹ every one-form is closed by dimension yet H¹ = ℝ, so exactness is needed; no library instance | Pass |
| R 7.2 du decomposition | u = z̄ on ℂ | `mpullback_complexDz`: u*dz = 0·dz + 1·dz̄ = du | Native (R02) |
| R 7.2 degree-zero smoothness | smooth f | `isSmoothForm_ofFunction_iff` | Native (R02) |
| R 7.3 examples | z = 1, i, 2 | d(iz²), d(i\|z\|²): 2i, 2i; −2, 0; d\|z\|² = 4, d\|z\|⁴ = 32; log-square log 2 on both sides | Pass |
| S Cousin I | two sets with c₁₂ = 1; one set; empty cover; countably many copies of Ω | b = (1,0); 3c₁₁ = 0; vacuous; b = 0; c_ji = −c_ij gives Rainer's `f_ik = f_ij + f_jk` | Pass |
| R consumed factorization | f = z; (z−1)²; e^z | m = 1, P = 1, g = 0; P = (1−z)², g = 0; P = 1, g = z | Pass |
| R Conventions | annulus 1 < \|z\| < 2 | index 1 − 1 = 0 at 0; area 4π − π = 3π | Pass |

The table has 47 rows, each with computed values. It covers the seeded sample (0.1, 0.2, 1.2, 1.4, 1.5, 2.1, 2.2, 2.3, 2.4, 3.1, 3.2, 4.1, 6.2, 6.3, 7.1), every headline and every target a finding touches.

## Not verifiable

- Gray–Morris defer Lemma 1's proof to Saks, *Theory of the Integral* (their [34, 198]), which was not read. The source issue below rests on the counterexample, not on Saks.
- The open pull requests #1126, #1761, #1772, #1807, #1808 and #1854 were read only through the roadmap tools (`roadmaps show`, `roadmaps grep`). #1398 and #1234 were read from the checkouts the brief gives.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, pp. 252–253: the source says the 5N·m(R−E) bound holds for every closed rectangle R; it should require side ratio w ≤ 2h (h ≤ 2w for the second inequality): R = [0,3]×[0,1], E opposite corners, N = 1 gives 21 > 15; affects the proof.
