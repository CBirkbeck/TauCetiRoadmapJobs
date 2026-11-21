# Review of FrobeniusRestrictedRieszSums (pull request #2920 at ebd2fa0)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** Accepted, with no findings. The identity 1.2, the bracket 1.8, the bound 1.9 and 0.8, both as stated in the README and as stated in `Suggested.lean`, hold under their stated hypotheses, and every numerical Check of Layers 0 and 1 recomputes correctly. There are five small corrections and one format note, none blocking. The corrections are: 1.2 is stated more narrowly than its own route proves; the NEW targets cite the formal proof with no file or declaration; a parenthetical in 1.4 (a) is ambiguous; one commentary sentence in 0.9 is inaccurate; and the description's declaration counts are out of date. The human reviewers have three things to decide: the main source is an announced, unrefereed formal proof that could not be read here, its licence could not be read, and its wording and arrangement could not be compared.

## C01 — Identity 1.2 and `frobRieszSum_sub_main` are stated only under split ramification, which neither the route nor the identity uses

A reader of the Lean headline would take `hsplit`, `hId` and `hd` (`Suggested.lean`, lines 222–225) to be needed. A consumer whose host is outside the class would then reprove an identity that already holds there. One such host is `ℚ(√−3, √−7)` with `K = ℚ(√−7)`: `3` is inert and `7` ramified in `K`, so no prime `d` satisfies `SplitRamification d`. The route of 1.2 (README lines 789–798) uses only 0.2 (iii) and orthogonality. I redid it with `f` the indicator of `g`. The sums `Σ_{g∉Φ} conj χ(g)`, which are `|Φ|`, `−|Φ|` and `0` for `χ = 1`, `χ = χ_K` and the other characters, leave exactly the constants of `𝔐`. Both sides vanish when `y_g < 1`. No step uses ramification. The README says the same thing at line 783: the identity holds for every abelian CM host.

One option is to state 1.2 for every abelian CM host, drop `hsplit`, `hId` and `hd` from `frobRieszSum_sub_main`, and keep one clause saying that [FormalProof] states the split case. If the convention at line 109 is to stand, the theorem could instead say that its split-ramification hypothesis is not used.

## C02 — The NEW targets cite the formal proof as a whole, with no file or declaration

The Conventions (line 109) claim that the hypotheses, ranges and constants of these targets are those of the formal proof, and no reader can check that claim. The targets are 1.1, 1.7, 1.8 and 1.9, together with the [FormalProof] clauses of 0.4, 1.2 and 1.4. Each cites "[FormalProof]" with no file, declaration or commit. The References give a GitHub repository, while the announcement (Announcement line 53) names a 14-part archive on the author's page. For each such target, give the file and declaration of the formal proof, and name the commit or archive that was read.

## C03 — The parenthetical in 1.4 (a) reads as if every real primitive character of conductor dividing `8f_ψ` lay in `𝔛_n⟨ψ⟩`

The text at line 820 reads "`ρ` a real primitive character of conductor dividing `8f_ψ` (a real element of `𝔛_n⟨ψ⟩`)". Take `ψ = 1`, `n = 2` and `(q, d) = (3, 71)`. The real primitive characters of conductor dividing `8` are `1, χ₋₄, χ₈, χ₋₈`, so the literal reading gives 16 real characters of `G`. Only `1` and `χ₈ = (2/·)` lie in `𝔛_2`, which gives the eight of the Check at line 847: that is the intended reading. A clearer wording would be "`ρ` a real element of `𝔛_n⟨ψ⟩` (its conductor divides `8f_ψ`)".

## C04 — "Each condition has a use in Layer 0" (0.9, line 655) gives no use for `v₂(q + 1) ≤ a`, and Layer 0 has none

The list after that sentence covers every condition of a `(B, a)`-admissible pair except the bound on `v₂(q + 1)`. In Layer 0, 0.4 (vi) and 0.9 (vi) use only `v₂(d + 1)`. The bound on `q` is used by UniformWildKernelBounds §2.3, where it caps the number of places above `q` in the cyclotomic `ℤ₂`-tower. Would you name that use, or say that this condition is there for a consumer?

## C05 — The description's account of `Suggested.lean` no longer matches this head

The description says the file "states 4 headline theorems with `sorry` proofs and 26 definitions with real bodies", and that "its docstring says which other headlines are not statable and which carriers they lack". At this head the file has 3 theorems: `exists_noRelation`, `frobRieszSum_sub_main` and `cyclicBound_of_frobeniusInequality`. It has 25 definitions, counting the structure `ScaleData`. Its docstring says that the other targets are steps of the routes and not headlines, and it names no headline as not statable. Suggested text: "`Suggested.lean` states the three headline theorems (1.2, 1.9 and 0.8) with `sorry` proofs, and 25 definitions with real bodies (…); its docstring says that the other targets are steps of their routes and are not stated."

## N01 — Layer 1 has no 1.3

The subsections run 1.1, 1.2, 1.4, …, 1.9, so a reader looks for a missing 1.3. Other roadmaps of the family cite 1.4–1.9 by number, so a one-line note that the number is unused would serve better than renumbering.

## Questions for the author

- Does [FormalProof] state 1.2 for every host with split ramification, or only for the cyclic hosts of 0.4? I could not read the formal proof (see below). The answer decides whether the repair in C01 departs from the convention at line 109.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 API (ii), (iv) | `ℚ(ζ₈)`, `K = ℚ(i)`; `ℚ(√−3, √−7)` | `Φ = {σ₁, σ₅}`, `c = σ₇`, `σ₇σ₅ = σ₃`; `f = 2` even; `I₃`, `I₇` of order 2, neither contains `c` | holds | none |
| 0.2 (ii)–(iii), `frobCoset`, `inertia` | `ℚ(i)`, `p = 2`; `ℚ(i)`, `N = 12`, `p = 3` | `I₂ = G`, mean of `χ₋₄` is `0 = χ₋₄(2)`; `N′ = 4`: `I₃ = art{1,5} = {1}`, `Fr(3) = art{7,11} = {c}` | holds, independent of `N` | none |
| 0.3 Lemma (b), (c), (e) | `ℚ(√−3, √−7)`, `K = ℚ(√−3)`, `d = 3` | `(−3/7) = 1` split; `(−7/3) = −1`, so `D₃ = G ∋ c`; `Fr(dⁱ) ∖ Φ` one element | holds | none |
| 0.4 (i)–(vi) and Checks | `ψ = 1`, `n = 2`, `(19, 526679)`; `(3, 71)` at `n = 1`; `(3, 47)` at `n = 1, 2, 3` | 526679 prime, `d + 1 = 2³3²·5·7·11·19`; `(−d/13) = (−d/17) = 1`, `(−d/23) = −1`; `47 ≡ 15 (32)`, not `±1` | holds | none |
| 0.4 (iii), `c(ψ)` | `ψ` even of conductor 16, order 4; conductor 32, order 8; `(2/·)` | `\|A\| = 4` at `n = 0, 1`; `\|A\| = 8` for `n ≤ 3`; `\|A\| = 2` at `n = 0`; `n₀ = v₂(f_ψ) − 2` | holds | none |
| 0.5 (i)–(iv) | `ψ` of order 4 mod 5; `ψ = χ₋₄φ` | `𝒦 = {1, ψ, (·/5), ψ³}`; `4o = 16` characters trivial on `A₀`; `(ψ²)* = (·/5)` | holds | none |
| 0.6 (iii)–(v) and Checks | first host of 0.4; `p = 23, 29, 31, 43` | `(−d/p) = −1` for all four; `(p/19) = +1, −1, −1, +1` | holds | none |
| 0.7 (i)–(iii′) | Chebyshev at `2(δ\|A\|)^{1/2}`, union over `o` cosets; `ω₀ = 3/4` | failure probability `o·1/(4o) = 1/4`; precision `4(1+ω₀)ω₀^{−2}(δ\|A\|)^{−1/2}`; shares `4/(3o+1)`, `3/(3o+1)` | holds | none |
| 0.8 Theorem, `exists_noRelation` | `M = L = 2`; `M = 9`, `L = 2`; digit bound | `T = {0}`: `1 ≥ 2^{−C}`; `⌈9/8⌉ = 2 > 9/8`, so trimming is needed; `\|digit sum\| ≤ 4L(D−1) < 4LD` | holds | none |
| 0.8a (a), (b) | three points in a window of `L` | both products are less than `M/4` in absolute value and agree mod `M`, so they are equal; `\|s − s′\| < M/(4L) ≤ M/ord h` | holds | none |
| 0.8b (c), (d) | marks at 0, 2, 3; `φ = c` | 2-cluster fails at 3 (`e = 1`, mark 0 within 3); `N = 2`, both letters thick | holds | none |
| 0.9 (ii), (iv), (vi) | `(3,23)`, `(3,71)`, `(3,359)`, `(3,47)`, `(19,526679)` | `d ≥ 23`, attained; admissible for `B < 5, 5, 7`; `(B,4)`, `B < 5`; `B < 13`; seven primality tests pass | holds | none |
| 1.1 (iii) and Checks | `E = ℚ(i)`, `w ≡ w₀` | `ℛ − 𝔐 = w₀(G₁ − G_{χ₋₄})(a/w₀)` by expansion; `(L′/L)(1, χ₋₄) = 0.245610` | holds | none |
| 1.2, `frobRieszSum_sub_main` | orthogonality; `ℚ(√−3, √−7)`, `K = ℚ(√−7)` (no `d`) | `Σ_{g∉Φ} conj χ(g) = \|Φ\|, −\|Φ\|, 0`; constant `+a(L′/L)(1, χ_K)`; both sides `0` when `y_g < 1` | holds; split hypothesis unused | C01 |
| 1.4 (a) | `ψ = 1`, `n = 2`, `(3, 71)` | intended: 8 real characters (`ρ ∈ {1, χ₈}`); literal: 16 (`ρ ∈ {1, χ₋₄, χ₈, χ₋₈}`) | intended reading true | C03 |
| 1.5 | `χ` nontrivial on `A₀` | `Σ_{u∈A₀} χ(u) = 0`; `s ∈ A₀` absorbed by `u₀ ↦ u₀s⁻¹` | holds | none |
| 1.6 and Check | `ω₀ = 3/4`; `ω₀ = 1` | `ν̂(χ ≠ 1) = 1/(3o+1)`; `ν̂ = 0` | holds | none |
| 1.7 | thick and thin pairs, cost terms | `a/w ≥ (x−1)b/(2b′) ≥ X′/3` for `x ≥ 3`; pair weight `2f`; `(4o + o²ηx)𝔔_x ≤ 4x^{1/2+ε}` for large `x` | holds | none |
| 1.8 | the four bracket terms | `2x^{1/2+ε}`, `2`, `4x^{1/2+13ε/8}`, `2x^{1/2+9ε/8}`; `8 + 20x^{−ε/2} ≤ 9`, as `x^{ε/2} ≥ 26^{4/3} ≈ 77` | holds | none |
| 1.9, `cyclicBound_of_frobeniusInequality` | `ψ = 1`; `BoundHyp` against 1.8 (i)–(iv) | `𝔜 ≤ x^{1/2+(C+3)ε} + 3o·x^{1/2+ε} ≤ x^{1/2+(C+4)ε}` once `x^ε ≥ 1 + 4o`; `B₀`, `N_c` below their caps | holds; `x₁` does not involve `C` | none |
| 0.9 commentary | use of each condition | `v₂(q+1) ≤ a` is used nowhere in Layer 0; UniformWildKernelBounds §2.3 uses it | commentary inaccurate | C04 |

- Source locators checked against text: 3 (Announcement, lines 32–38, 53 and 125, read on the author's page); [FormalProof], Behrend, Ruzsa and the four books could not be read (below).
- Library declarations opened at the pinned Mathlib: 19, among them `NumberField/CMField.lean:575`, `Cyclotomic/Galois.lean:60, 133, 214`, `Cyclotomic/Ideal.lean:398`, `StrictConvexSpace.lean:161`, `Behrend.lean:163, 176, 246`, `IntegralDomain.lean:226`, `Variance.lean:398, 424`, `Bochner/Basic.lean:1169`, `ProbabilityMassFunction/Constructions.lean:299`, `JacobiSymbol.lean:311, 321, 423`, `Bertrand.lean:225`, `DirichletCharacter/Basic.lean:306`.
- Cross-roadmap citations resolved: on main, ClassFieldTheory Layers 7, 12, 13, 14 and W.5 (10 names), ArithmeticGaloisRepresentations §2.3, AnalyticNumberTheoryPartI §§0.30, 0.34, 0.34a, 2.18a, IntegralIwasawaTheory §0.2, ZerosOfLFunctions §6.3, ShimuraVarieties §5.1, Chebotarev Layers 4, 8.1, 11.1, Multiquadratic Layer 1; at open heads, QuasiRiemannHypothesis §5.4, RiemannHypothesisStatementsAndConsequences §§8.4a, 8.8a, 10.3, RieszSumsOverPrimesAndExceptionalZeros §§1.4h, 1.4i, QuadraticTwistSelectionOverPrimes §§2.7c, 2.7d, and ThetaChainsAndFrobeniusPrimeSums §§10.6, 10.7.
- Automatic checks: all passed at this head. Dependency check output: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` with `lake env lean`: three `declaration uses sorry` warnings (lines 103, 219, 352) and nothing else.
- Signatures: the elaborated types of all 28 declarations were compared with their README statements. No binder is lost, and I changed nothing.
- Numerical Checks recomputed: over 40 Legendre symbols, 7 primality tests, the factorisations of `d + 1` for six pairs, the residues of 47 and 71 modulo 8, 16 and 32, and `(L′/L)(1, χ₋₄)`.
- Ownership against open pull requests: checked through their heads. The closest open roadmaps cite this roadmap for the hosts, places, tops, thick sets and dyadic host fields and do not restate them.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, QuadraticTwistSelectionOverPrimes, RieszSumsOverPrimesAndExceptionalZeros, LocalGainOfThetaChains, ThetaChainsOnDefiniteUnitaryGroups, UniformWildKernelBounds (open), and QuadraticCharactersAndReduction, ClassFieldTheory, AnalyticNumberTheoryPartI (main). Nothing is owned twice. This roadmap owns the hosts, the Frobenius-restricted sums, the tops of 0.7 and the dyadic host fields, all cited by the open consumers. RiemannHypothesisStatementsAndConsequences owns the Riesz remainder, which is cited here.

Source independence: 6 passages compared with 1 source (Announcement), none shared; largest share [FormalProof], 11 of 15 in-text source citations; contents of [FormalProof] could not be read: not tested.

Research link: 1.9 is the analytic half of the announced proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, announcement of 20 November 2026; README summary, Announcement lines 32–38 on chains of theta lifts and line 125 on the normalised sum `G₁`); 0.8 extends Behrend 1946 and Ruzsa 1993; 1.4 rests on Landau–Page. Rests on the README and the Announcement.

## Not verifiable

- [FormalProof]: the sources service refused github.com, a host in no licence class. The announcement's archive on the author's page (`alpo.ge/lean.tar.gz.part01`–`14`) is not a text the service reads, and the README gives no file or declaration.
- Behrend 1946 (Proc. Nat. Acad. Sci. 32): the DOI landing page at pnas.org returned HTTP 403, and the PubMed Central host is in no licence class.
- Ruzsa 1993 (Acta Arith. 65): the IMPAN landing page is on a host in no licence class.
- Washington (ch. 3, 14), Neukirch, Davenport (ch. 19–20) and Chebyshev 1852: books not fetched, cited at chapter level for standard facts. I checked their statements through the routes instead.

## Source issues

- none

## For the human reviewers

- Scope: the NEW targets 1.1 and 1.7–1.9 rest only on [FormalProof]. It is a Lean formalisation announced on 20 November 2026 (Announcement, 4 pages), unrefereed and without a written exposition. No refereed source states 1.7–1.9.
- Licence: the statements in `Suggested.lean` may be adapted from [FormalProof] (README References: a GitHub repository; the announcement: `alpo.ge/lean.tar.gz.part01`–`14`). Neither could be read, so neither agreement of names and binders nor the licence was checked.
- Not tested: [FormalProof], the source with the largest share (11 of 15 in-text citations), could not be read. The wording and the arrangement were not compared with it.
