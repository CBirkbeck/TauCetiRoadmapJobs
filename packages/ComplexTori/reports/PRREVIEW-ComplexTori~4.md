# Review of ComplexTori (pull request #2550 at 88225db)
**Verdict:** accepted

**Summary.** Accepted, with no findings. This is an incremental re-review of the 31 lines changed since `e4cd103`: the three small corrections of the previous review are repaired, and the value now stated in §6.6 (the meridian of `D_t*` goes to `λ/m` in `π₁(Q) = Λ + ℤ·λ/m`) is correct, sign included, by the formula for `G⁻¹` of §6.3. The description was read against this head and against the change from main; no sentence of it is contradicted. Two format notes remain, none blocking; nothing is left for a human to decide beyond the note on the two paywalled textbooks.

## N01 — Convention 2 and the overview list `Y` as Hausdorff and second countable, while the theorem of §2.3 and the cited Tau Ceti family declarations assume Hausdorff and locally compact

The overview (line 8) and Convention 2 (line 70) against §2.3 (line 299), the supplier contract (line 1018) and the binders `[T2Space Y] [LocallyCompactSpace Y]` of `Suggested.lean`. Adding local compactness to Convention 2 (automatic for a finite-dimensional model) would align them.

## N02 — The module docstring of `Suggested.lean` describes §6.6 as the fundamental group of the reglued manifold, which §6.6 does not compute

The last bullet of the docstring (lines 75–77) reads "the reglued manifold, its independence of choices and its fundamental group and first homology (Layer 6, §§6.4–6.6)". §6.6 as it now stands states `π₁(Q) = H₁(Q)` and the map `π₁(Y*) → π₁(Q)`, the local input to a computation for the reglued manifold. Would "and the maps on `π₁` and `H₁` of the quotient and the collar" serve?

## Previous findings

The previous review, of `e4cd103`, had no findings (no R-numbered remark). Its small corrections and its format note:

- C01 — repaired: "The meridian of a punctured disc `{0 < ‖z‖ < R}` is the counterclockwise loop `s ↦ ρ·exp(2πis)` for a radius `0 < ρ < R`; its free homotopy class does not depend on `ρ`."
- C02 — repaired: "When the action is by translations and the family is the pullback by `z ↦ z^m` of a family over the `t`-disc, a logarithmic gauge identifies the quotient minus its central fibre with that family over the punctured `t`-disc".
- C03 — repaired: §6.6 states "`G⁻¹` followed by the inclusion `Q* ⊂ Q` sends `(μ, k)` to `μ + kλ/m`"; the unnamed request at the end of §6.5 is gone, and the description says so.
- N01 — not repaired: Convention 2 still has "`[T2Space Y]` and `[SecondCountableTopology Y]` stated explicitly"; repeated above as N01.

## Verified sound

| Statement | Instances tried | Values computed (text / computed) | Result | Change |
|---|---|---|---|---|
| §6.6: `π₁(Q) = Λ + ℤ·λ/m` via `F ⊂ Q` | `m=2`, `D×E`, translation `λ/2`; `m=1` | `F = E/(Λ+ℤλ/2)`, index 2 over `Λ` / extension `1→Λ→π₁(Q)→C_m→1`, equivariant retraction `X→T_0`; `m=1`: `Λ` | true | none |
| §6.6: `(μ,k) ↦ μ + kλ/m` | loop `t₀e^{2πis}` on zero section; fibre loop `μ`; `m=1` | text `λ/m` / lift `(z₀e^{2πis/m}, [(Log z₀/2πi + s/m)Πλ])` ends at generator·start: `+λ/m`; `μ↦μ`; `m=1`: `λ` | true, sign agrees with §6.3 | none |
| §6.6: `π₁(Y*) = H₁(Y*) = Λ × ℤ`; annuli | `Y` over `D_t` smoothly trivial (§2.3) | `Y* ≅ T × D_t*`, abelian, rank `2n+1` / same; annulus `T × A → T × D*` iso on `π₁` | true | none |
| §6.6 reversal | `m=3`, `λ=1` | meridian `−λ/m`; `ζ⁻¹=ζ²` gives `2λ ≡ −λ mod 3Λ` | true | none |
| Convention 7 | `D_z={‖z‖<r}`, `ρ<r` | loop norm `ρ < R`, inside the punctured disc; radial homotopy between radii | true | none |
| Overview gauge sentence | against §6.3 `G : Q* ≃ Y*` | "that family" = family over the `t`-disc / `Y` of Layer 6 | agrees | none |
| §6.5 (sample) | hypotheses held fixed | `M`, marked `Y`, `λ mod mΛ`, overlap identification / lift change is `mΛ` (§6.2) | consistent | none |
| §2.3 theorem in Lean (headline, untouched) | elaborated type against README | `[T2Space Y] [LocallyCompactSpace Y]`, `hgP : P y l = g y (P y₀ l)` / same | Lean = README | none |
| Docstring bullet on §§6.4–6.6 | against §6.6 | "its fundamental group" of reglued manifold / §6.6 gives `π₁(Q)` and `π₁(Y*)→π₁(Q)` | form | N02 |
| Convention 2 vs §2.3 | hypotheses on `Y` | T2 + second countable / T2 + locally compact | form | N01 |

The rows for the untouched statements stand as in the previous review, of `e4cd103`.

- Source locators checked against the text: 1 changed locator, BogomolovTschinkel2003 lines 107–109 (§3, p. 4): the source says that a circle bounding a section over a disc becomes homologous to a nontrivial cycle of the central fibre, which supports the sentence of §6.6. Of the seeded sample, only §6.5 falls in the changed passages (its text carries no source locator); §6.4's locator, lines 104–107, was read again.
- Library declarations: none added or changed by the diff; the elaborated type of the one theorem was compared with §2.3 again, every binder present.
- Cross-roadmap citations in the changed passages: §§1.4, 2.5, 3.5, 5.3, 6.2–6.5 exist at this head; AlgebraicTopology is cited as before; no supplier added or dropped against main (ComplexManifolds, AlgebraicTopology, GeometricTopology, the completed UniversalCovers).
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no file changed outside the folder; every automatic check passed.
- Elaboration: `Suggested.lean` exits 0, the `sorry` at line 112 the only warning.
- Description against the head: 18 Check blocks with 28 bullets, one theorem, four consumers, Brown absent from the references, the §6.5 and §6.6 paragraphs as the head has them, `metadata.toml` unchanged: all as stated.

Overlap check: read ComplexManifolds (main and its open revision); nothing shared: it owns quotients, gluing and line bundles and leaves complex-torus families to this roadmap.

Source independence: changed passages only; 3 passages compared with 1 source (BogomolovTschinkel2003: overview gauge sentence, §6.5, §6.6), none shared beyond single forced terms; largest share BogomolovTschinkel2003, 5 of 12 locators; no layer added, removed or reordered, so the arrangement stands as compared before: independent. Birkenhake–Lange and Barth–Hulek–Peters–Van de Ven could not be read.

Research link: Layers 5–6 formalise Kodaira's logarithmic transforms, which Bogomolov–Tschinkel (2003, §3, Proposition 3.1) use to build elliptic fibrations preserving simple connectivity and the Kähler property; Layers 1–3 feed the analytic abelian-variety families of AbelianSchemesAndArithmeticModuli. Rests on BogomolovTschinkel2003 §3 (read) and the README's consumers section.

## Not verifiable

- Birkenhake–Lange, *Complex Abelian Varieties*, Chapters 1 and 8 (Layer 1 and Layer 2 introductions): paywalled, cited by locator only; no changed passage cites it.
- Barth–Hulek–Peters–Van de Ven, *Compact Complex Surfaces*, Chapter V, p. 216 (Layer 5 and Layer 6 introductions): the same; the changed statements of Layer 6 were checked by computation instead.

Automatic checks set aside as false positives: the citation lookup lists the module path `TauCeti.Topology.Algebra.Module.DiscretePreimage` (README line 1054) as found nowhere, but that file exists at the pinned Tau Ceti and declares both lemmas attributed to it (its lines 78 and 190); the declaration extractor reads the docstring words "structure of" in `Suggested.lean` (lines 61–62) as a declaration named `of`, which does not exist.

## Source issues

- none

## For the human reviewers

- Not tested: the locators into Birkenhake–Lange (README Layer 1 and Layer 2 introductions) and Barth–Hulek–Peters–Van de Ven (Layer 5 and Layer 6 introductions) are paywalled and were not compared with the text; the largest-share source, BogomolovTschinkel2003, was read.
