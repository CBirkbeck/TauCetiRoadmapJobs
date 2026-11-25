# Review of BesselPoincareSeriesAndGramBounds (pull request #3027 at c40f181)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 90 lines changed since `3f8c596`: two new sections, 5.16a (the number of classes of unimodular Hermitian planes) and 5.16b (the volume of the adelic quotient in the Hilbert–Schmidt normalisation), and the lines of the overview, Conventions, scope and supplier contracts that name them. I recomputed both statements and the route of 5.16b (the volume of `U(n)`, the comparison of the two archimedean measures, the telescoped mass ratios, the exponents) and found no false sentence: accepted, with three small corrections and one format note, none blocking. The standing and licence of the formal proof remain for the human reviewers, and its Lean source, the only source of the two new sections, was not read.

## C01 — The description does not say that the route of 5.16 now fixes the threshold `τ*` with exponent `11q_V`

Carried from the previous review. On `main` the route (b) of 5.16 reads `τ* = (nf·rd_E·g_ϕ·b)^{−Cq_V}`; this head has `(nf·rd_E·g_ϕ·b)^{−11q_V}` (line 834). The description names 5.16a and 5.16b and the sections whose statements change, and has no sentence on this constant. One sentence would do: "BesselPoincareSeriesAndGramBounds 5.16, route (b): the threshold `τ*` has the exponent `11q_V` of the formal proof."

## C02 — The `*Needs:*` line of 5.16a names no owner for the class-number bound and the ideal counts its method uses

The method of 5.16a (lines 715–720) rests on `h_E ≤ rd_E^f·(1 + f·log rd_E)^{2f}` and on the number of ideals of bounded norm, while the `*Needs:*` line (line 741) has only HermitianFormsAndLattices §5.1, and the supplier contract (line 2595) glosses §§5.1, 5.2 with "Minkowski's bound", which there is the bound for finite subgroups of `GL_N(ℤ)`, not the one for class numbers. An implementer is left to find the input. The pinned Mathlib has the first step, `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean`, line 78: every ideal class contains an integral ideal of norm at most the Minkowski bound); naming it on the `*Needs:*` line, with the count of ideals of norm at most `x` (at most `x·(1 + log x)^{2f−1}` in degree `2f`, which gives the stated bound with `x = rd_E^f`), would close it.

## C03 — In 5.16b the hypothesis `q² ≤ n` is the formal proof's; the route written here does not use it

The statement (line 760) assumes `q² ≤ n`, and the method says why the formal proof needs it (its induction on the signature must keep `p ≥ 2`). The route written in the section goes through HermitianFormsAndLattices §6.2 (c), which holds for every signature, and gives `vol = vol(U(n))^f·mass(𝒪_E^n)` with no condition on `q`; the numerical comparison needs only `n ≥ 7` (exponent of `X` at most `n²/2 + 24`, computed below). A clause in the statement, "the condition `q² ≤ n` is that of the formal proof; the route does not use it", would tell a reader which hypothesis is essential.

## N01 — Seven `*Sources:*` lines keep the words "method", "ingredients" and "frameworks" from the former tags

Carried from the previous review: lines 542, 941, 1224, 1332, 1378, 1578 and 1674 (for example "*Sources:* ingredients (Gelfand–Graev multiplicity one)"). Drop the leftover word, or fold the parenthesis into the Origin label.

## Questions for the author

- 5.22 (a): the list of this roadmap's own statements gives `wt_v(𝔣) ≤ ∏_j(1 + g^{−d_j})·wt_GG(𝔣)` and the form of [FormalProof] as `(1 + 1/g)^r·wt_GG(𝔣)`, while the Method label of FiniteReductiveGroups §5.8 credits the formal proof with `Σ_j c_jq^{−j} ≤ ∏_l(1 + q^{−d_l})`. Which of the two does the formal proof have? Both are true and nothing uses either; I did not open the formal proof's source.

## Previous findings

- The previous review, of `3f8c596`, raised no finding (no R-numbered remark). Its small correction, format note and question:
- C01 — not repaired: the description, read in full, has no sentence on the exponent `11q_V` of `τ*` in 5.16 (b); written again above.
- N01 — not repaired: line 941 still reads "*Sources:* ingredients (Gelfand–Graev multiplicity one)", and likewise the six other lines; written again above.
- The question on 5.22 (a) — open, written again above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.16a, the bound `4^f·rd_E^{5f}·(1 + f·log rd_E)^{5f}` | product of the method's five counts | `rd^f(1+f log rd)^f · (2^f h_E)² · rd^{2f}`, `h_E ≤ rd^f(1+f log rd)^{2f}`: exponents `1+2+2 = 5`, `1+4 = 5`, `4^f` | statement equals the method's product |
| 5.16a, the class-number bound of the method | ideals of norm `≤ √|d_E| = rd_E^f` in degree `2f` | at most `x(1 + log x)^{2f−1}` with `x = rd^f`: `≤ rd^f(1 + f log rd)^{2f}` | true; C02 on its owner |
| 5.16a, ideals `𝔫 = 𝔞𝒪_E`, `N𝔫 ≤ rd^{2f}` | `N_E(𝔞𝒪_E) = N_F(𝔞)²` | `N_F𝔞 ≤ rd^f`; count `≤ rd^f(1 + f log rd)^{f−1}` | within the stated `rd^f(1+f log rd)^f` |
| 5.16a on an example | `E = ℚ(ζ₁₂)`, `F = ℚ(√3)`: `d_E = 144 = d_F²`, so `E/F` unramified at finite places | `rd_E = √12`, bound `16·12⁵·3.485^{10} ≈ 1.05·10¹²`; `h_E = 1 ≤ 12·3.485⁴ ≈ 1770` | holds with room; `F = ℚ` gives no instance (`f ≥ 2`) |
| 5.16a, definitions | unimodular `Λ`; equivalence `γ^*J′γ = J`, `γΛ = Λ′` | `γ` is an isometry `(E², J) → (E², J′)` carrying `Λ` to `Λ′`; dual-lattice condition conjugate-linear in first variable as in Conventions | the intended object |
| 5.16b, `vol(U(n)) = 2^{n(n−1)/2}∏ 2π^l/(l−1)!` | `n = 1, 2`; fibration over `S^{2n−1}` | `n = 1`: `2π`; `n = 2`: `8π³ = (2π)³/1!`; ratio `2^{n−1}·2π^n/(n−1)! = (2π)^n/(n−1)!` (off-diagonal directions have length `√2`) | formula and ratio right; agrees with `S(i)·2^{i(i−1)/2}` of 5.16 (c) |
| 5.16b, `μ^{HS}_v = vol(U(n))·μ^c` | `𝔲(p, q) = H·𝔲(n)`, `H` unitary | `λ` is Hilbert–Schmidt Lebesgue measure on both; `μ^{HS}` density `1`, `μ^c` density `vol(U(n))^{−1}`; `|det Ad g| = 1`, so independent of the basis | right |
| 5.16b, telescoped product | HermitianFormsAndLattices §6.4 (b), unramified unimodular | `|d_F|^{(2M−1)/2}((M−1)!/(2π)^M)^f L(M, η^M) · ((2π)^M/(M−1)!)^f = rd_E^{f(M−½)}L(M, η^M)`, with `|d_F| = rd_E^f` from `d_E = d_F²` | matches the method's ratio and the route |
| 5.16b, bound `X^{n²f}` | exponents under `rd ≤ X`, `2f·rd ≤ X²`, `X ≥ 2` | `Σ_{M=3}^n (M−½) = n²/2 − 2`; plus `5` (5.16a), `10` (`(1+f log rd)^{5f} ≤ X^{10f}`), `10` (`(32π³)^f ≈ 992^f`), `1` (`L`-values): `n²/2 + 24 ≤ n²` for `n ≥ 7` | holds for `n ≥ 8`; C03 on `q² ≤ n` |
| 5.16b, `mass(𝒪_E²) ≤` classes of 5.16a | `Σ 1/|U(N)|` over one genus | each term `≤ 1`; the genus lies among all classes counted in 5.16a | right |
| 5.16b, method: `p ≥ 2` | `n = 8`, `q² ≤ 8` | `q ≤ 2`, `p ≥ 6` | right |
| 5.16 (b), `τ*` exponent (C01) | line 834 | `(nf·rd_E·g_ϕ·b)^{−11q_V}`, unchanged since the previous review | description silent |

The rows for untouched statements stand as in the previous review, of `3f8c596`.

- Source locators read at the text this round: 0; the two new sections cite only [FormalProof] (Lean declarations), which was not read.
- Seeded sample within the changed passages: 5.16a and 5.16b (recomputed above); the other sampled targets are untouched.
- Library declarations opened at the pin: 1 (`NumberField.exists_ideal_in_class_of_norm_le`, `Mathlib/NumberTheory/NumberField/ClassNumber.lean` line 78).
- Cross-roadmap citations resolved: 6, all in HermitianFormsAndLattices at this head (Conventions, compact-dual measure; §5.1; §6.2 (c); §6.3 (c); §6.4 (b); §§5.1, 5.2 in the contracts); each states what is cited.
- Record against the merge base: one layer at both ends; 0 headings removed, 2 added (5.16a, 5.16b, new ids); 0 Lean declarations removed, added or restated.
- The pull request's text: names 5.16a and 5.16b as results of the formal proof that no roadmap stated; C01 is the one omission. Changes outside the folder since `3f8c596`: four files, all in roadmap folders that are the pull request's own.
- Automatic checks: all passed in the worker's run. Dependency check, run again: `depcheck: 124 roadmaps, 1415 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages; the file is unchanged, declares nothing and names the three headlines (5.15a, 5.16, 5.20–5.21) as not statable, so there is no one-tactic probe to run. The new sections are not headlines.

Overlap check: read RowTowerAndRallisIdentities, SeesawForThetaChains, ThetaChainsAndFrobeniusPrimeSums and ThetaChainsOnDefiniteUnitaryGroups (main); nothing shared. A search of the roadmaps on main and at the open heads for a count of classes of unimodular Hermitian planes and for a volume of `U(V)(F)\U(V)(𝔸)` in the Hilbert–Schmidt normalisation found no other owner; HermitianFormsAndLattices §6.2 (c) owns the compact-dual identity, which 5.16b cites. No other open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 2 passages (5.16a, 5.16b) have [FormalProof] as their only source, which was not read, so 0 passages compared with 0 sources; largest share [FormalProof], Lean-file locators, about four fifths of all; contents not compared, since no layer is added, removed or reordered.

Research link: 5.13c–5.13d make explicit, for gapped discrete series, the archimedean uniqueness and existence of Bessel models (Jiang–Sun–Zhu 2010, Sun–Zhu 2012, Beuzart-Plessis 2020, Xue 2023, He 2017); 5.16 is a uniform limit multiplicity (DeGeorge–Wallach 1978, Savin 1989); the Gram bounds feed Alpöge's formal proof of GRH for Dirichlet L-functions (2026). README References and the sources read.

## Not verifiable

- [FormalProof], the Lean source: the declarations and files named in 5.16a and 5.16b (`RankTwoClasses`, `defClassNum`, `IsCMUnram`, `AbsoluteVolume`, `gaugeVol`, `IsGauge`, `AutInst`) and the constants of the two statements were not checked against it; the statements were checked by computation only.
- Jacquet and Ye (1999), Petersson (1930) and Muić (2009): as in the previous review, not opened (untouched by this change).

## Source issues

- none

## For the human reviewers

- Scope: 18 of the 31 sections are labelled particular to [FormalProof], and every Method label describes it. It is a Lean formalisation announced on 20 November 2026 (README References), not a refereed publication.
- Licence: the family index says the formal proof was published without a licence. The Method labels paraphrase its arguments section by section (README 5.13a–5.23), now including 5.16a and 5.16b.
- Not tested: [FormalProof], the source with the largest share of locators, is Lean code. The wording and arrangement checks were not run against it.
- Decisions of the human reviewers: neither is engaged by this folder; no section leaves it and none is renumbered.
