# Review of IharaZetaFunction (pull request #2946 at 3ea6068)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated identity (the trace formula, the determinant formula, Bass's multiplied formula, Horton's formula, the regular-case factorization, the functional equation) and every number in a Check was recomputed exactly and agrees; the irreducibility criterion and the Ramanujan/Riemann-hypothesis equivalence were checked by hand at their boundary cases; all source locators were read in the text and support the statements, including the two slips of the source that the README reports. There is one small correction and one format note, neither blocking, and one question for the author. Two points are left to the human reviewers (the single source is an author's-page draft; part of it was read through OCR).

## C01 — The Petersen example reads as if `±1` and `1/2` had modulus `2^(−1/2)`

In the Examples of Layer 5 (README lines 484–486) the zeros of `det(1 − uB)` are listed as "`±1`, `1/2`, and the roots of `1 − u + 2u²` and `1 + 2u + 2u²`, all of modulus `2^(−1/2)`". Only the four roots of the two quadratics have that modulus (product of each pair `1/2`, complex conjugate); `±1` and `1/2` are the boundary zeros, which is the point of the open strip. The K₄ Check of 5.3 words the same fact unambiguously. Writing "…and the roots of `1 − u + 2u²` and `1 + 2u + 2u²`, the latter four of modulus `2^(−1/2)`" removes the ambiguity.

## N01 — Two Checks report that a computation was run instead of giving a value

The last Check of 4.2 ("Exact check of the equivalence on all graphs with at most 7 vertices…") and the last Check of 5.2 ("Verified as an identity of rational functions for every regular graph with at most 7 vertices…") give a reader nothing to recompute. Each would carry more as one computed instance, for example for 5.2 the two sides at `u = 2` on `K₄` (`q = 2`, `w = 1/4`).

## Questions for the author

- The References give the draft's date as 29 December 2009; the first page of the copy at the cited address reads, as far as the extracted text shows, 28 December 2009 (Terras line 48). Is the date in the README taken from the file's metadata? I could not tell whether that line of the extraction is from a text layer or from OCR, so this is a question, not a correction.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Hashimoto matrix, row sums | triangle; `K₂`; paw | triangle: all row sums 1. `K₂`: `B = 0`. Paw dart `(v,w)`: row sum 2 = `deg w − 1`; `deg v − 1 = 0` | agrees; source 13(1) slip confirmed | none |
| 1.1 incidence identities | by hand | `(SJ)(v,b) = S(v,b.symm) = T(v,b)`; `(TᵀS)(a,b) = [a.snd = b.fst]`; `STᵀ = A` | hold | none |
| 1.2 trace formula `tr Bᵐ = N_m`, `m ≥ 1` | `K₂`, isolated vertex, empty, `P₃`, triangle, `K₄`, paw, `C₅`, `K₄`+isolated, `K₄`+pendant; `m = 1..8`; brute force on the Lean definition | `K₄`: both `0,0,24,24,0,96,168,168`; `C₅`: both `0,0,0,0,10,0,0,0`; paw: both `0,0,6,0,0,6,0,0` | equal in all 10 graphs | none |
| 1.2 `m = 0` excluded | `K₄`, triangle | `tr B⁰ = 12` vs `N₀ = 4`; `6` vs `3` | hypothesis needed | none |
| 1.2 Check `K₄` to `m = 11` | matrix powers | `…,528,1200,1848`; source Example 2 lists the same coefficients | agrees | none |
| 1.2 no-tail Check | paw, `m = 5` | `N₅ = tr B⁵ = 0`; the two walks from `v` fail only the closing condition | agrees | none |
| 2.1 `ζ · det(1 − uB) = 1` | `K₄` to order 8; triangle | `1/det`: `1,0,0,8,6,0,48,72,39`; `exp(L)` by hand: `u⁶`: `16 + 32 = 48`, `u⁷`: `24 + 48`, `u⁸`: `21 + 18` | agrees | none |
| 2.1 junk value | `m = 0` | `N₀/0 = 0` in `ℚ`, constant coefficient 0, substitution legitimate | fine | none |
| 2.1 Check without `1/m` | triangle | `exp(6u³/(1−u³)) = 1 + 6u³ + 24u⁶` | agrees | none |
| 3.1 Bass, multiplied form | the 10 graphs above, 25 rational points each (degree ≤ 22) | `K₂`: `(1−X²)²·1 = (1−X²)(1−X²)`; isolated vertex: `(1−X²)·1 = 1·(1−X²)`; `P₃` vertex side `1 − X²` | identity holds in all | none |
| 3.1 route | by hand | `(1−XJ)(1−XB) = c − X(Tᵀ − XSᵀ)S`; Sylvester gives `cⁿ·cᵉ·det(1−XB) = c²ᵉ·det(…)` | route sound | none |
| 3.1 `K₄` factorization | exact | `det(1−XB) = (1−X²)²(1−X)(1−2X)(1+X+2X²)³` | agrees (source Example 2) | none |
| 4.1 Horton, multiplied form | the 10 graphs | `K₄`: `(X−4)⁴(X−1)⁸`; `P₃`: `X²(X−1)²`; paw: `X(X−4)(X−1)⁶`; isolated vertex: `X − 1` both sides | holds in all | none |
| 4.1 block structure | by hand | `(BᵀB)(a,b) ≠ 0` only if `a.fst = b.fst`; `d−1` on, `d−2` off the diagonal | grouped by start, as README says | none |
| 4.2 irreducibility iff | `K₂`; `C_n`; `K₄`+isolated; empty type; pendant vertex; `K₄ ⊔ K₄` | `K₂`: `B = 0`, reducible, degrees 1. `C_n`: two orbits, `e = n`. `K₄`+isolated: irreducible, not connected (excluded by hypothesis) | both directions consistent; hypotheses needed | none |
| 4.2 necessity, `e = n` | by hand | `sᵏ(a) = a.symm`: `k = 2j` gives `sʲ(a)` self-reverse; `k = 2j+1` gives a step back | argument correct | none |
| 4.2 Mathlib notion | `Matrix.IsIrreducible` at the pin | nonnegative entries and paths of positive length between all pairs | README describes it correctly | none |
| 4 Example theta graph | traces `m = 1..18` | nonzero only at 6, 12, 18: `36, 108, 396` | agrees | none |
| 5.1 `charpoly(B)` for regular graphs | `K₄`, `K₃,₃`, Petersen, `C₅` (`q = 1`), `K₄ ⊔ K₄`, the 12-vertex 5-regular graph; `K₂` (`q = 0`) | exact equality in the six; `K₂`: `X²` vs `X²(X²−1)` | holds; `q ≥ 1` needed | none |
| 5.1 Checks | Petersen, `K₃,₃` | claimed factorizations equal the computed `charpoly(B)` | agree | none |
| 5.2 functional equation | same six graphs at `u = 2, −3/5, 7/4, 1/3`; `u = 0`; `K₂` at `u = 2` | equal in all; `u = 0`: `1 = 1`; `K₂`: `−1` vs `1/4` | holds; `q ≥ 1` needed | none |
| 5.3 Ramanujan iff RH, `q ≥ 2` | by hand: `λ = ±(q+1)`; `|λ| ≤ 2√q`; `2√q < |λ| < q+1`; empty `V`; `C₅` | roots `±1, ±1/q`; modulus `q^(−1/2)`; larger root `< 1` iff `λ < q+1`, two distinct reals in `(1/q, 1)`; `C₅`: `det(1 − B) = 0` | both directions hold; `q ≥ 2` needed | none |
| 5.3 "neither" Check | the 12-vertex graph | 5-regular; `charpoly(A)` divisible by `X² − 2X − 11` exactly; `λ = 1+2√3 ≈ 4.46 ∈ (4, 5)` | agrees | none |
| Layer 5 Example (C01) | Petersen | roots of the two quadratics have modulus `2^(−1/2)`; `±1`, `1/2` do not | wording ambiguous | C01 |
| Lean signatures against README | all 14 declarations | rings `ℤ`, `ℚ`, `ℝ`, `ℂ` and hypotheses `1 ≤ m`, `1 ≤ q`, `2 ≤ q`, `Nonempty V`, `∀ v, 1 ≤ deg v` match the prose | same generality | none |

- Source locators checked against the text: 19 (Terras: usual hypotheses p. 6; Definition 2, Example 1 p. 7; Theorem 1, Definition 4 p. 10; Example 2 p. 11; Definition 8, (4.4) p. 17; Definition 9, (4.5), (4.7) p. 18; Proposition 2, Definition 16, Theorem 3 pp. 27–28; Proposition 3 p. 28 and Exercise 21 p. 29; Theorem 11 p. 47; Corollary 2 p. 48; Proposition 4 and Bass's proof p. 51; Theorem 13, Lemma 2 p. 52; Corollary 3 p. 53). The page offset of six holds at each.
- Library declarations opened at the pin: 48 of the 59 Mathlib names the README cites (all present; the rest are core names such as `Matrix.trace` and `Nat.card`; `Matrix.IsIrreducible` at `Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean:83`, `Matrix.charpoly_mul_comm'` at `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:249`, `Matrix.charpolyRev` at `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:290`) and Tau Ceti `Matrix.norm_le_of_mulVec_le_smul` at `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Positive.lean:268`. No Hashimoto matrix, non-backtracking walk or graph zeta function in either library; no logarithmic-derivative identity for `charpolyRev` in Mathlib.
- Cross-roadmap citations resolved: DeligneWeightsAndPurity §0.10 (ii) on main states the identity for an endomorphism of a finite-dimensional vector space over a field, as used; SpectralGraphBounds §§1.1–1.3, 5.2, DiscreteQuantumWalks Layers 1–2, PeriodicNonnegativeMatrices and MatchingPolynomial exist at their open heads with the subjects named (scope citations, not suppliers).
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; the one supplier roadmap is on main and earlier in the merge order.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/IharaZetaFunction/Suggested.lean`: eight `sorry` warnings, nothing else.
- One-tactic probe (`rfl`, `simp`, `simp` with the six definitions unfolded, `infer_instance`): none of the eight theorems closes. All eight README headlines are stated; none is a stand-in. `#check`-level comparison of the 14 elaborated types with the README: four definitions do not carry `[Fintype V]` (not in their types); every theorem does, so nothing is lost.
- Pull-request text read against the head: title and description agree with the folder (new roadmap, 8 theorems, 6 definitions, one supplier roadmap on main); no change outside the folder.
- Overlap check: read SpectralGraphBounds, PeriodicNonnegativeMatrices, MatchingPolynomial, StronglyRegularAndMooreGraphs, ExpanderConstructions (open, closest by vocabulary) and DiscreteQuantumWalks; no roadmap on main is close; nothing shared. No declaration name of `Suggested.lean` occurs in theirs.

Source independence: 21 passages compared with 1 source (the 15 locators in the layers and six routes or docstrings: 1.2, 2.1, 3.1, 4.1, 4.2, 5.3), none shared; the routes of 2.1 and 3.1 differ from the source's (logarithmic derivative instead of the matrix logarithm; Sylvester's identity instead of the block factorization); largest share Terras, 15 of 15 locators; contents compared with Terras: independent (Layers 1–5 draw on §§4 and 11, §4, §§2 and 11.1, §11.2, §7 in that order, not a run of its sections).

Research link: The headline targets are Ihara's zeta function (Ihara 1966), Bass's determinant formula (Bass 1992), Horton's results on the edge matrix (Horton 2006, 2007) and the link with Ramanujan graphs (Lubotzky–Phillips–Sarnak 1988), as attributed in Terras §§2, 7, 11 and its bibliography; rests on the source read.

## Not verifiable

- The displayed formulas of Terras Theorem 1 (p. 10), Definition 16 (p. 27), Case 1 of the proof of Theorem 3 (p. 27) and Proposition 3(2) (p. 28): these pages were read through OCR, which garbles or drops the displays. The surrounding text and the legible fragments agree with the README; the formulas themselves were confirmed by computation, not symbol by symbol against the page.
- The headings "Proposition 2", "Theorem 1" and "Corollary 3" are missing from the OCR text; the statements were identified by their content and position.

## Source issues

- **Misprint** in Terras at Theorem 13(1), printed p. 52: the source says the row sum of the edge matrix is one less than the degree of the starting vertex of the edge; it should be the terminal vertex, by the convention of Definition 8; affects a stated result.
- **Misprint** in Terras at the proof of Theorem 3, Case 3, printed p. 27: the source says the two real reciprocal roots have equal modulus different from `√q`; it should be distinct moduli, both strictly between `1` and `q`, with product `q`; affects the proof.
- **Misprint** in Terras at the proof of Theorem 13(2), printed p. 52: the source says to group the edges ending at the same vertex to block-diagonalise `W₁ᵀW₁`; it should be the edges starting at the same vertex (ending is right for `W₁W₁ᵀ`); affects nothing.

## For the human reviewers

- **Licence / source.** The only cited source is the December 2009 draft of Terras's book on the author's own page (`TauCetiRoadmap/IharaZetaFunction/README.md` lines 601–610); page numbers are the draft's, not those of the published Cambridge University Press book.
- **Not fully tested.** 180 of the 348 pages of that draft have no text layer and were read through OCR; four displayed formulas could be matched only by structure (see Not verifiable).
