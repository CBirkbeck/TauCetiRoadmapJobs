# Review of K3Surfaces (pull request #1285 at 9e7760f)
**Verdict:** needs changes

This is an incremental re-review of 12 changed lines since e0f0c67. The diff touches only `README.md`: the `From Mathlib` supplier contract (`:70–74`), the finite-fibre sentence of case (b) in §0.2 step 1 (`:284`) and the §0.2 *Needs:* line (`:301–304`). `Suggested.lean` is byte-identical to e0f0c67. The previous review's R02 is repaired, and its mathematics is correct. Its owner is now named, but by the two ingredients of a pinned Mathlib lemma that states the whole step (R02 below). R01 is not repaired: the pull-request description still records no merge order against K3SurfacesAndSymplecticBoundedness.

## R01 (P3) — The characteristic-2 reduction is still owned twice at the two open heads, and the description still records no order

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:1025–1029`: "its §2.1a consumes §0.2's vanishing theorem and its unirationality reduction (U) at p=2 … without restating the reduction". The same division appears at `:24–28` and `:276–282`.

**Claim:** This README's side is correct. K3Surfaces is at line 132 of the merge order and K3SurfacesAndSymplecticBoundedness at line 315, so (U) at every p>0 belongs here. The consumer's head has not changed since the previous review, however, and still owns and re-proves the p=2 case. The phrase "without restating the reduction" is therefore false of the consumer's head as it stands. The reply to the previous review says that "the worker carries that sentence into the description", but the live description at 9e7760f has no such sentence.

**Witness:** K3SurfacesAndSymplecticBoundedness #1375 at c1d6da0, `README.md:406`: "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1" (also `:9`, `:414`). This description lists seven suppliers, not #1375.

**Exact repair:** Nothing in the folder. The description's merge-order paragraph should say that K3SurfacesAndSymplecticBoundedness consumes §0.2 (U) at p=2 and is rebased after this pull request. On that rebase it drops its own p=2 proof (its `:9`, `:406`, `:414`) and cites "K3Surfaces §0.2 (U)" in its place.

## R02 (P3) — The finite-neighbourhood step re-derives a pinned Mathlib lemma from its two ingredients instead of citing it

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:284`, case (b): "a point y of Y with finite fibre has an open neighbourhood V over which f is quasi-finite (the quasi-finite locus … is open in Ỹ …), hence finite by Mathlib `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`". The same pair of declarations appears at `:70–74` and `:301–304`.

**Claim:** The sentence is correct (row 2 of the table below). However, Mathlib at the pin states its conclusion as a single lemma, and the parenthetical repeats that lemma's proof. The roadmap should cite the statement rather than restate how it is proved. This supersedes the wording the previous review proposed for its R02, which named only the ingredients.

**Witness:** `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:405`, `AlgebraicGeometry.exists_isFinite_morphismRestrict_of_finite_preimage_singleton` (Stacks 02UP), elaborates as `∀ (f : X ⟶ Y) [IsProper f] (y : Y), (f ⁻¹' {y}).Finite → ∃ V, y ∈ V ∧ IsFinite (f ∣_ V)`. Its proof at `:408–419` is the README's parenthetical.

**Exact repair:** At `:284`, replace the clause with: "a point y of Y with finite fibre has an open neighbourhood V over which the proper f is finite (Mathlib `AlgebraicGeometry.exists_isFinite_morphismRestrict_of_finite_preimage_singleton`, Stacks 02UP), and birational, hence an isomorphism onto the normal V". At `:70–74` and `:301–304`, name this declaration in place of the two ingredients.

Tested on the minimal resolution of an A₁ point y₀:
- At a smooth point y the fibre is one point, so the lemma gives V = Y∖{y₀} with f finite over V. Since f is birational and V is normal, f is an isomorphism over V.
- At y₀ the fibre is a (−2)-curve, which is infinite, so the lemma does not apply, and y₀ is counted in s.

## Previous findings

- R01 — not repaired: the live description at 9e7760f still lists only seven suppliers. #1375 at c1d6da0 `:406` still reads "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1". Carried as R01 (P3).
- R02 — repaired: `:284` now reads "has an open neighbourhood V over which f is quasi-finite (…), hence finite by Mathlib `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, and birational, hence an isomorphism onto the normal V". `:70–74` and `:301–304` name both declarations. New R02 (P3) concerns the name.

## Verified sound

This is an independent AI review at head `9e7760ff6ded47635fb6264df892eda70977353f`, incremental after the review at `e0f0c67`.

**Folder and repair reply**
- `git diff --stat origin/main...HEAD` outside the folder prints nothing.
- The folder holds `README.md` (1080 lines), `Suggested.lean` (90 lines) and `metadata.toml`.
- `git diff e0f0c67 HEAD -- Suggested.lean` is empty.
- The author's reply at this head marks H01 "answered" (the worker was to edit the description) and H02 "applied". Neither is marked "not actionable in this package".
- No fetched text contained an instruction.

**Gate.** The worker's gate at this head passed every check, with `build=0`. I reran `gate … --base origin/main`: every scanner printed 0, the run ended "OK" and exited 0. The prescribed dependency check printed:

```text
depcheck: 244 roadmaps, 2462 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. K3Surfaces is at line 132 of the merge order and K3SurfacesAndSymplecticBoundedness at line 315.

**Elaboration.** I ran `lake env lean` on the absolute path of `Suggested.lean` from the worktree, at Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`. It exits 0 in 14 s with exactly two `declaration uses sorry` warnings (`:51`, `:74`). Every imported Tau Ceti olean was present.

**Signatures.** I elaborated one scratch copy with `#check @` for `IsAlgebraicK3`, `algebraicK3_differential_vanishing`, `discriminantGraph` and `gluing_isometry_extension_iff`. Every binder is kept, and nothing changed against the README or against e0f0c67:
- `[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]`;
- `[CharP k p]`, `2 < p` and `IsAlgebraicK3 k X`;
- both `IsNondegenerate` instances and both `IsEven` hypotheses;
- the anti-isometry equation, the `form` equation and the `carrier` equation.

**One-tactic probe.** In the same copy each `sorry` became `first | simp | rfl | infer_instance | sorry`. Both theorems still warn, so neither closes in one tactic and there is no padding.

**Headlines.** These are unchanged:
- Stated in `Suggested.lean`: the differential/vector-field vanishing theorem and the gluing criterion.
- Named in the docstring as not statable at the pins: (U), sub-target (i) and the Kähler, period and Torelli headlines, for lack of a Néron–Severi group, Picard number, analytic carriers and period domain.

The diff adds no headline.

**Library declarations opened at the pin (5), all in `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`:**
- `Scheme.Hom.quasiFiniteLocus` (`:315`) is `⟨{x | f.QuasiFiniteAt x}, f.isOpen_quasiFiniteAt⟩ : X.Opens` under `[LocallyOfFiniteType f]` only. This matches the contract's "open subscheme of quasi-finite points of a locally finite-type morphism".
- `Scheme.Hom.isOpen_quasiFiniteAt` (`:291`) needs only `[LocallyOfFiniteType f]`. This settles that openness carries no separatedness hypothesis, although the file's docstring mentions one.
- `IsFinite.of_isProper_of_locallyQuasiFinite` (`:372`) takes `[IsProper f] [LocallyQuasiFinite f]` and concludes `IsFinite f`, as the contract says.
- `IsFinite.iff_isProper_and_locallyQuasiFinite` (`:381`, Stacks 02LS).
- `exists_isFinite_morphismRestrict_of_finite_preimage_singleton` (`:405`, Stacks 02UP), the source of R02.

**Cross-roadmap citations resolved:**
- **K3SurfacesAndSymplecticBoundedness at c1d6da0** (#1375, last updated after this head, head unchanged):
  - `:74`, `:406`, `:414` and `:858` consume sub-target (i) and the vanishing theorem at p>2, so the Downstream consumers paragraph is true on those points.
  - `:9`, `:406` and `:414` own the p=2 reduction, which is R01.
- **IntegralLattices 0G, 5J, 6A** (overlap lead "only #1239 defines them"): these are bold paragraph labels on main 3b3f7ef at `README.md:568`, `:1597` and `:1643`. This is a false positive, not a finding.
- **Zariski's main theorem ownership:** `roadmaps grep -i "Zariski.s main theorem"` finds no roadmap that states the finite-neighbourhood step as a target. Mathlib is its owner, and the diff introduces no new object.
- **Untouched by the diff:** SchemeAndStackFoundations §4.9 (Stein factorization and connectedness), EtaleCohomologyFoundations F.0.4, F.2.5 and F.5–F.7, ModularCurves §2B, NeronModelsAndSemistableAbelianVarietiesPartII §6.1 and StableReduction Layer 4. They were resolved in PRREVIEW-K3Surfaces~9 and earlier reviews and are carried.
- **Overlaps:** no open pull request changes this roadmap or drops an id it cites.

**Source sample in the changed paragraph (`:284`, §0.2).** Huybrechts and Liedtke page markers coincide with printed pages. The Rudakov–Šafarevič PDF page n is printed page 1204+n, checked from the running heads at `line 423` and `line 459`.

| Target and locator | Text opened; result |
| --- | --- |
| Huybrechts draft Proposition 9.4.6, p.180 | `huybrechts-k3 line 6797` through 6798, page 180: a K3 in characteristic p>0 with T_X not µ-stable, e.g. with a nonzero vector field, is unirational. Matches (U) at every p>0. |
| Huybrechts draft Proposition 17.2.7, pp.367–368 | `huybrechts-k3 line 14076` through 14082: a unirational K3 over an algebraically closed field has ρ=22, and the proof starts on p.368 by resolving indeterminacy. Matches (i). |
| Liedtke Theorem 4.2 and §4.3, p.20 | `liedtke-surfaces line 718` through 721 (Castelnuovo contraction of a (−1)-curve) and `line 726` through 731 (resolution of indeterminacy by blow-ups), both on page 20. Matches the minimal-resolution and X″ steps. |
| Rudakov–Šafarevič 1976 Theorem 5 and Corollary 1, pp.1216–1217 | `rudakov-shafarevich-inseparable line 440` through 441 (p.1216: a nonzero p-closed field has a rational quotient), `line 460` through 461 (p.1217: contracted curves are connected trees over distinct singular points) and `line 481` through 482 (p.1217: a nonzero vector field gives unirationality). Matches. |
| 0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 5.2, 6.1, 6.2, 7.1, 7.2, 7.3 | Untouched by the diff; the checks of the previous reviews stand. |

**Adversarial table.** Rows 1–3 cover the statements this head changes and carry computed values. The remaining rows are carried from earlier reports.

| Statement | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| 1. `From Mathlib` contract (`:70–74`): quasi-finite locus open for locally finite type; proper and locally quasi-finite ⇒ finite | the elaborated signatures at the pin | `quasiFiniteLocus : [LocallyOfFiniteType f] → X.Opens`; `isOpen_quasiFiniteAt` needs only `LocallyOfFiniteType`; `of_isProper_of_locallyQuasiFinite : [IsProper f] [LocallyQuasiFinite f] → IsFinite f` | Descriptions match the pin. R02 concerns which declaration is named. |
| 2. Case (b): a point with finite fibre has a neighbourhood V over which f is finite, birational, hence an isomorphism onto the normal V | (a) minimal resolution of an A₁ point y₀ at a smooth point y; (b) at y₀; (c) control without normality: the normalization ℙ¹→C of a nodal cubic; (d) control without properness: the open immersion 𝔸¹∖0 ↪ 𝔸¹ | (a) f⁻¹{y} is 1 point, QF=Ỹ∖E, f(E)={y₀} is closed, V=Y∖{y₀}∋y, f is finite over V of degree 1, so an isomorphism; (b) f⁻¹{y₀}=E≅ℙ¹ is infinite, so y₀ is excluded and counted in s=1, n₁=1; (c) finite and birational, the node has a 2-point fibre, not an isomorphism, so normality is needed (Y is normal by `:284`); (d) quasi-finite but not finite, so properness is needed (f is projective) | Sound. Every hypothesis the step uses is present. |
| 3. §0.2 *Needs:* addition (`:301–304`) | both names checked against the pin | both exist at `ZariskisMainTheorem.lean:315` and `:372`; the gate reports `readme-ids-missing=0` | Sound; R02 for the name. |
| e(Ỹ)=e(Y)−s+Σ_r(n_r+1); component trees; fibres connected; Noether bound; ruledness direction; Downstream consumers claim | as in PRREVIEW-K3Surfaces~9 | e.g. one A₁: 24−1+2=25=24+1; a cycle of m (−2)-curves has (ΣE_i)²=−2m+2m=0; e(Ỹ)=24+Σn_r>24 against 12χ≤24 | Carried; untouched by the diff. |
| Restricted structure and its Checks; p-closedness; norm in (b); (U) at p=2; (i) in characteristic 0; Ogg in step 3; L=O(Δ); plurigenera in (a); b_i≤0; e(Y)=e(X)=24; Castelnuovo–Zariski | as in PRREVIEW-K3Surfaces~8 | e.g. (x∂)^p(xⁿ)=n xⁿ; N(π^*u)=u^p | Carried; untouched. |
| Statements untouched since 771182d (`IsAlgebraicK3`; double sextic; Theorem D c₂ values 0, 12, 12, 12, 84, 36; Hodge diamond; twistor conic; strong Torelli; gluing iff; fixed loci; marking group; 56 rows) | as in the review at 771182d | values as computed there | Carried. |

**Ownership by object.** The diff adds no object. The finite-neighbourhood step is owned by Mathlib, which R02 asks to cite exactly. Ownership of (U) at p=2 is settled in this folder's favour by the merge order; the residue is R01. Ownership against other open pull requests was checked through the #1375 checkout, the overlaps listing and `roadmaps grep`.

## Not verifiable

- Rudakov–Šafarevič 1983, p.1502 (characteristic-3 pencil selection in sub-target (iv)): paywalled and recorded as uncertified. The diff does not touch it.
- The board package has no `design/plan.json`, so I could not check whether `gap:integral-topology` and `gap:enriques-ruledness` are registered where the intake reads them.

## Source issues

- none
