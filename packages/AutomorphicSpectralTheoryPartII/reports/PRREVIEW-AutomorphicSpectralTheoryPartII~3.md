# Review of AutomorphicSpectralTheoryPartII (pull request #1761 at 219f824)

**Verdict:** accepted

Incremental re-review of the 28 lines changed since e2ad99a: the Scope and supplier-contract citations of AutomorphicLFunctionsAndLocalFactors, the two AutomorphicSpectralTheory gap section lines, the rewritten GL₁ Check of §4.2a, the §5.6 proof route, `*Needs:*` and Layer 5 Dependencies lines, and in `Suggested.lean` the module header and the docstring of `finite_rank_weierstrass_product`. Every one of the five findings of the previous review is repaired at this head and none of the repairs introduces a new problem. No finding remains.

## Previous findings

- R01 — repaired: README line 1316 now reads "the subspace is that line if π_v=ω_v for almost all v and zero otherwise … for automorphic π the condition reads π=ω; the non-automorphic character π=ω⊗χ … gives the line although π≠ω". Recomputed below; correct.
- R02 — repaired: lines 83 and 87 now read "The section contract is §§4.1–4.5" and "§§4.4–4.5"; at the AutomorphicSpectralTheory head these are "4.1 Measurable associate spectral parameters" … "4.5 Finite multiplicity in the discrete spectrum" (its lines 2296–2370), number-field, fixed central character.
- R03 — repaired: lines 11, 215, 1583 and 1613 cite "AL.R.4, GLₙ isobaric sums" and "AL.3.7.2, Strong multiplicity one for isobaric sums"; both exist at the AutomorphicLFunctionsAndLocalFactors head (its lines 274 and 2193); the string `isobaric-construction` no longer occurs.
- R04 — repaired: `Suggested.lean` line 3 is `public import Mathlib` and line 41 is `@[expose] public section`; a scratch file importing `TauCetiRoadmap.AutomorphicSpectralTheoryPartII.Suggested` now `#check`s all ten declarations and reduces `elementaryFactor 0 2 = -1` by `simp; norm_num`.
- R05 — repaired: the docstring (lines 86–92) attributes the first four conjuncts to GlobalHolomorphicFunctions, preparatory primary factors and locally uniform products, and the growth bound to this roadmap; this matches that roadmap's Layer 1 at its head (`exists_entire_primary_product_exact`, its line 455, under `Σ (R/|a_n|)^(p_n+1)<∞` for every R, which `HasRankBound` with constant genus p implies).

## Verified sound

**Gate and dependency check.** My run of the gate at 219f824: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the worker's run adds `build=0`). Dependency check with `--movable`: `depcheck: 235 roadmaps, 2068 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Diff against origin/main outside the folder: 0 paths. Pins: Mathlib f6090c70, Tau Ceti 358314d4, toolchain v4.35.0-rc3.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean`: three `declaration uses sorry` warnings (lines 93, 106, 116) and nothing else. The `#check @name` pass from the importing scratch file printed the ten elaborated types; each equals the worker's recorded signature and its README statement (the three theorems carry `HasRankBound`, `Differentiable`/`HasFiniteEntireOrder`, `LinearIndependent ℂ b` explicitly; no section binder is lost). One-tactic probe on a scratch copy with `first | rfl | simp | infer_instance | decide | exact?` in place of each `sorry`: all three theorems fail to close (unsolved goals at 100:71 and 121:28, `exact?` fails at 110:50), so none is padding. The module header `module` / `public import Mathlib` / `@[expose] public section` is the form one roadmap on main (CoboundaryExpansion) already uses and the gate's import rules accept it (`imports=0 no-import-mathlib=0`).

**Citations of the changed lines, resolved at the heads named in the brief.** AutomorphicLFunctionsAndLocalFactors (merge order: earlier): `### AL.R.4 GLₙ isobaric sums` (line 274: isobaric Langlands sum of a finite multiset of cuspidals with norm twists, Satake polynomial multiplicative) and `#### AL.3.7.2 Strong multiplicity one for isobaric sums` (line 2193: a.e. unramified components determine the multiset of cuspidal constituents with multiplicities and norm twists; for arbitrary constituents the conclusion is equality of cuspidal support). Both supply exactly what §5.6 and its contract paragraph consume ("including arbitrary unramified norm twists and multiplicities", "identifies the inducing multiset, not an arbitrary irreducible constituent"). AutomorphicSpectralTheory §§4.1–4.5 (lines 2296–2380): the number-field decomposition by discrete inducing data with residual summands (§4.4) and finite multiplicity at fixed level, K-types and infinitesimal character (§4.5), which is the setting of both gaps; §§4.4–4.5 is the right neighbourhood for a polynomial Casimir-eigenvalue count of `L²_disc`. GlobalHolomorphicFunctions Layer 1 as above. All four cited lines of this README (11, 215, 1583, 1613) agree with each other.

A remark that is not a finding under the brief's rules: the design's `plan.json` keeps the two gaps' sections at `§§4.11–4.14` and `§§4.7–4.9` (it is fixed after the design), while the README now gives the correct `§§4.1–4.5` and `§§4.4–4.5` under the same slugs. The intake's announcement to the AutomorphicSpectralTheory job should carry the README's sections.

**Source locators of the changed passages** (bplzz printed page = PDF page).

| Target | Source, locator | What I read | Result |
|---|---|---|---|
| 5.6 statement | bplzz line 88–98 (Thm 1.3, pp.2–3) | G=Res GLₙ, π a constituent of Ind_P(σ), σ cuspidal on the Levi; a multiplier μ⋆ of S(G(𝔸))_K with R(μ⋆f) mapping L²(…/K,ω) into the (M,σ) cuspidal component and π(μ⋆f)=π(f) | matches the README statement, including "the single cuspidal-support component attached to (M,σ)" |
| 5.6 route | bplzz line 1428–1437 (Thm 3.19, p.29) | T-multiplier with range in the sum over D(G,ω)♥χ and μ(χ)=1; Thm 1.3 follows with T=S, χ=χ_π^T and strong multiplicity one for Res GLₙ | matches the README route "global isolation with χ=χ_π^S and normalize at π", with isobaric strong multiplicity one as the uniqueness input |
| 5.6 classification input | bplzz line 87 (JS81 Thm 4.4) | classification of automorphic representations of GLₙ as isobaric sums | the README's AL.R.4 citation is this input |
| 4.2a hypotheses on π | README line 1299 | π irreducible admissible, "not assumed automorphic", no central-character condition in the definition | the Check's non-automorphic witness is in scope |

**Adversarial table, changed statements** (values on each side).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.2a Check 1, first clause | G=GL₁ over ℚ, ω unitary Hecke character | L²_ω([G]) = {f : f(zg)=ω(z)f(g), z∈𝔸^×} = ℂ·ω, one irreducible summand; L²_cusp=L² (no proper parabolic) | line iff ω nearly equivalent to π iff π_v≅ω_v for almost all v | none |
| 4.2a Check 1, weak approximation | χ=πω^{-1} a Hecke character trivial on ℚ_v^× for v∉S′={2,∞} | ℚ^× dense in ℚ₂^××ℝ^×; for x∈𝔸^× pick α_n∈ℚ^× → x_{S′}: χ(x)=χ(xα_n^{-1})=χ(x_{S′}α_n^{-1})→χ(1)=1 | χ=1, so π=ω: the automorphic case reads π=ω | none |
| 4.2a Check 1, non-automorphic witness | ℚ, v₀=2, χ₂ unramified with χ₂(2)=−1, χ₂ trivial on ℤ₂^×; π=ω⊗χ | π_v=ω_v for v≠2; nearly equivalent (S′={2,∞}); subspace = line; π(2)=ω(2)χ₂(2)=1·(−1)=−1≠1 with 2∈ℚ^×, so π is not trivial on ℚ^× (not automorphic); π≠ω | "gives the line although π≠ω" holds | none |
| 4.2a Check 1, "zero otherwise" | π=ω⊗∏_p χ_p with every χ_p unramified nontrivial (a continuous character of 𝔸_f^×) | π_p≠ω_p at every p; no finite S′; subspace 0 | true | none |
| 5.6 uniqueness input | GL₂/ℚ, M=T, σ=χ₁⊗χ₂ unitary, χ₁≠χ₂; π=Ind (irreducible) | Satake polynomial at p: (1−χ₁(p)T)(1−χ₂(p)T) for almost all p; isobaric strong multiplicity one returns the multiset {χ₁,χ₂} (Weyl class of (T,σ)); a cuspidal (G,τ) with τ nearly equivalent to π would satisfy τ≅χ₁⊞χ₂, not cuspidal; occurrence set = the single datum | route sound | none |
| 5.6 "datum, not constituent" | GL₂/ℚ, σ=χ|·|^{1/2}⊗χ|·|^{−1/2}, central character χ² unitary | constituents χ∘det and St⊗χ have the same a.e. Satake parameters {χ(p)p^{1/2}, χ(p)p^{−1/2}}; both are mapped into the one (T,σ) component; the multiplier is normalized at the chosen π only | the README's caveat is exactly right | none |
| gap sections | §§4.1–4.5 and §§4.4–4.5 at the AST head | §4.4 defines L²_disc, L²_res, L²_cont; §4.5 finite multiplicity at fixed level, finite K∞-type set and infinitesimal character, fixed central character, number field | the two `needs` sentences fall in these sections | none |
| docstring of `finite_rank_weierstrass_product` | p=0, Λ={n²}; p=1, Λ=ℤ | `HasRankBound Λ p` ⇒ for |z|≤R at most R^{p+1}·Σ‖z‖^{−(p+1)} points, so |a_n|→∞ and Σ(R/|a_n|)^{p+1}<∞ for every R: GHF Layer 1's hypotheses hold; conjuncts 1–4 are its conclusions at constant genus and multiplicity one; `exp(C(1+|z|)^{p+1})` is not among them | attribution correct | none |
| module header | importing scratch file | ten `#check`s print; `elementaryFactor 0 2 = (1−2)·exp(0) = −1` closes | declarations exported and exposed | none |

**Adversarial table, statements the diff leaves untouched** (carried from the previous report, which computed them; the README sections and the three Lean statements are unchanged at this head).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 4.2a near equivalence, spherical criterion, Checks 2–4, level-K part, eigenpart containment, orthogonal decomposition, degenerate cases (previous report) | S′₁∪S′₂; GL₂/ℚ Satake pairs (2,3),(3,2),(2,5); weight 2 vs 4; level 1; GLₙ vs SL₂ packets; G=1 | transitivity on a finite union; Hecke eigenvalues 5 vs 7; Harish-Chandra parameters 1/2, 3/2 orthogonal; π^K a line, subspace 0; isotypic for GLₙ, not SL₂; L²_cusp=ℂ | true |
| 5.5 hypothesis vs Thm 1.1, range (previous report) | nearly equivalent constituent; π^K=0; subspace 0 | equivalence of the two CAP formulations; 0=0; Rem 1.2(4) | true |
| `finite_rank_weierstrass_product`, growth and zero set (r1 via previous report) | p=0 Λ={n²}; p=1 Λ=ℤ; Λ=∅; Λ={0}; z=0, z∈Λ∖{0}, z∉Λ | `log|E_p(w)|≤|w|^{p+1}` (|w|≤1), `≤(p+1)|w|^{p+1}` (|w|≥1); Ψ≡1 for Λ=∅; Ψ′(0)=1; simple zero at λ | true |
| `HasRankBound`, `polynomial_zero_fiber_interpolation`, `affine_lattice_interpolation`, `HasRapidVerticalDecay` (r1) | Λ=ℤ p=0,1; Λ={1/(n+1)}; n=0, ψ≡0, deg q=0; k=0; k=1, a=1/2, b=1, A={0}; `exp(±z²)` | least ranks 1, ∞; damping `exp(Σz_j^{2q₀})`; `sin(π(z−1/2))exp(z²)` −1≠0 at 0; `exp(M²−y²)` decays, `exp(y²−x²)` grows | true |
| §§0.5–0.9, 1.2, 1.4, 1.6, 1.7, 2.2–2.16, 3.1–3.10, 4.1–4.7, 5.1–5.2, 5.7, Layer 0 Examples (r1) | as listed in the previous report | `e^n/(1+n)^d→∞`; factors i, 2i; `t_{−λ}` (source misprint); `δ_P=4`: `4^{±1/2}`; `(1−2T)(1−3T)=1−5T+6T²` vs `1−4T+4T²`; `E₀(2)=−1` | true |

**Headline theorems.** Unchanged: the README endpoints (BPLZZ Thms 2.13, 3.6–3.7, 3.19, 1.1/1.3, Rem 3.20; BPCZ §2.5, §§2.9–2.10) are not statable at the pins and the module docstring names each with its missing carrier; the three statable Layer 0 results are stated and resist the one-tactic probe. The diff adds no theorem.

**Duplication and ownership.** The diff adds no object; the previous report's grep over main and the open heads for the §4.2a objects stands. Ownership against open pull requests whose files the brief does not give was checked only through the `roadmaps grep` index.

**Policy and shape of the changed lines.** No process words, pull-request numbers, LaTeX delimiters or paths; the four ALLF citations agree with each other; the gate's `readme-ids-missing=0` confirms the README's backticked names are declared.

## Not verifiable

- `bernstein` (Bernstein 1988): settled as uncertified; not touched by this change.
- Kostant, Delorme, Donnelly, Müller, [PS79] and [JS81] inputs of §5.6: cited only through BPLZZ (line 87, 1436), as in the previous reviews; the isobaric form is supplied by AutomorphicLFunctionsAndLocalFactors AL.3.7.2 rather than read here.

## Source issues

- none new in the lines read for this change (bplzz lines 84–100, 1424–1478); the items of the r1 report stand.
