# FIX-RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2

Repair of red-team round 2 (passes a and b). Seven findings, each settled once; none overlap. Files changed: `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md`, `Suggested.lean` (docstring only), `design/plan.json` (two entries of the top-level `gaps` list), `sources.toml` (locators and `cited_for`).

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2a/F01 (P2) — applied differently

3.2(b): "membership must be established… not a principal idele" → a Hilbert 90 computation proving that diagonal tuples ζ ∈ µ_{2^∞}(F) lie in M_χ. The reviewer's constant c_ζ is shown to equal 1 (a root of unity that is also a square in ℤ₂^×), so M_χ keeps its definition. "K_tors may be 0" → K_tors ≠ 0, cyclic, d(K) = h². The third and fourth Checks are rewritten (T = {v} now gives x = 0), and so is the Lemma 5.7.7 correction.

Verification. ζζ^c = 1, so ζ = y/y^c. At a split v the components of y at (ṽ, ṽ^c) are (y_ṽ, ζ^{−1}y_ṽ) = (ζ^{−1}y_ṽ)·(ζ, 1). At an inert v, y ∈ F⁺_v^×·O^×_{F_v}. Choosing signs at the real places gives δ(z) = 1, so z = f·N(w). Using det ρ·(det ρ)^c = χ^n|G_F = ε^{n(1−n)} we get det ρ(Art a_ζ) = ε(Art_{F⁺} z)^{n(n−1)} =: c, the same value for every lift satisfying that identity. Applied to r_{π,2}, c is a root of unity in ℤ₂^×, so c = ±1. It is also a square there, which forces c = 1. The reviewer's witness holds. Their suggested redefinition with constants is unnecessary, because those constants are 1.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2a/F02 (P2) — applied

Neither the sources nor this roadmap gives a proof of (★), so the dependence is now stated wherever the headline appears:
- **Summary item 1:** "for sufficiently deep tame level…" → "if every component of Spec R^{T,ord} has dimension ≥ dim Λ (3.2(b), BCGP25 Lemma 5.7.7, whose printed proof gives only dim Λ − 1), then…".
- **4.8:** it now carries this dimension hypothesis. Its statement explains that the hypothesis is the conclusion of 3.2(b), and that with 3.2(b) it is the second assertion of Theorem 5.7.14. The route, the Check and *Needs* follow.
- **`Suggested.lean`:** the docstring bullets for 4.8 and 3.2(b) are reworded the same way.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2a/F03 (P3) — applied

3.2(b) "Every component of Spec R_{S_χ}…" → "Assume moreover R = ∅ and H¹(ρ̄(G_F), k) = 0 (e.g. near adequacy). Then every component of Spec R^{T,ord}…". The route explains why this hypothesis is natural: ψ ≠ 0, and (ad r̄/k)^{G_F} ↪ H¹(ρ̄(G_F), k) = 0, so the trace-zero complex has h³ = 0 and the lost relation is scalar. A new Check uses the dihedral datum of 1.4; the general case of 3.1 is not claimed. The Layer 3 example, the first Check and the Corrections entry are updated.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2a/F04 (P3) — applied differently

At lines 20 and 99, "the same request PotentialAutomorphyInfrastructurePartII makes/records" → that roadmap "declares the same slug for strongly residually odd complex conjugations"; the contract here has no oddness hypothesis and adds representability, the framed torsor and h³. The plan gap's `detail` is updated the same way.

The wording is not the reviewer's "the fuller one…". That roadmap's sentence (its head, line 219) lacks this roadmap's condition that the dyadic places split, so neither request contains the other. The text therefore says the supplier's answer must cover both.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2b/F01 (P2) — applied

The `needs` of gap:hilbert-siegel-ordinary-classicality, in the README contract and in the plan `gaps` entry, changes from "every point above dense weights is classical" to two requirements:
- **Control:** M¹ ⊗_κ E is dual to the ordinary classical cusp forms (BCGP21 Lemma 7.8.5, p. 411; Theorem 6.6.5, p. 355).
- **Decomposition:** that space splits into π-parts on which Hecke acts through characters Θ_π (BCGP21 Theorem 3.10.1, p. 236; proof of 7.9.4, pp. 417–418).

From these, reducedness and the embedding into ∏_π O_{E_π} follow. The 5.6 route now derives reducedness: a nilpotent operator sends M¹ into ∩_κ ℘_κM¹ = 0. A new 5.6 Check uses Λ[N]/(N²), which the new contract excludes. Verified at BCGP21 lines 10310–10332.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2b/F02 (P2) — applied

The witness holds. Tho17 line 208 gives the extension only "after possibly replacing µ by µδ", and Tho17 Theorem 4.1(i)(e) (line 846) takes the sign from Theorem 3.2 (line 698, Bellaïche–Chenevier). The changes:
- **2.3:** new clause (ii′) (polarized with ε^{1−n}δ^n). The route says why (ii) does not imply it at l = 2. A new Check pins the sign: for n = 1 a form on a line is symmetric, which forces µ(c) = −1; for n = 2 the two candidates take the values −1 and +1 at c_v.
- **3.3:** the route now gets the multiplier from (ii′), constant across constituents. A new n = 2 Check is added.
- **Contract and *Needs*:** the AutomorphicGaloisRepresentationsPartII contract and the *Needs* lines now cite AG2.3 *The polarization sign of the constructed system* (checked at that roadmap's head: sign +1, totally odd multiplier, general ℓ).

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~2b/F03 (P3) — applied

- **5.2:** a new API bullet proves "reasonable ⇒ absolutely irreducible" (BCGP25 Hypothesis 6.3.1 (1), p. 146).
- **5.2:** a new Check uses SL₂ × SL₂ on V₁ ⊕ V₂.
- **5.4 (1):** now reads "…GSp₄-reasonable (5.2), hence absolutely irreducible, so that 5.1 applies".

The reviewer's sketch is corrected in one respect. The decomposition V₁ ⊕ V₂ is defined only over k̄, while (b) asks for k[H_n]-submodules. The bullet therefore uses the Galois-stable k-form 𝔪_k = ∩_σ σ(𝔪), of dimension ≤ 6, and its annihilator.

Pattern repair: the 5.2 API reference "(last Check)" pointed at the first Check and now reads "(first Check)".

## Checks run

- `lake env lean packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/Suggested.lean` (from the content checkout): exit 0, no output, 5.7 s.
- `#check @name` audit: the file declares nothing, so there was nothing to elaborate or compare. Only the module docstring changed; there is still a single `import Mathlib` and no `set_option`.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 208 roadmaps, 1908 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Merge order: AutomorphicGaloisRepresentationsPartII (newly cited, AG2.3 sign target) is line 166, AutomorphicBundles line 183, GlobalGaloisDeformations line 88; this roadmap is line 283. All suppliers are earlier.
- Gate failure `tex=11` (TeX-style `_{…}`/`^{…}` outside code spans): all 11 were in the README, eight in the 3.2(b) paragraph (`µ_{2^∞}(F)` three times, `a_ζ = y·z^{−1}·u`, `𝔸^×_{F⁺}`, `N_{F/F⁺}(w)`, `(ζ)_{v∈T}`, `m_{P_1}J_1`) and three in its Checks (`(−1)_{v∈T}`, `a_{−1}` twice). Each is now inside a code span. The text and the mathematics did not change. A rescan of the README finds no `_{`, `^{`, `$` or backslash command outside code. No source was missing, so `needs-references.toml` was not written.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Diagonal ζ ∈ M_χ (3.2(b)) | ζ = −1, F = F⁺(√−a); ζ = i when F = F⁺(√−1) | y = √−a: y/y^c = −1; y = 1+i: (1+i)/(1−i) = i; split components (s, −s) = (−s)(−1, 1) | holds | new text |
| Constant c = ε(Art z)^{n(n−1)} | n = 1, 2, 4 | exponents 0, 2, 12; c ∈ µ(ℤ₂) = {±1} ∩ (ℤ₂^×)² = {1} (squares ≡ 1 mod 8) | c = 1 | constants dropped |
| K_tors, d(K) | #T = 3, d = 2, h² = 4 | rank K = 3, d(K) ≤ 4, K_tors ∋ (−1,−1,−1) ⇒ d(K_tors) = 1, d(K) = 4 | holds | Checks rewritten |
| Rank-one count with torsion relation | #T = 3, d = 2, h² = 4 | (6+2+4−1) − 3 − 5 = 3 = 1 + d | holds | new Check value |
| T = {v} tuple (fourth Check) | −1 at ṽ only | = √−a · (−s)^{−1} · units; image x = 0 (old text allowed x of order 2) | refutes old Check | replaced |
| (ad/k)^{G_F} = 0 under H¹(ρ̄(G_F),k) = 0 | A₅ ⊂ GL₂(𝔽₄) (perfect); dihedral of 1.4 | 0; X = diag(1,0) invariant mod scalars, gX − X = φ(g)1₂ | hypothesis needed | (b) narrowed |
| 4.8 with dimension hypothesis | n = d = 2, #T = 3 | 3.2(a) gives 4 = dim Λ − 1 < 5; hypothesis demands 5 | 4.8 no longer depends on unproved (★) | statement changed |
| 2.3(ii′) sign | n = 1, 2, 3, 4 | totally odd ε^{1−n}δ^n at c_v: −1 each time; the other candidate: +1, +1, +1, +1; mod 2 both trivial | only (ii′) separates | new clause, Check |
| 3.3 sign constant on T_m | reduced O-flat finite-level algebras | ±1 distinct in characteristic 0 | holds | route sentence |
| Reasonable ⇒ irreducible (5.2) | SL₂×SL₂ on V₁⊕V₂, p = 3, 5; V₁ over 𝔽_{q²} swapped by Frobenius | dims 3+3+4 = 10, 𝔪 = 6, annihilator 4; 𝔰𝔩₂^{SL₂(𝔽₃)} = 0; Frobenius-swapped: 𝔪_k = 𝔪 | (b) fails, as claimed | new bullet, Check |
| Swap example (first Check) consistency | H ⋊ C₂ | irreducible, h = (diag(2,3),1)σ hits V₁⊗V₂ | no conflict with new bullet | none |
| Classicality contract ⇒ reduced (5.6) | T = Λ[N]/(N²) on Λ²; T = Λ × Λ diagonal | N on E² nonzero nilpotent (excluded); Λ×Λ semisimple, reduced | contract separates | needs rewritten |
| F04 wording | the two gap sentences | ours: dyadic split, no oddness; theirs: oddness, no dyadic split | neither contains the other | wording |

Other Checks that use the changed objects were recomputed. The Layer 3 example (19 − 14 = 5) now names the H¹ hypothesis. The 3.2 first Check now names `R^{T,ord}`. The 4.3, 4.5 and 1.4 Checks do not use 3.2(b) or the sign and are unchanged.

## For the maintainer

- **GSp4NonregularModularityLifting** (later in the order) has a dyadic contract that cites §§3.1–3.2 and 4.7–4.8 "under all six hypotheses". Here, 4.8 now carries the dimension hypothesis, discharged by 3.2(b). 3.2(b) is stated for R = ∅ and H¹(ρ̄(G_F), k) = 0, which those six hypotheses imply. Section numbers are unchanged and no id is dropped.
- **AutomorphicBundles:** gap:hilbert-siegel-ordinary-classicality now asks for control plus the semisimple decomposition, not point classicality alone.
- **AutomorphicGaloisRepresentationsPartII:** its AG2.3 sign target is newly consumed.
- **Ownership:** no new carrier was introduced. The sign theorem is cited to its owner, and "reasonable ⇒ irreducible" is a lemma about this roadmap's own definition. Ownership was checked against the open heads for the sign target only.
- **Suspicious text:** none found in the reviews.
