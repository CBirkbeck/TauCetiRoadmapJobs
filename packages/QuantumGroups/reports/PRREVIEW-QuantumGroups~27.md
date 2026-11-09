# Review of QuantumGroups (pull request #1649 at 50d79b7)

**Verdict:** needs changes

Incremental re-review of the 21 lines changed in `TauCetiRoadmap/QuantumGroups/README.md` since `b3b2d26`; `Suggested.lean` is byte-identical. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with four `sorry` warnings and nothing else. The Layer 8 finding of the previous review is repaired. One P3 finding remains, and it is about the pull-request text, not the folder.

## R01 (P3) — The conflict with #1705 has no stated order, and the description describes an earlier head

Carried from the previous three reviews. No repair report marks it not actionable.

**Location:** this pull request's description (data): "Current head `d7a6c540…`"; "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged"; its dependency block names only #860.

**Claim:** two open pull requests change this roadmap and their heads conflict, so one is rebased on the other and the description says which. Neither is stated. The description is also false for this head: the README differs from main throughout, and `Suggested.lean` has six declarations.

**Witness:** `roadmaps overlaps QuantumGroups` at this head: "#1649 and #1705 conflict in `TauCetiRoadmap/QuantumGroups/README.md`, `TauCetiRoadmap/QuantumGroups/Suggested.lean`". #1705 is still at `96014ab` and numbers the Layer 0 objects §§0.2–0.3, where this head numbers them §§0.1–0.2.

**Repair (pull-request text, no folder edit):**
- Rewrite the description for `50d79b7`: §1.1 ClassicalMultipliers; Layer 0 as the single home of the C*-category and Temperley–Lieb comparison objects; Layer 8 on the native `TauCeti.UqSl2`; the six-declaration `Suggested.lean`.
- State which of #1649 and #1705 is rebased on the other. The second one keeps one numbering of Layer 0, so that CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras can cite it.

## Previous findings

- R01 — not repaired: the description still opens "Current head `d7a6c540…`" and does not mention #1705, which still conflicts at `96014ab`. Written again as R01 above.
- R02 — repaired: `README.md:75` "the Hom and endomorphism formulas … remain targets"; `:1441–1444` K diagonalizable "through the instance `TauCeti.IsLocallyFiniteModule.of_finite`"; `:1484–1486` cites `TauCeti.UqSl2.LadderModule.not_isTypeOne`; `:1528–1533` cites `instMonoidalCategory` and the monoidal `forgetToModule`.

The R02 repair introduced no new problem. The three passages are the ones the previous review asked for, and each was re-tested at the pin (below).

## Verified sound

**Gate.** Rerun on this head: every scanner 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The branch manifest pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.

**Dependency check** (the required command, output unmodified):

```text
depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The change adds no supplier and no *Needs:* edge.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean`: exit 0, four `declaration uses sorry` warnings (`:83`, `:111`, `:122`, `:130`). The file is unchanged since `b3b2d26`, so the `#check @name` comparison, the padding probe (16 one-tactic failures, no padding) and the headline list of the previous report stand; `scratch/signatures.md` gives the same six types. The flagged `[StarModule ℂ A]` is absent only from `AlgebraicHaar`, whose fields do not use it.

**Changed passages, each checked at Tau Ceti `2fd255d` in one scratch file:**

| Passage | Declaration at the pin | What was elaborated | Result |
| --- | --- | --- | --- |
| `:75` Scope, `:1441–1444` §8.3 | `TauCeti.IsLocallyFiniteModule.of_finite` (`RingTheory/Finiteness/LocallyFinite.lean:79`: `[IsNoetherianRing k] [Module.Finite k M]`); `TypeOne.lean:370` | an `example` proving `IsSignedTypeOne q V` for finite-dimensional `V` as `(… .mpr inferInstance).1` | elaborates; Scope no longer lists the diagonalizability as a target |
| `:1484–1486` §8.4 | `TauCeti.UqSl2.LadderModule.not_isTypeOne` (`QuantumGroups/UqSl2/TypeOne.lean:253`): `¬ IsTypeOne q (LadderModule q m (-1))` for every `m` at generic `q` | `#check` | matches "for every L_m^-"; local finiteness of L_0^- is `of_finite` |
| `:1528–1533` §8.5 | `TauCeti.FiniteHopfModuleCat.instMonoidalCategory` (`Algebra/Category/FiniteHopfModuleCat/Monoidal.lean:220`), the `Monoidal` instance (`:224`), `forgetToModule` (`Basic.lean:107`) | `#check` of both names; instance search for `(forgetToModule k H).Monoidal` | found (`instMonoidalModuleCatForgetToModule`) |

Text depending on the change: the §8.3 API bullet `:1452` ("diagonalizable K") and the *Needs:* lines of §§8.3–8.4 (`:1460`, `:1501`) remain consistent. The new §8.3 sentence cites a pinned declaration, not the §8.4 target, so no build-order edge §8.3 → §8.4 arises; the pinned proof goes through `exists_linearEquiv_dfinsupp_ladderModule`, i.e. complete reducibility, and does not assume diagonalizability.

**Seeded sample.** Of the sampled targets only §8.3 lies in a changed passage. Its locator (Virelizier Theorem 3.13 and Corollary 3.14, p.13) is unchanged and was read by the previous review at `virelizier` lines 625–636. The other sampled targets are untouched.

**Adversarial table.** Rows 1–17 and 21–23 of the previous report (review at `b3b2d26`) are carried unchanged: their statements are untouched (headlines `schur_orthogonality`, `compactType_iff`, `haar_modular_automorphism`, `haar_trace_iff_antipode_involutive`, `unitaryCoefficientSet`, and §§1.1–7.1, 8.6, 8.7). Rows for the changed statements, recomputed:

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 18 | §8.3 K diagonalizable on finite-dimensional modules, via §8.4's equivalence | q=1/2: L₁⁺; L₀⁻; zero module; a 2-dim Jordan block for K with E=F=0 | L₁⁺: K=diag(1/2, 2), eigenvalues ±q^k with ε=+; L₀⁻: K=−1=−q⁰, signed type 1 holds; zero module: both sides hold; Jordan block `[[1,1],[0,1]]`: KK⁻¹ relations hold but `[E,F]=0≠(K−K⁻¹)/(q−q⁻¹)=[[0,2],[0,0]]/(−3/2)`, so it is not a module and is no counterexample | pass | none |
| 19 | §8.4 L_m^- not type 1 | m=0, m=1 at q=1/2; q=−1 | m=0: K=−1, and −1=(1/2)^n has no integer solution; m=1: weights −1/2, −2, neither a power of 1/2. At q=−1, −1=q¹, which the hypothesis `IsGenericQuantumParameter q` excludes | pass | none |
| 20 | §8.5 monoidal structure through the coproduct, forgetful functor monoidal | H=k[C₂], sign ⊗ sign; unit object | g acts on sign⊗sign by (−1)(−1)=1 via Δg=g⊗g, the trivial module, where tensor over H would give dimension 1 with g acting by −1; unit: g acts by ε(g)=1 | pass | none |

**Cross-roadmap citations and overlaps.** `scratch/citations.md`: no citation and no Lean name found nowhere. `scratch/overlaps.md`: no dropped id either way and no id defined only by an open revision; the single item is #1705 (R01). The change adds no cross-roadmap citation. The ownership note on Layer 0 of the previous report stands unchanged: CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras are named only as later consumers.

**Shape.** The changed sentences carry no LaTeX, process word or pull-request number; every backticked name they add is a pinned Tau Ceti declaration or file, none a name of this roadmap's own.

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008), recorded `uncertified`: cited by locator only, as in the previous report. No changed passage cites it.

## Source issues

- none
