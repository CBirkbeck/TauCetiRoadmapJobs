# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #3027 at f89b300)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 148 lines changed since `7b5fe43`: the two new sections 3.1e and 3.1f, the extended origin labels of 2.2, 2.2a and 2.9a, the Labels paragraph, the route sentence of 3.1a, and `B = 4dM²` in 2.7 and in the supplier contract. I proved 3.1e (a), (b) and 3.1f (a), (b) by hand, checked them numerically on lattices in `ℂ`, and compared them with the formal proof's statements; all hold as written, and the three earlier small corrections are repaired. There is no finding. One small correction (three hypotheses of 3.1f that nothing uses) and one format note remain, neither blocking; nothing new is left for a human beyond the standing facts at the end.

## C01 — In 3.1f the hypotheses (S1), (S2) and the second half of (S3) are used neither by the statement nor by the route

A reader who follows the route of 3.1f looks for the step that needs (S1) and (S2) and finds none, and cannot tell whether a step is missing. The route proves (a) from the self-duality of `B`, the semicharacter laws and the invariance of `θ` alone, and (b) from (a) and the inclusion `A ∩ B ⊂ Λ`, which it draws from the first half of (S3) (line 2195: "`A ∩ B ⊂ Λ` by (S3), `Im H` being integral on `B`"). Both identities do hold without (S1) and (S2): on `V = ℂ`, `H(z, w) = z·w̄`, `α(x) = e^{πi·Re x·Im x}`, `A = 2ℤ + (i/2)ℤ`, `B = (1/2)ℤ + 2iℤ` and `Λ = {a + bi : a ≡ b (mod 2)}`, (S1) fails (`(Λ ∩ A) + (Λ ∩ B) = 2ℤ[i] ≠ Λ`) and (S2) fails (`i + 1 ∈ Λ`, `i ∉ Λ`), while with `θ = Σ_{x∈Λ} α(x)U_x1` the two sides of (b) agree numerically (`−0.29312 + 7.79755i` on each side at `z = 0.31 + 0.17i`). The three conditions are those of the formal proof's hypothesis `Formalism.L2.PairingIndexBounds.Mv.GoodLat`, which its statements carry. The smallest repair is a clause after the route, for example: "Of (S1)–(S3) the route uses only `A ∩ B ⊂ Λ`; the three conditions are the hypotheses under which [FormalProof] states (a) and (b)."

## N01 — Several `*Sources:*` lines still name topics rather than sources

"*Sources:* (construction)" (line 479), "(Minkowski; composition)" (2561), "(finite Fourier analysis)" (2633), "(stabiliser denominators)" (2824) and "(divisibility of `ℚ̄^×`)" (1928) read better with the source named, for example "*Sources:* Minkowski's bound (Serre, §1.1, Theorem 1)".

## Questions for the author

- The method label of 3.7 says that the identities it describes "are the statements of [FormalProof], at level `0`", but 3.7 still names no file or declaration of the formal proof, unlike the other sections (3.1e and 3.1f included). Which declarations are meant? Without a name I could not find them in the source.

## Previous findings

- The previous report had no finding (no R-numbered remark). Its small corrections and note, for the record:
- C01 (Labels list omits 3.5 and 3.3 (v)) — repaired: "2.3a, 2.4 (a), 2.5 (a), 3.1, 3.1a, 3.1b, 3.5 and 3.7, 3.3 (v), and 3.1d and 3.3 for the hosts other than those of FrobeniusRestrictedRieszSums §0.4".
- C02 (lemmas of 2.2, 2.2a, 2.9a without origin) — repaired: each origin label now gives the origin of its lemma, and the Labels paragraph says so; the cited sections of HermitianFormsAndLattices, ThetaKernelsForUnitaryDualPairs and ThetaLiftsForDefiniteUnitaryGroups exist and are the ones the routes use.
- C03 (description silent on the new suppliers) — repaired: the description now reads "ThetaChainsOnDefiniteUnitaryGroups gains ExplicitNumberFields §0.7, … and FourierDeligneTransform §0.2 as suppliers", and names 3.1e and 3.1f.
- N01 (topical `*Sources:*` lines) — not repaired: written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result |
|---|---|---|---|
| 3.1e, commutation rules | general `x, y` | `U_xU_y = e^{(π/2)(H(y,x) − H(x,y))}U_{x+y} = e^{−πi·Im H(x,y)}U_{x+y}`; so `U_xU_y = e^{−2πi·Im H(x,y)}U_yU_x` | as the route says |
| 3.1e (a) inverse | `V = ℂ`, `H = z·w̄`, `Λ₁ = ℤ[i]`, `Λ₂ = 2ℤ + (i/2)ℤ`, `α = e^{πi·Re·Im}`, `F = Σ_{Λ₁}α(x)U_x1` | `I_{Λ₂,Λ₁}I_{Λ₁,Λ₂}F / F = 1.0000000000000002` at `z = 0.31 + 0.17i`; indices `2 = 2` | holds |
| 3.1e (b) composition | same, `Λ₃ = (1/2)ℤ + 2iℤ`, `S₂ = {0, i/2}`, `S₃ = {0, 1/2, 1, 3/2}` | double sum `= 2` (pairs `(0,0)`, `(1,0)`); `ς = (2/(2·4))^{1/2}·2 = 1`; numerically `G/I_{Λ₁,Λ₃}F = 0.9999999999999997` | holds |
| 3.1e (b), degenerate | `Λ₁ = Λ₂ = Λ₃`; `Λ₃ = Λ₁ ≠ Λ₂` | `ς = α(z₀ + y₀)² = 1`; `ς = (n₂n₃)^{−1/2}·n₃ = 1`, agreeing with (a) | holds |
| 3.1e against [FormalProof] | `InterInv`, `TripleFormula`, `tripleMu`, `inter` | index ratio `relIdx Λ₁ Λ₃/(relIdx Λ₁ Λ₂·relIdx Λ₂ Λ₃)`, summand `α(z)α(y)α(z+y)e^{−πi·Im H(z,y)}`, six finiteness conditions: identical | agrees |
| 3.1e ↔ 3.1d (b) | the operator `I` | 3.1d has `α′(y)^{−1}`, 3.1e `α(y)`; equal since `α = ±1`; same factor `[𝔙′ : 𝔙″]^{−1/2}` | agrees |
| 3.1f (a) (sample) | `Λ = ℤ[i]`, `A = Λ₂`, `B = Λ₃`, `v = 1.7`, `Ψ` generic | both sides `0.90533 + 2.11634i` | holds |
| 3.1f (b) (sample) | same, `Ψ` periodic modulo `A ∩ B = 2ℤ[i]`, `S_{A/B} = {0, i/2, i, 3i/2}` | both sides `−0.14656 + 3.89877i`; with (S1), (S2) failing, `−0.29312 + 7.79755i` on both | holds; C01 |
| 3.1f against [FormalProof] | `hatS`, `xiS`, `xiL`, `xiInd`, `SplitHyp`, `GoodLat`, `XiExpandS`, `XiExpandL` | `(√v)^{−1}·v = √v` for `v > 0` and `0` for `v ≤ 0` (real square root), as `c_v`; four sets of representatives as in the README | agrees |
| 3.1f, the lattices `A`, `B` of the proof | `halfAO`, `halfBO` | exponent `−1` at the primes of `S`, `+1` at their conjugates for `A`; hypothesis "no prime of `S` has its conjugate in `S`" present | agrees |
| 3.1a route (sample), "parity of the ranks is not used" | `a = h(y, y) ∈ F ∩ √−d·𝔇_E^{−1}`, `ω = (1 + √−d)/2` | `Q_A = Tr_{F/ℚ}(a) = Tr_{E/ℚ}(aω) ∈ ℤ`, as `Tr_{K/ℚ}ω = 1`; rank one: `Q_A = N(x)` (Check (i)) | holds |
| 2.7 route and contract, `B = 4dM²` | supplier statement at this head; `d ≥ 100`, `M ≥ 3` | supplier has `B = 4|d_K|M² = 4dM²`; `log(4dM²) ≤ 2 log(dM²)` since `dM² ≥ 900 ≥ 4`; count loses `4^{−A_gap}` | holds |
| 2.2 origin label (sample) | route of (c), (e) | route cites HermitianFormsAndLattices §2.1, §2.3 for (c) and §3.1 for (e); the three headings exist | agrees |
| 2.9a origin label | route of (d) | §5.2 (d)(ii) condition `p > n[E:ℚ] + 1` against `g > 2fN_m + 1` here (`[E:ℚ] = 2f`, `n = N_m`) | agrees |
| 2.2a origin label | route of the lemma | ThetaKernelsForUnitaryDualPairs §§4.4a, 3.46a and ThetaLiftsForDefiniteUnitaryGroups §2.5 exist and are the route's inputs | agrees |

The rows for the statements the change does not touch stand as in the previous review, of `7b5fe43`.

- Source locators checked against the text: 5 files and 13 declaration names of [FormalProof] for 3.1e and 3.1f; every file exists at the first commit of the repository and every name is declared in its file with the statement the README gives; proofs of the four statements exist (`interInv`, `tripleFormula`, `twist_expand_series`, `twist_expand_lattice`).
- Cross-roadmap citations resolved at this head: 8 of 8 (HermitianFormsAndLattices §§2.1, 2.3, 3.1, 5.2 (d)(ii); ThetaKernelsForUnitaryDualPairs §§4.4a, 3.46a; ThetaLiftsForDefiniteUnitaryGroups §2.5; RieszSumsOverPrimesAndExceptionalZeros §2.9b (iv) (c′)).
- Duplication: no other roadmap on `main` or in this pull request states the composition of the isogeny operators or the expansion of 3.1f; AbelianSchemesAndArithmeticModuli and ThetaLiftsForDefiniteUnitaryGroups use semicharacters with the same law `α(x + y) = α(x)α(y)e^{πi·Im H(x, y)}`. No Tau Ceti declaration on semicharacters at the pin.
- Automatic checks: all passed. Dependency check: `depcheck: 124 roadmaps, 1416 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gave no message; the file declares nothing and is unchanged, so there is no signature to compare and no declaration to probe.
- Record: 0 headings removed; 3.1e and 3.1f are new ids after 3.1d; no layer or section is renumbered. No path outside the pull request's own roadmap folders changes against `main`.
- Overlap check: read ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, GluedTargetAndDivisionInequality, SeesawForThetaChains, LocalGainOfThetaChains, HodgeClassesForJacquetLanglands; nothing shared.
- Source independence: changed passages only; 4 passages compared with 1 source ([FormalProof], Lean statements without prose), none shared beyond formulas and the hypotheses; largest share [FormalProof], now 94 file-and-declaration locators; arrangement not compared, since the change adds, removes and reorders no layer.
- Research link: the chain lift, its source lattices and its top period are steps of Alpöge's formal proof of GRH for Dirichlet L-functions (2026; README summary and `Announcement`), built on Gross's algebraic modular forms (1999), theta correspondence for compact pairs (Kashiwara–Vergne 1978, Howe 1989) and Shimura's CM theta functions (1976). Rests on the README.

## Not verifiable

- The claim that [FormalProof] uses 3.1e (a), (b) "for the consistency 3.1d (o)": the uses of `tripleFormula` were located (five files), but the chain from them to the consistency statement was not traced.
- Gras and Munnier 1998, Green 1980, Shimura 1976, Mumford 1970, Howe 1989, Weil 1955, Gross 1999, Kashiwara–Vergne 1978, Bannai–Kobayashi 2010, Amir-Khosravi 2018: origins of sections the change does not touch; not read in this round.

## Source issues

- none

## For the human reviewers

- Neither decision recorded for this pull request concerns this folder: it removes, moves and renumbers no section, so none was applied.
- The source with the largest share of locators, [FormalProof], is a Lean formalisation in a public repository announced in 2026 (`Announcement`), not a refereed publication; 3.1e and 3.1f have no other source.
- [FormalProof] was read from the operator's copy of the public repository, which states no licence. The README cites file paths and declaration names only.
