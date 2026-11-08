# Review of TopologicalMirrorSymmetryForHitchinSystems (pull request #1814 at 447001d)

**Verdict:** accepted

Incremental re-review of the 132 lines of `TauCetiRoadmap/TopologicalMirrorSymmetryForHitchinSystems/README.md` changed since cceef7d (`Suggested.lean` is unchanged). Every finding of the previous report is repaired, no repair introduced a new problem, the worker's gate passes every check at this head, the dependency check reports no problem, and `Suggested.lean` elaborates with no diagnostics. No finding.

## Previous findings

- R01 — repaired: §4.2 now states "For n odd, n divides deg M; choose Q with n deg Q=deg M and take N=M⁻¹Q^n. For n even, choose T with deg T=−(n−1)deg D and take N=T^(n/2)M⁻¹"; the parity clause is gone from Conventions (line 19), §4.2 (line 874) and §4.3 (line 890); the Checks at line 884 carry the n=2, deg D=1 and n=4, deg D=1, e=3 instances. Recomputed below.
- R02 — repaired: §2.2 bullet (line 519) reads "implies the sufficient local Brauer condition of this subsection by extension of band"; `localBrauer` occurs nowhere in the folder.
- R03 — repaired: the thirteen contract lines (57–125) carry `(gap:<slug>)`; every `*Needs:*` line and `### Dependencies` paragraph that cites a contract by nickname now adds its slug (117 occurrences over 13 slugs). Each slug, its supplier and its needs sentence agree verbatim with the plan's `gaps` entry (checked by script against `design/plan.json`).
- R04 — repaired: §5.1 (line 1005) adds "GWZ20 proves (b) for constant Γ=J_X[n]; for nonsplit J_X[n] over k the finite-field equality is this roadmap's extension through … (gap:generic-orbifold-transgression), with the trace identity of §2.7 descended as in §3.3"; §2.7 (line 611) adds the same remark for Theorem 6.12; §2.1 (line 484) says Definition 4.10's Γ is an abstract, hence constant, group.
- R05 — repaired: §2.1 (line 484) now states admissibility as Definition 4.10 (U smooth quasi-projective, Γ a finite abelian group of invertible order with a dense free locus, |Γ|th roots on the base), attributes the codimension-two bound to Definition 6.8(c), records that quasi-projectivity makes the action good in the sense of §0.1 and the coarse quotient a scheme, and points to §3.1 for quasi-projectivity of M_SL^L.

## Verified sound

**Gate, dependency check, elaboration.** Worker's gate at 447001d: every check 0, `OK`. My run of `gate --depcheck … --movable`: `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean`: exit 0, no output. `git diff --stat origin/main...HEAD` outside the folder: empty. `Suggested.lean` is byte-identical to the file reviewed at cceef7d (a `module` file with `public import Mathlib`, one docstring naming every headline as not statable with the missing carrier, an empty namespace); the previous report's conclusions on headlines, padding and the `#check` comparison stand (nothing is declared, so there is nothing to probe).

**Changed passages against the source** (GWZ20 read in the legal arXiv copy 1707.06417v3, cache line numbers):
- §2.1 admissibility = Definition 4.10, line 1164: smooth quasi-projective R-variety, generically fixed-point-free action of a finite abelian group Γ of invertible order, R containing the |Γ|th roots of unity, geometric quotient Y/Γ. The README's four clauses are exactly these; the codimension-two clause is Definition 6.8(c), line 2002 ("codim(M∖M′) ≥ 2"), and the README now attributes it there. The source's own remark at line 2006 (condition (c) makes M generically a scheme) agrees with "M′ is an algebraic space, with no residual stabilizers".
- §2.7 = Theorem 6.12, line 2051: stated for a dual pair over a finite field k, whose stacks are admissible in the sense of Definition 4.10, hence for an abstract (constant) Γ; the README's new clause says exactly this.
- §4.2 = Theorem 7.16, line 2551: hypotheses p > n, coprime n, d, D⊗ω⁻¹ positive or trivial, a primitive n^(2g)th root in k, no parity; conclusion #M_SL^L = #M_SL^(L^e N^(e−1)) for every e prime to n with N of degree 0. The README's statement matches it (the source's proof, lines 2584–2591, computes deg M wrongly as (−deg D)n(n−1) and writes exponent e−1; the previous report records both as source issues, and the README's n-odd/n-even route repairs the proof).
- §4.3 = Corollary 7.17, line 2599: Betti and Hodge numbers of M_SL^L and M_GL^d independent of d, no parity.
- §5.1 = §7.4 setup, lines 2605–2606 ("Γ = Pic⁰(X)[n] is constant over R") and Theorem 7.21, lines 2671–2685 (part (b) deduced from Theorem 6.12 under that setup). The README's clause "GWZ20 proves (b) for constant Γ" is what the source does.

**Declared gaps.** All thirteen slugs appear in the README's contract lines with the plan's supplier and needs sentence verbatim; each supplier is earlier in the merge order; the previous report's precision and minimality checks are unchanged by this diff.

**Internal consistency of the repair.** The Layer 4 example at line 995 ("For n=2,g=2,D=ω, choose Q of degree −1 … N=ωQ² has degree 2−2=0") keeps the Q-choice at even n; that is consistent with the new §4.2, whose Check at line 884 states that at (2,2,ω) both N=Tω and N=ωQ² have degree 0 and their labels differ by a square (computed below). §4.6 (line 950) already argued without parity ("for even n the unit a is odd"), and its argument is the same one §4.2 now uses.

**Adversarial pass.** Rows for the changed statements carry computed values; rows for untouched statements are carried from the r1 report (PRREVIEW-TopologicalMirrorSymmetryForHitchinSystems~1, "Adversarial pass"), whose values I did not recompute.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| Conventions (changed): no parity of (n−1)deg D; correction line by parity of n | (n, deg D) = (2,1), (3,1), (2,2) | (n−1)deg D = 1 (odd), 2, 2; n ∤ deg M only in the first case, where the even-n line T applies | holds |
| §4.2 (changed): deg M = −n(n−1)deg D/2 | (n, deg D) = (2,1), (2,2), (3,1), (4,1), (6,1) | −1, −2, −3, −6, −15; n ∣ deg M in cases 2, 3, 5 only; (n−1)deg D even exactly there | holds, matches line 876 |
| §4.2 (changed): even-n line deg T = −(n−1)deg D, deg N = 0 | (2,1): deg T = −1, N = TM⁻¹: −1+1; (2,2): deg T = −2, N = Tω: −2+2; (4,1): deg T = −3, N = T²M⁻¹: −6+6; (6,1): deg T = −5, N = T³M⁻¹: −15+15 | 0, 0, 0, 0 | holds |
| §4.2 (changed): L^e N^(e−1) = L^e M^(1−e) ⊗ (T^((e−1)/2))^n for n even | (4,1,e=3): N² = T⁴M⁻², L³N² = L³M⁻²T⁴, T⁴ = (T¹)⁴; (6,1,e=5): N⁴ = T¹²M⁻⁴ = M⁻⁴(T²)⁶; (2,1,e=−1): N⁻² = T⁻²M², T⁻² = (T⁻¹)² | nth powers T^(n(e−1)/2) in every case; (e−1)/2 ∈ ℤ because e is odd when n is even | holds |
| §4.2 (changed): odd-n line | (3,1,e=2): deg Q = −1, N = M⁻¹Q³ of degree 3−3 = 0; L²N = L²M⁻¹Q³, tensor by π*Q | label L²M⁻¹ reached, e even allowed for odd n | holds |
| §4.2 Check (changed): (2,2,ω), both choices | N_T = Tω, N_Q = ωQ² | N_T/N_Q = TQ⁻²; (TQ⁻²)^(e−1) = ((TQ⁻²)^((e−1)/2))² for e odd | holds |
| §4.2 Check (changed): (2,1), T = D⁻¹ | M = D⁻¹, N = D⁻¹·D | N = O; L^e = L⊗(L^((e−1)/2))² for odd e, so the comparison is §3.5's determinant twist | holds |
| §4.2 Check (changed): existence of Q or T over 𝔽q | degree −1 component of Pic for g = 1 over 𝔽₂ | Pic¹(E)(𝔽₂) ≠ ∅ since E(𝔽₂) ≠ ∅ (Lang/Br(𝔽q) = 0); the integer calculation alone gives only the degree | holds |
| §4.3 (changed): SL independence without parity | (2,1): d₁ = 1, d₂ = 3, e = 3 ≡ d₂d₁⁻¹ mod 2; (d₂−ed₁)/n = 0 | second determinant differs from L₁³N² by an nth power, N from §4.2's even-n line | holds |
| §2.1 (changed): admissibility vs Definition 4.10 | E×𝔸¹ with trivial Γ; [𝔸¹/C₂] over 𝔽₃ (μ₂ ⊂ 𝔽₃, 2 invertible); BΓ at genus one, D = ω | admissible, free locus everything; admissible, free locus 𝔸¹∖{0} of codimension-one complement (so the Definition 6.8(c) bound is a separate condition, as the README says); not admissible: no free locus | holds; the Definition 6.8(c) attribution is the right one |
| §2.1 (changed): quasi-projective ⇒ good action ⇒ U/Γ a scheme | finite orbit in a quasi-projective U | an affine open contains any finite set of points of a quasi-projective scheme | holds |
| §2.1 (changed): codimension of the free locus from 6.8(c) | U → [U/Γ] a Γ-torsor | preimage of M′ is free with complement the preimage of M∖M′, codimension preserved under finite étale maps: ≥ 2 | holds |
| §2.2 bullet (changed): μr splitting ⇒ Brauer neutrality | band change μr → 𝔾ₘ on a split μr-gerbe | the induced 𝔾ₘ-gerbe is split, Brauer class 0; converse fails when Pic/r ≠ 0 | holds |
| §2.7 remark (changed): constant Γ in Theorem 6.12 | source lines 1164, 2051 | admissible stacks have an abstract Γ; the nonsplit 𝔽₁₇ curve of line 715 is outside the source's statement and inside the README's | holds |
| §5.1 remark (changed): constant Γ in Theorem 7.21(b) | source lines 2605, 2685 | (b) is Theorem 6.12 plus Proposition 7.20 under "Γ constant over R" | holds |
| Every other statement (unchanged): §§0.1–0.8, 1.1–1.6, 2.3–2.6, 2.8, 3.1–3.10, 4.1, 4.4–4.8, 5.2–5.6, the Lean docstring | as in the r1 report | values as recorded in the r1 report's table (34 rows) | carried, no change |

## Not verifiable

- GWZ20 published version (Inventiones 221, 2020): paywalled, recorded `uncertified`; read in the arXiv v3 copy, whose numbering agrees with the README's locators in the passages this diff touches (Definition 4.10, Definition 6.8, Theorem 6.12, Theorem 7.16, Corollary 7.17, Theorem 7.21). The published page numbers in the README were not checked.
- The untouched passages, their locators (HT03, ITO04, BITTNER04) and the ownership search against open pull requests were not redone in this incremental review; the r1 report's findings on them stand.

## Source issues

- none new (the seven issues in GWZ20 recorded by the r1 report, including the deg M and exponent slips in the proof of Theorem 7.16 at lines 2584–2591 that the repaired §4.2 works around, stand).
