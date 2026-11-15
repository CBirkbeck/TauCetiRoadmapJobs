# Review of MetaplecticAutomorphicFormsPartII (pull request #2261 at cb920a7)

**Verdict:** accepted

No findings. Incremental re-review of the 11 lines changed in `TauCetiRoadmap/MetaplecticAutomorphicFormsPartII/README.md` since `32356e5`, and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: `README.md:286–290` now gives the projector API (`e(e f) = e f`; image exactly the even functions; kernel exactly the odd functions) and `README.md:301–303` three `𝔽₃` Checks with the wrong models named. No new problem introduced.

## Verified sound

Here `e = evenPart X = (1 + R)/2`, `(Rf)(z) = f(−z)`, `δₐ` is the indicator of `a`.

| Statement | Instances tried | Computed left side | Computed right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §2.2 API: `e(e f) = e f` (`README.md:288`) | `X = 𝔽₃`, `f = δ₁`; general `f` | `e(eδ₁) = e((δ₁+δ₂)/2) = (δ₁+δ₂)/2`; `((f(z)+f(−z))/2 + (f(−z)+f(z))/2)/2` | `eδ₁ = (δ₁+δ₂)/2`; `(f(z)+f(−z))/2` | Equal | — |
| §2.2 API: image of `e` = even functions (`README.md:289`) | `f = δ₁`; even `f = δ₁+δ₂`; `X = 0`; `X = 𝔽₂` | `(eδ₁)(1) = (eδ₁)(2) = 1/2`; `e(δ₁+δ₂) = δ₁+δ₂`; `e = id` when `−z = z` | Even condition holds; fixed; every function is even when `−z = z` | Both inclusions hold, including `X = 0` and 2-torsion `X` | — |
| §2.2 API: kernel of `e` = odd functions (`README.md:290`) | `δ₁−δ₂` (odd); `δ₀` (not odd); `X = 0` | `e(δ₁−δ₂) = 0`; `eδ₀ = δ₀ ≠ 0`; kernel of `id` is `0` | `δ₁−δ₂` odd; `δ₀(0) = 1 ≠ −1`; odd on `X = 0` forces `f(0) = 0` | Both directions hold | — |
| §2.2 Check 1 (`README.md:301`) | `δ₀` over `𝔽₃` | `eδ₀(z) = (δ₀(z)+δ₀(−z))/2 = δ₀(z)` | Zero projector: `0`; `(1−R)/2`: `(δ₀−δ₀)/2 = 0` | Check true; both wrong models excluded | — |
| §2.2 Check 2 (`README.md:302`) | `δ₁` over `𝔽₃`, `Rδ₁ = δ₂` | `eδ₁ = (δ₁+δ₂)/2`, values `(0, 1/2, 1/2)` | Identity: `(0,1,0)`; `1+R`: `(0,1,1)` | Check true; both wrong models excluded | — |
| §2.2 Check 3 (`README.md:303`) | `δ₁−δ₂` over `𝔽₃` | `e(δ₁−δ₂) = (δ₁−δ₂+δ₂−δ₁)/2 = 0` | Identity: `(0,1,−1) ≠ 0` | Check true; identity excluded | — |
| `evenPart` (`Suggested.lean:208`) against the new API and against Check `README.md:304` | Lean body `(f z + f (−z))/2` on `δ₀, δ₁, δ₁−δ₂`; `S⁺ = span(δ₀, δ₁+δ₂)` for `q = 3` | `δ₀`, `(δ₁+δ₂)/2`, `0`; rank of `e` = 2 | README values `δ₀`, `(δ₁+δ₂)/2`, `0`; `dim S⁺ = (3+1)/2 = 2` | Lean and README agree; older Checks consistent | — |
| Locator N02, Theorem 4.2, pp. 20–22 (`README.md:286`) | N02 lines 230–236 (p. 20), proof through p. 22 | Source defines the even and odd function subspaces and proves invariance and irreducibility | README cites it only for the two subspaces; the projector identities are stated as elementary | Locator and use correct | — |

The rows of the previous review, of `32356e5`, for the untouched statements stand as there.

- Source locators checked against the text this round: 1 (N02 line 230, Theorem 4.2, printed p. 20; Theorem 4.3 begins N02 line 298, p. 22). Seeded sample: only §2.2 falls in the changed passage; the other 14 targets are untouched.
- Library declarations opened at the pin: `Mathlib/Algebra/Group/EvenFunction.lean:35` (`Function.Even`) and `:38` (`Function.Odd`) are predicates only; no even-part projector exists in pinned Mathlib or Tau Ceti (the one occurrence of the formula, `Mathlib/Analysis/Calculus/BumpFunction/FiniteDimension.lean:224`, is inside a proof), so `evenPart` restates nothing.
- Cross-roadmap citations: the changed passage adds none; the worker's resolve lists 0 unresolved; MetaplecticAutomorphicForms §§0.1, 0.5, 0.6, 0.8, 0.9a, 0.10 and MordellLawrenceVenkatesh Layer LV.3 §§3.1–3.2 exist at their open heads.
- Gate at `cb920a7`: every check passes (27 counters at 0, `build=0`). Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/MetaplecticAutomorphicFormsPartII/Suggested.lean`: exit 0, exactly 7 `sorry` warnings (lines 156, 185, 235, 271, 334, 369, 399), no other message. The file is unchanged since `32356e5`; the worker's elaborated signatures show 0 of 15 declarations with a lost binder.
- Pull request text against the head: adds one new folder (README, `Suggested.lean`, `metadata.toml`; 978 insertions, 0 deletions, 0 paths outside it), as the description says; the seven theorems it lists are the seven sorried theorems of the Lean file; the suppliers it names (MetaplecticAutomorphicForms Layer 0; #1063 and #1231 in the dependency block) are those of the README; the claims on `Sp₂(𝔽₃)`, arbitrary-field Layer 0, no exponent restriction, Frobenius reciprocity and character orthogonality match `README.md:19`, `:77`, `:203`, `:429`, `:36`. The repair since `32356e5` changes nothing the text describes. No sentence contradicted, nothing left unstated.
- Style of the changed lines: no LaTeX, no process words, no backticked Lean name of the roadmap's own in the new API bullets or Checks.

Overlap check: read MetaplecticAutomorphicForms (#1063), MordellLawrenceVenkatesh (#1231) and RepresentationTheory/InductionRestriction (main); nothing shared with the changed passage (no roadmap, open or on main, states an even-function projector); the ownership of the untouched objects stands as in the previous review.

Source independence: changed passages only; 7 passages compared with 1 source (N02 lines 226–236), none shared (longest common run under 5 words, the forced phrase for the even and odd functions); largest share FS25 as in the previous review, unchanged; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Gerardin77, Theorem 2.4(b): settled as uncertified in the source manifest; not touched by this change.

## Source issues

- none

## For the human reviewers

- FS25 is the author-hosted manuscript dated April 15, 2025 (FS25 line 20), recorded as `author-page` in `packages/MetaplecticAutomorphicFormsPartII/sources.toml`; publication and reuse licence are not established by that access classification.
- Gerardin77 is settled as uncertified in `packages/MetaplecticAutomorphicFormsPartII/sources.toml`; wording and arrangement could not be compared directly with it. F21 supplies the readable correction, and FS25 has the largest citation share.
