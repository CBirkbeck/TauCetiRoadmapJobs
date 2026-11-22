# Review of CongruenceModulesOfThetaLifts (pull request #2921 at dac2eb3)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 83 lines changed since `509a46b`. The two additions of mathematics hold: the inertial type at the conjugate place `w̄_v` in 7.4 (7) is the inverse of the type at `w_v`, as conjugate self-duality gives and as [FormalProof] states it; and the new 7.8 (3) (a good twist stays good over a larger field of places and at Galois-conjugate places) follows from ThetaChainsOnDefiniteUnitaryGroups §2.6a and the clause "for every `m′` prime to `ℓ`" of 7.8 (2). All 35 new locators into [FormalProof] resolve, at the first commit of its repository, to the declarations named. There are five format notes, none blocking (two carried from the previous review); the scope and licence questions about [FormalProof] remain for the human reviewers.

## N01 — The route of 7.11 quotes the base-level bound of [FormalProof] without a locator

The route of 7.11 (lines 1444–1448) gives the bound `D_0·C·x^ε·(B₀ + N_c)` as the one [FormalProof] states, with no file or declaration. The statement is the definition `DIVinN_at` in `Formalism/SharpRestriction/GlobalTheoremInputs.lean` (namespace `Formalism.MainNotions`). Naming it would let a reader check the form, as 7.10c does for its own. (Unchanged since the two previous reviews.)

## N02 — The entry [FormalProof] of the References names the repository without the commit and directory the family index gives

The family index says that the files the roadmaps name are to be looked up at the first commit `40e56bab` of the repository, under its directory `src/`. The entry [FormalProof] of this README (line 2023) still gives only the repository address. Adding "at its first commit `40e56bab`, under `src/`", or a pointer to the family index, would keep the 125 locators unambiguous.

## N03 — The route of 7.8 (3) (ii) is two lines from what the item already cites

The route says "The route of (3) (ii) is not given here" (line 1064). The last two sentences of ThetaChainsOnDefiniteUnitaryGroups §2.6a (d), which the *Needs:* line already lists, give it: under the identification of the completions at `𝔭` and `g𝔭`, the character `ψ` defines at `g𝔭` what `ψ^a` defines at `𝔭`, with `a` prime to `ℓ`; the `T_s` and the polynomials of `𝒞` are unchanged because `g` fixes their data; and (a)–(c) hold for `ψ^a` by 7.8 (2). The sentence could be replaced by this.

## N04 — In 7.8 the symbol `𝔭′` has two meanings

The setting of 7.8 (line 982) uses `𝔭′` for an element of `{𝔭, c_𝕃(𝔭)}`, places of `𝕃`; the new (3) (i) (lines 1021–1022) and its route use `𝔭′` for a place of the larger field `𝕃′` above `𝔭`. A reader of "the lattices `T_s` at `𝔭′`" in the route has to decide which is meant. Another letter in the setting (or in (3)) would remove the doubt.

## N05 — "Nine terms" counts the terms of 7.7b (i), not the summands of the declaration cited

The locator paragraph of 7.7b (line 926) says the inequality at a point, "with its nine terms", is `GlobalLatticeIndexTheorem`. The right-hand side of that definition has eight summands: the column and row sums of 7.7b (i) are one sum there, over `Row ∪ Col`, of a function defined by cases. "with the nine terms of (i) (the sums over `Col` and `Row` written as one)" would match what a reader finds.

## Previous findings

- N01 (format note; the previous report had no finding) — not repaired: the route of 7.11 still reads "its bound reads `Σ_𝔭 ϱ(𝔭)e_𝔭η^{P_0}_j(𝔭) ≤ D_0·C·x^ε·(B₀ + N_c)`" with no file or declaration; written again as N01.
- N02 (format note) — not repaired: the entry [FormalProof] of the References still gives only the repository address; the family index now adds "under its directory `src/`"; written again as N02.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| 7.4 (7), the conjugate place `w̄_v` | `GL_1`: `Π^c ≅ Π^∨` gives `Π_{w̄} = Π_w^{−1}` through `E_{w̄} = F_v = E_w`; a tame character `θ` on inertia | README: inertia at `w̄_v` acts by the inverses of the roots of `f_v·(X − χ^{−1})^t`; mine: `θ ↦ θ^{−1}`, `N = 0` kept | holds |
| 7.4 (7) against [FormalProof] `admDZ` | squarefree label, neither `χ` nor `χ^{−1}` a root | source: type at `w_v` is `lab·(X − u)^t`, `u ∈ {χ, χ^{−1}}`; at the conjugate place the roots are the inverses, degree `r + t`, monodromy `0`; README the same | holds |
| 7.8 (3) (i), lengths | `O = ℤ_ℓ`, `O′ = ℤ_ℓ[ζ_ℓ]`, `e = ℓ − 1`, `M = O/ℓ` | `length_{O′}(M ⊗ O′) = ℓ − 1`, normalised `(ℓ − 1)/e = 1 = length_O(M)`; `v(ℓ) = 1` on both; bounds (a)–(c) unchanged | holds |
| 7.8 (3) (i), against §2.6a (b), (d) | `ℚ(i) ⊂ ℚ(ζ₈)` at `2` (its Check) | index `1` below, `2` above with `e = 2`; ratio `idx/e` equal; character at `𝔭′` is the one at `𝔭` composed with `O ⊂ O′` | holds |
| 7.8 (3) (ii) | `ℓ = 3`, `ψ` with a value `ζ₉`, `g : ζ₉ ↦ ζ₉²` | `g^{−1}∘ψ = ψ^5`, `5` prime to `3`; `v(ζ₉^5 − 1) = 1/6 = v(ζ₉ − 1)`; (a), (c) for `ψ^5` are 7.8 (2) with `m′ = 5` | holds under its hypothesis on `g` |
| 7.8 (3) (ii), negative control | `g` not fixing the data: `δ_ℓ` of order `15`, `g` moving `ζ₁₅` | `T_s` at `g𝔭` is formed with `g^{−1}∘δ_ℓ ≠ δ_ℓ`; the hypothesis "`g` fixes the data" excludes it | hypothesis needed and present |
| 7.8 (2), quantifiers, against `goodTwistExistsAllCoprimePowers` | — | source: `∀ ε′ > 0, ∀` basis, `∀ A, ∃ Q, k′, ψ′, ∀ a` coprime to `ℓ`, `GoodTw … (ψ′^a)`; README: the same order | holds |
| 7.8 (3) locator, `goodTwist_of_seed_character_powers` | — | source: packs at twisted places equal to powers `a`, `gcd(a, ℓ) = 1`, of a seed pack at the place below, conclusion good; README sentence the same | holds |
| 7.7b (i) against `GlobalLatticeIndexTheorem` | term by term | README nine terms; source eight summands (`Row ∪ Col` one sum), constants `t`, `(n_w + 2)c_B`, `4(r + t)(#Col + 1)` equal with `nV = r + t` | holds; N05 |
| 7.10b, constants | `conclusion41_of_pAdicHodge_alt` | source hypotheses `40 ≤ CT`, `8·CT ≤ C`; README `C_T ≥ 40`, `C ≥ 8C_T`; Route (iii) has `40(η′N² + N³) < g_i` | holds |
| 7.11, the record `Concl` | fields counted | source: 15 fields (`pos` … `small`), among them `mid` (rows) and `typ` (type primes); README "fifteen clauses" | holds |
| 7.1 (2) route, `SerLoc` | — | source: idempotent of label `f` nonzero on a form of parameter `σ′` implies `f` is the label of `σ′` at the place; README the contrapositive | holds |
| 7.16a (2), `winputs_frame` | — | source's first hypothesis after the fields is Chebotarev for primes of degree one; README says so | holds |

The rows for the untouched statements stand as in the previous review, of `509a46b`.

- Source locators checked against the text: 35 of the 35 that the change adds (file present at the first commit `40e56bab` under `src/`, byte-identical to the copy read, declaration present in the namespace named); statements read for 13 of them (the table).
- Seeded sample: of its fifteen targets, 7.1, 7.4, 7.9, 7.7b, 7.8, 7.10b, 7.11 and 7.16a fall in changed passages and were read there; 7.6, 7.7c, 7.7d, 7.8a, 7.10a, 7.10c and 7.15 are untouched and stand as previously read.
- Supplier statements read at their open heads: 1 (ThetaChainsOnDefiniteUnitaryGroups §2.6a, setting, (a)–(d), route and Checks; it exists there under that number). Consumer read: ThetaChainsAndFrobeniusPrimeSums 10.9, which cites §7.8 and chooses the twists equal on the fibres over the field of definition.
- Dependency check: `depcheck: 133 roadmaps, 1488 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all text checks pass; the two lines the full run prints are the roadmap not yet being in the merge order (it is placed after its last supplier) and the three files of the family index (the pull request's own). Elaboration of `Suggested.lean`: exit 0, no output (it declares nothing and did not change, so there is no signature to compare and nothing for the one-tactic probe).
- Changes outside the folder since the previous head: one clause in the family index, "under its directory `src/`"; true of the repository at `40e56bab`.
- Pull request text: the change adds no section, headline, declaration or supplier (ThetaChainsOnDefiniteUnitaryGroups was already one, and is in the description's list); no sentence of the title or description is contradicted.
- Duplication and layers: the diff adds, removes or reorders no layer or section; 7.8 (3) restates nothing of §2.6a (it applies it to the good twists, which this roadmap owns).

Overlap check: read GluedTargetAndDivisionInequality, SelmerLengthBoundsAndLocalLifting, ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, LengthBoundsInPadicFamilies, AutomorphicGaloisRepresentationsPartII, AutomorphicGaloisRepresentations, EndoscopicTransferAndUnitaryTraceComparison (scopes as the earlier reviews read them, not read again; ThetaChainsOnDefiniteUnitaryGroups §2.6a and ThetaChainsAndFrobeniusPrimeSums 10.9 read again); nothing shared: the enlargement of the field of places is owned by ThetaChainsOnDefiniteUnitaryGroups §2.6a and cited, the good twists by this roadmap.

Source independence: changed passages only: 14 passages compared with 2 texts (13 new sentences with the declarations of [FormalProof] they cite, 7.8 (3) and its route with ThetaChainsOnDefiniteUnitaryGroups §2.6a), none shared; largest share [FormalProof], 125 of 126 locators; the diff adds, removes or reorders no layer, so the arrangement was not compared again (previous result: independent).

Research link: The targets are the congruence-module, Ribet-type and weight-elimination inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), in the tradition of Ribet 1976, Hida 1981 and Bellaïche–Chenevier 2009, with Gan–Qiu–Takeda 2014 for 7.5a; README References and the sources read.

## Not verifiable

- The proofs inside [FormalProof] were not traced: for the new locators the files, the declarations and, for 13, the statements were read, not that each proof is complete.
- That `automorphy_of_hypotheses_alt_alt` is the instance "at the points of the chain" of the existence statement of 7.8 (2) was read from its conclusion `ExportF` only, not through the definitions behind it.
- The sentence of 7.11 that the term `(log x)²·N_c` "is added only in its last step" was not checked (as before).
- The items the earlier reviews could not verify (the published works cited without locators, Check (ii) of 7.6, the size inequalities quoted from ThetaChainsOnDefiniteUnitaryGroups) are untouched and stand as there.

## Source issues

- none

## For the human reviewers

- **Scope.** 125 of the README's 126 source locators point to [FormalProof], a Lean repository announced on 20 November 2026 (README References); it is not a refereed publication, and the consumers of the headline bounds are roadmaps of the same family.
- **Licence.** The family index states that [FormalProof] belongs to its author and was published without a licence. The roadmap cites file paths and declaration names only and reproduces no text of it.
