# Review of K3Surfaces (pull request #1285 at e0f0c67)
**Verdict:** needs changes

Incremental re-review of 23 changed lines since 23b0674. The diff touches only the README: the SchemeAndStackFoundations supplier row, the ruledness contract, case (b) of the unirationality reduction (U) in §0.2 step 1, the §0.2 *Needs:* line, one Layer 0 Example and the Downstream consumers paragraph. `Suggested.lean` is byte-identical to 23b0674. Three of the four previous findings are repaired; the blocking one is repaired on this roadmap's side only, and its cross-pull-request residue is carried as a P3. The repaired case (b) adds one step whose owner is a pinned Mathlib declaration the text does not name.

## R01 (P3) — The characteristic-2 reduction is still owned twice at the two open heads, and the pull request does not record the order that settles it

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:1017–1021` ("its §2.1a consumes §0.2's vanishing theorem and its unirationality reduction (U) at p=2 … without restating the reduction"). Also `:24–28` and `:276–277`.

**Claim:** This roadmap now owns (U) for every p>0 and says that K3SurfacesAndSymplecticBoundedness consumes it at p=2 without restating it. That is the right division: K3Surfaces is earlier in the merge order (line 132, against line 309), and step 1 uses no characteristic hypothesis. But the consumer's open head is unchanged since the previous review and still owns and re-proves the characteristic-2 case, so the sentence "without restating the reduction" is not yet true of any head, and the previous repair's request that this pull request record the order ("#1375 is rebased after it") is not met: the description names seven suppliers and says nothing of the Part II pull request.

**Witness:** K3SurfacesAndSymplecticBoundedness, pull request #1375 at c1d6da0 (01:26, before this head), `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:9` ("Section 2.1a owns only the infinite-height kernel statement and the characteristic-2 case of the reduction"), `:406` ("At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1", then cases (a) and (b) again) and `:414` ("its step-1 reduction argument run at p=2").

**Exact repair:** Nothing more in the folder. The pull request description records, in its merge-order paragraph, that K3SurfacesAndSymplecticBoundedness consumes §0.2 (U) at p=2 and is rebased after this pull request, dropping its own characteristic-2 proof (its `:9`, `:406` and `:414`) in favour of the citation "K3Surfaces §0.2 (U)". Until that edit lands in #1375, exactly one head may merge with a claim to the p=2 case; this is the earlier one.

## R02 (P3) — Case (b) uses Zariski's main theorem for the finite-fibre points of the resolution without naming its owner

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:279`, case (b): "every singular point of Y is among the s points, because over a neighbourhood of a point with finite fibre f is finite and birational, hence an isomorphism onto the normal Y". The *Needs:* line at `:293–296` names SchemeAndStackFoundations §4.9 "for … Stein factorization and Zariski's connectedness theorem".

**Claim:** The sentence is correct, but "over a neighbourhood of a point with finite fibre f is finite" is not Stein factorization or connectedness: it is that the quasi-finite locus of f is open and that a proper quasi-finite morphism is finite (Zariski's main theorem). SchemeAndStackFoundations §4.9 states neither on main nor at the heads of #1656 and #1276 (`README.md:5448–5486` on main: formal functions, `stein_factorization`, connectedness, four Checks). The pinned Mathlib has the second fact, so the step has an owner, but no named one.

**Witness:** Mathlib at 6b7abb3c, `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:373`: `IsFinite.of_isProper_of_locallyQuasiFinite`, and `:382` the equivalence tagged Stacks 02LS. Instance: for the minimal resolution of an A₁ point, the fibre over a smooth point of Y is one point, the fibre over the node is a (−2)-curve; the sentence needs the first kind of point to have a neighbourhood over which f is finite.

**Exact repair:** In the sentence, write "over a neighbourhood of a point with finite fibre f is quasi-finite, hence finite by Mathlib `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, and birational, hence an isomorphism onto the normal Y", and add that declaration (with the Stein factorization item) to the §0.2 *Needs:* line and to the `From Mathlib` supplier contract.

## Previous findings

- R01 — partly repaired: this README keeps (U) at every p>0 (`:24–28`, `:276–277`) and says Part II "consumes … (U) at p=2 … without restating the reduction" (`:1017–1021`); #1375 at c1d6da0 still owns and re-proves the p=2 case (`:9`, `:406`, `:414`), and the description records no order. Carried as R01 (P3).
- R02 — repaired: `:279` now reads "These components, of n_1,…,n_s curves, are the fibres of f over the s points of Y to which f contracts a curve: each such fibre is connected by Zariski's connectedness theorem of SchemeAndStackFoundations §4.9 … so f_*O_Ỹ=O_Y", and `:293–296` adds §4.9 to the *Needs:* line. The added finite-fibre sentence introduced R02.
- R03 — repaired: `packages/K3Surfaces/sources.toml:40–55` records `rudakov-shafarevich-inseparable` (DOI 10.1070/IM1976v010n06ABEH001833, mathnet.ru copy, certified, open-repository, `locator_scheme = "theorem"`, the requested locator, `cited_for = ["0.2"]`), the key the Part II manifest uses.
- R04 — repaired: `:143–151` now ends "with b₁ the first ℓ-adic Betti number for any ℓ invertible in the field. This is Enriques' theorem …"; the converse clause is gone.

## Verified sound

This is an independent AI review at head `e0f0c67cc68a00c95d8de6b5be94e07e9c8d6824`, incremental after the review at `23b0674`.
- **Folder contents.** `git diff --stat origin/main...HEAD` excluding the folder prints nothing. The folder holds `README.md` (1072 lines), `Suggested.lean` (90 lines) and `metadata.toml`. `git diff 23b06742 HEAD -- Suggested.lean` is empty.
- **Repair comment.** The author's reply at this head marks every previous finding "applied" (H02 "applied differently"); none is marked not actionable. No fetched text contained an instruction.

**Gate.** The worker's gate at this head passed every check with `build=0`. I reran `gate … --base origin/main`: every scanner 0, "OK", exit 0. The prescribed dependency check printed:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. K3Surfaces is at line 132 of the merge order; K3SurfacesAndSymplecticBoundedness at line 309.

**Elaboration.** `lake env lean` on the absolute path of `Suggested.lean` from the worktree, at Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`, exits 0 with exactly two `declaration uses sorry` warnings (lines 51 and 74); every imported Tau Ceti olean was present.
- **Signatures.** One scratch copy with `#check @` for `IsAlgebraicK3`, `algebraicK3_differential_vanishing`, `discriminantGraph` and `gluing_isometry_extension_iff`: every binder is kept (`[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]`; `[CharP k p]`, `2 < p`, `IsAlgebraicK3 k X`; both `IsNondegenerate` instances, both `IsEven` hypotheses, the anti-isometry equation, the form and carrier equations). Nothing changed against the README.
- **One-tactic probe.** In the same copy each `sorry` became `first | simp | rfl | infer_instance | sorry`; both theorems still warn, so nothing closes in one tactic and there is no padding.
- **Headlines.** Unchanged: the vanishing theorem and the gluing criterion are stated; (U), (i) and the Torelli-side headlines are named in the docstring as not statable (no Néron–Severi group, Picard number or period domain at the pins). The diff adds no headline.

**Library declarations opened at the pins (3):**
- Mathlib `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` (`Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:373`) and `IsFinite.iff_isProper_and_locallyQuasiFinite` (`:382`, Stacks 02LS): the finite-fibre step of case (b) (R02).
- Tau Ceti `AlgebraicGeometry.Scheme.relativeDifferentialsHomEquiv` and `Scheme.Modules.Derivation` (`TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:101`, `:72`): unchanged carriers of the vanishing theorem, re-elaborated above.

**Cross-roadmap citations resolved (5):**
- **SchemeAndStackFoundations §4.9** on main (`README.md:5448–5486`), at #1656 4ebdad2e (`:5849`) and at #1276 94710cb0 (`:5414`): identical text; `stein_factorization` for a proper morphism of Noetherian schemes (`X → Spec_Y f_*O_X → Y`, first map proper with geometrically connected fibres and `f_*O = O`, second finite) and Zariski's connectedness theorem when `f_*O_X = O_Y`. The supplier row (`:105`) and the *Needs:* item (`:293–296`) quote exactly this. No open pull request drops it.
- **K3SurfacesAndSymplecticBoundedness at c1d6da0** (#1375): `:74`, `:411` and `:858`/`:864` consume sub-target (i) ("§§2.1a and 6.0c consume step 1's rank theorem (i)" at `:1020–1021` is true); `:74` and `:406` consume the vanishing theorem at p>2 (true); `:9`, `:406`, `:414` own the p=2 reduction (R01).
- **IntegralLattices 0G, 5J, 6A** (overlap lead "only #1239 defines them"): bold paragraph labels on main at `README.md:568`, `:1597`, `:1643`; cited at `:114`, `:915`, `:940`, `:973`, `:1006`. False positive, not a finding.
- **NeronModelsAndSemistableAbelianVarietiesPartII §6.1, StableReduction Layer 4, EtaleCohomologyFoundations F.0.4/F.2.5/F.5–F.7, ModularCurves §2B, PCurvature §§0.1–0.3, NeronModels §5.3e, JacobianChallenge Layer B:** untouched by the diff; resolved in the previous review and carried.

**Source sample at the changed passages** (page markers coincide with printed pages):

| Target | Text opened; result |
| --- | --- |
| 0.2 ruledness contract (one direction kept) | `liedtke-surfaces line 755` through 758 (Theorem 4.4, p.21): κ=−∞ ⇒ birationally ruled with h¹(O_S)=b₁/2=g(C); `line 933` through 936 (Theorem 6.1, p.25): κ=−∞ ⇒ birationally ruled, and κ=−∞ ⇔ p₁₂=0. The contract's hypothesis "every plurigenus zero" is κ=−∞. Matches. |
| 0.2 case (b), Euler count over distinct points | `rudakov-shafarevich-inseparable line 457` through 466 (p.1217): the contracted curves are reduced connected curves over distinct singular points, each a tree of smooth rational curves. Matches the repaired text. |
| 0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 5.2, 6.1, 6.2, 7.1, 7.2, 7.3 | Untouched by the diff; the checks of the previous reviews stand. |

**Adversarial table.** Rows 1–7 are the statements this head changes, with computed values; the rest are carried.

| Statement | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| A connected component of n (−2)-curves is a tree with e=n+1 | n=1; n=2 meeting once; two curves meeting twice; a cycle of m | e(ℙ¹)=2=1+1; e=2+2−1=3=2+1; (E₁+E₂)²=−2−2+2·2=0; (ΣE_i)²=−2m+2m=0, both excluded by negative definiteness | Sound. |
| e(Ỹ)=e(Y)−s+Σ_r(n_r+1)=e(Y)+Σ_r n_r | one A₁ point: s=1, n₁=1; one A₂: s=1, n₁=2; two A₁: s=2, n=(1,1); smooth: s=0 | 24−1+2=25=24+1; 24−1+3=26=24+2; 24−2+4=26=24+2; 24 | Sound; the identity needs component count = s, supplied by connectedness (next row). |
| Fibres of f connected (Zariski) | f the minimal resolution, Y normal | Stein factorization `Ỹ → Spec_Y f_*O_Ỹ → Y`; the finite part is finite birational onto normal Y, so an isomorphism, so f_*O_Ỹ=O_Y and §4.9 applies | Sound; owner §4.9 verified at main and both open heads. |
| Singular points of Y are among the s points | y with finite fibre; y the A₁ point | fibre one point ⇒ quasi-finite near y ⇒ finite (`IsFinite.of_isProper_of_locallyQuasiFinite`) ⇒ isomorphism ⇒ Y smooth at y; A₁ point: fibre a (−2)-curve, counted in s | Sound mathematics; owner unnamed: R02. |
| Noether bound against the count | Σn_r>0 | e(Ỹ)=24+Σn_r>24 vs e(Ỹ)=12χ(O_Ỹ)≤24 (χ=1−q+p_g≤2) | Contradiction as stated; `:322–324` Example agrees with `:279`. |
| Ruledness contract, direction | S=ℙ²; S=E×ℙ¹ with E elliptic; S a K3 | P_n(ℙ²)=0 ∀n, ruled over ℙ¹, h¹=0=g; P_n=0, h¹=1=g(E)=b₁/2=2/2; P_n=1≠0, not in the hypothesis | The kept direction is what (a) and (b) consume; the deleted converse is used nowhere. Sound. |
| Downstream consumers claim | Part II at c1d6da0 `:74`, `:411`, `:858`, `:406`, `:9` | (i) consumed at 2.1a and 6.0c: true; vanishing theorem at p>2: true; "(U) at p=2 without restating": false at that head | R01. |
| Previous-round rows (restricted structure and its five Checks; p-closedness; norm in (b); (U) at p=2 in both cases; abelian-surface control; (i) in characteristic 0; Ogg in step 3; L=O(Δ) split; plurigenera in (a); b_i≤0; nonzero plurigenus ⇒ b_i=0; e(Y)=e(X); e(X)=24; Castelnuovo–Zariski hypotheses) | as in PRREVIEW-K3Surfaces~8 | values as computed there (e.g. (x∂)^p(xⁿ)=n xⁿ; N(π^*u)=u^p; 12χ≤24 at p=2) | Carried; only the Euler-count sentence of (b) changed (rows above). |
| Statements untouched since 771182d (`IsAlgebraicK3` and its controls; double sextic; Theorem D cases with c₂ values 0, 12, 12, 12, 84, 36; Hodge diamond; twistor conic; strong Torelli; gluing iff; fixed loci; marking group; and the other rows) | as in the review at 771182d (56 rows) | values as computed there | Carried; no statement in these rows changed. |

**Ownership by object.** No new object is introduced by the diff. The Zariski connectedness input is cited, not restated. Ownership of (U) at p=2 is settled in this folder's favour by the merge order; the residue is R01.

## Not verifiable

- Rudakov–Šafarevič 1983, p.1502 (characteristic-3 pencil selection in sub-target (iv)): paywalled, recorded uncertified; untouched by the diff.
- The board package has no `design/plan.json`, so whether `gap:integral-topology` and `gap:enriques-ruledness` are registered where the intake reads them could not be checked.
- Ownership against open pull requests whose files this brief does not provide was checked only through the Part II checkout at c1d6da0 and the overlaps listing; no other open pull request changes this roadmap.

## Source issues

- none
