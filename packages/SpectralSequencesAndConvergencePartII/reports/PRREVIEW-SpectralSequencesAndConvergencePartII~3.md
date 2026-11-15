# Review of SpectralSequencesAndConvergencePartII (pull request #2307 at b05690b)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `b05690b`; this round reads the pull request's title and description against the head. No findings.

## Previous findings

- The previous review, of `b05690b`, had no findings; there is nothing to account for.

## Verified sound

Sections refer to `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md`. The diff changes no statement; the rows are statements the description's sentences cite.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.1–6.2 Bockstein pages (description: “multiplication by a chosen ring element is injective”, “stabilisation, limit pages”) | `M = (ℤ →(×p) ℤ)`, degrees `0, 1`, `f = p` | `H⁰ = 0`, `H¹ = ℤ/p`. `r = 1`: `0 → 0 → E₁⁰ → H¹[p] = ℤ/p → 0`, `E₁⁰ = H⁰(M/p) = ℤ/p`; `E₁¹ = ℤ/p`. `r = 2`: `pH¹ = 0`, `E₂ = 0`. Bound `max(0,1)+1 = 2`. | holds | none |
| §6.2 stabilisation bound | `M = (ℤ →(×p²) ℤ)`, `f = p` | `H¹ = ℤ/p²`, `a = 0`, `b = 2`. `E₂⁰ ≅ (pH¹)[p] = ℤ/p`, `E₃⁰ ≅ (p²H¹)[p] = 0`; `d₁ = 0`, `d₂ ≠ 0`; stable from page `3 = max(0,2)+1`; `E_∞⁰ = H̄⁰ ⊗ ℤ/p = 0`. | holds | none |
| §6.1 Check “Torsion-freeness is needed” | `M = ℤ/p[0]`, `f = p` | Multiplication by `p` is `0`, kernel `ℤ/p ≠ 0`: `0 → M → M → M/pM → 0` not exact; excluded by the hypothesis. | negative control holds | none |
| Conventions, Tor witness (description: Tor over commutative rings) | `R = ℤ`, `K = ℤ/2[0]`, `M = ℤ/2` | Resolution `ℤ →(×2) ℤ` tensored with `ℤ/2`: `ℤ/2 →(0) ℤ/2`, so `H⁰ = H^{−1} = ℤ/2`; `E₂^{0,0} = ℤ/2 ⊗ ℤ/2 = ℤ/2`, `E₂^{−1,0} = Tor₁ = ℤ/2`. | holds | none |
| §1.3(a) finite antidiagonals (description: “require only an abelian category”) | `K^{0,0} = K^{1,0} = ℤ`, horizontal `×2`, else `0` | `H¹(Tot K) = ℤ/2`, `H⁰ = 0`. `′E₁ = ℤ` at `(0,0)`, `(1,0)`, `d₁ = ×2`, `′E₂^{1,0} = ℤ/2`, `′E₂^{0,0} = 0`; filtration of `H¹` has one step. | holds | none |
| §4.4 (description: “Ext allows arbitrary rings”) | (a), (b), (c) read against Conventions line 227 | (b), Ext only: “for any rings”. (a) and (c) carry a Tor term and take `R`, `S` commutative. No Ext-only statement assumes commutativity. | consistent | none |

Rows for all other statements stand as in the previous review, of `b05690b`.

- Pull request text, sentence by sentence against the head: title (adds a roadmap: 3 files, 46 headings, 13 declarations, nothing removed); summary block against the Summary, Scope and Conventions (double-complex sequences, hyper(co)homology, composition theorem, Tor balancing in monoidal abelian categories, universal-coefficient, Künneth, change of rings, pairings, Bockstein); half-plane hypotheses against Conventions and §1.3(b), (c) (exact sequential colimits; repleteness and regularity for `Tot^Π`); consumers against *Downstream consumers* (CohomologyOfGroups, EtaleDualityAndPerverseSheaves, TorsionCohomologyInfrastructure all named there); “Part II of SpectralSequencesAndConvergence … stops at” against Scope lines 52–59. No sentence is contradicted, and no removal, renumbering or dropped supplier exists to state.
- Description's validation line recomputed: 11 `sorry` warnings and nothing else from `lake env lean` on `Suggested.lean` (11 theorems, 2 real-bodied definitions); single `import Mathlib`; `set_option` 0; sorry'd data 0; outside-folder diff 0 paths.
- Gate rerun at `b05690b`: every check 0, `OK`; the worker's gate including the targeted build passed.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Cross-roadmap citations resolved: SpectralSequencesAndConvergence at the head of its open pull request (§3.6, §§6.1–6.3, §§7.1–7.5 present; `TauCeti.IsReplete` used there as the description's “replete categories” says); StableHomotopyKTheory, GrothendieckEulerForms, DerivedModuleAlgebra are on main; ArithmeticGaloisDuality precedes this roadmap in the merge order.
- Source locators: none in changed passages (the folder did not change); the seeded sample falls in no changed passage.
- Remark (no change asked): the description's paragraph ending “It covers:” is followed by no list; the summary block above it carries the contents.

Overlap check: read SpectralSequencesAndConvergence (open), DerivedModuleAlgebra and GrothendieckEulerForms (main); nothing changed in the folder, no object added; nothing shared is owned twice.

Source independence: changed passages only; 0 passages changed, so 0 compared; largest share stacks-05QI, 17 of 90 locators; no layer added, removed or reordered, so the contents comparison stands as in the previous review: independent. Wording against the four uncertified works was not tested.

## Not verifiable

- weibel1994, mccleary2001, cartan-eilenberg1956, massey1954: settled as uncertified; no text was read.
- The description's sentence on AI assistance (which model ported the package, the number of earlier rounds) describes process, not the head; not checked against the folder.

## Source issues

- none

## For the human reviewers

- may-primer is an author-hosted primer with no journal publication identified in the roadmap's references; §§5.1–5.2 and §§6.1–6.2 cite it. Four other works (weibel1994, mccleary2001, cartan-eilenberg1956, massey1954) are uncertified; their wording could not be compared.
- Acceptance is conditional on the 19 declared supplier gaps on SpectralSequencesAndConvergence, which is still an open pull request and merges first.
