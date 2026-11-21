# Review of RowTowerAndRallisIdentities (pull request #2919 at 0b439f3)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** Accepted: I found no statement that is false, unsupported or missing a hypothesis, in the fifteen sampled sections or in the three headlines, and every computation and Check I redid holds. There are four small corrections and three format notes, none blocking; the main one is that 5.9 and headline (3) quote BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a with a restriction on the field that the supplier no longer has. The standing of the formal proof as the main source (unrefereed, no licence in the repository) is for the human reviewers.

## C01 — 5.9 and its contract quote §13.8a as a statement over the hosts of the chain; at its head §13.8a is stated for every CM extension unramified at the finite places

A reader is told that the restriction of 5.9, 5.12 and headline (3) to these hosts is forced by the supplier, which is no longer so. The Conventions call the hosts of the chain "the range of BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a and of [FormalProof]" (lines 71–73); the Route and *Needs* of 5.9 (lines 1514–1515, 1545–1546), the Scope paragraph (lines 1798–1799) and the contract entry (line 1906) say the same. At the head of that roadmap §13.8a begins "Let `E/F` be a CM extension unramified at every finite place", and after its displayed equality it says that [FormalProof] has the case of the cyclic hosts and that "for the other CM extensions the statement is this roadmap's". The phrase "host of the chain" no longer occurs in that README. The hypotheses 5.9 feeds it (odd `r`, lattice isometries at every finite place, integral parameters with gaps `100r⁴`, a nonempty jointly cuspidal family) are those of §13.8a as it now stands, so 5.9 remains true as stated.

Smallest change: in the four places, quote §13.8a with its own field hypothesis and say that the restriction to these hosts is the range of [FormalProof] alone; or drop the restriction from 5.9 and keep it only in the sentence on [FormalProof]. The same kind of slip, once: the contract entry for ThetaKernelsForUnitaryDualPairs §6.13c says it is "stated for `N = l·t`" (line 1874); at its head it is stated for all `r, t, N ≥ 0`, and `N = l·t` is the form of the formal proof.

## C02 — "A host of the chain (FrobeniusRestrictedRieszSums §0.4)" names a class that §0.4 does not define

The hypothesis of headline (3) and of 5.9 (lines 30–31, 72, 1499) cannot be read off the cited section. FrobeniusRestrictedRieszSums §0.4 is "Dyadic host fields and cyclic hosts"; the words "host of the chain" occur nowhere in that README, and the Conventions here speak of "the cyclic hosts (FrobeniusRestrictedRieszSums §0.4)" two sentences earlier (line 66). ThetaChainsOnDefiniteUnitaryGroups uses "the hosts of the chain" for hosts with `d ≡ 7 (mod 16)`, which is the admissible-pair condition of FrobeniusRestrictedRieszSums §0.9, not that of every cyclic host (`d ≡ 7 (mod 8)`), so two readings are possible.

Write "a cyclic host (FrobeniusRestrictedRieszSums §0.4)", or define "host of the chain" once in the Conventions with the section that fixes it. (With C01 applied by dropping the restriction, only the sentence on [FormalProof] needs the term.)

## C03 — Clause (o) of `Size_□` is given by a pointer to the formal proof's predicate, and the roadmap says nowhere what its twenty-three bounds are

An implementer of 5.8e or of headline (2) has to read a Lean record of another project to know what is assumed. Clause (o) (lines 1299–1306) is "the conjunction `SizesAt` of its twenty-three named bounds", and the next sentence says ThetaChainsOnDefiniteUnitaryGroups §2.1 "packages part of these bounds … without naming them all". I opened the declaration (`Formalism/SharpRestriction/ElevenLe.lean`, line 134): the description is accurate, twenty-three predicates and `11 ≤ splitBound`. Their names (`SizeKRel`, `SizeTT`, `SizeLa`, `SizeRho`, `SizeBot`, `SizeDe2`, `SizeLw`, `SizeEta`, `SizeNodes`, `SizeLstar`, `SizeDel`, `SizeBm`, `SizeXpp`, `SizePde`, `SizeWords`, …) mostly have no counterpart among the thirteen predicates of `Size(x, ε)`. Clauses (i)–(viii) and the last clause agree with `SizeRows` (`…/DivisorBase/LevelPlusSubgroup.lean`, line 20) term by term.

Smallest change: list the twenty-three names in clause (o), and for each say which predicate of ThetaChainsOnDefiniteUnitaryGroups §§2.1–2.8 it is, or that it has none. If the route of 5.8e uses only some of them, saying which would let the wider statement stand beside the formal one, as the Conventions provide.

## C04 — The main identity of 5.8 has no declaration of the formal proof, and the References do not list 5.8 among the targets that proof is the source of

A reader cannot tell whether `ϱ_ξ·∏c(i, j, ξ)·ℬ_a(ι_ξx) = κ_G·v(ξ, x, a)` (line 1458) is a statement of [FormalProof] or this roadmap's own. The References (lines 2048–2052) give [FormalProof] as the source of "5.1, 5.3–5.6, 5.8b–5.8e, 5.9 …, 5.10, the API of 5.10a, 5.11 and 5.12", which leaves out 5.2, 5.7, 5.8a and 5.8; yet each of these cites declarations of it (5.7 at lines 926–930, 5.8a at 1051 and 1066–1069, 5.8 at 1424–1426 and 1448–1451). In 5.8 only the conditions (L5) and (L7) carry declarations; the identity and the `𝕃`-structure, the content of headline (2), carry none, and the Route is an outline.

Name the declaration that states the identity (the condition on `𝕃` is `GlobalTheory.RowTest.NumbersIn` in the file already cited for (L5), which is where I would start), or mark the identity as this roadmap's own; and bring the list in the References into line with the targets.

## N01 — "The mathematics of this roadmap follows a complete formal proof" (line 157) reads as a plan that follows a source; "the results stated here are those of [FormalProof], except where a target says otherwise" says what is meant.

## N02 — The files of [FormalProof] are cited as `Formalism/…` and `Development/…`; in the linked repository they are under `src/`. One clause in the References would save a reader the search.

## N03 — Several credits are a name only (lines 2022, 2029, 2032, 2034, 2037, 2040: Rallis 1982, Kudla 1986 and 1994, Shimura, Deligne, Blasius, Gelfand–Graev, Godement, Paul, Petersson, Casselman, Wallach). They are credits, the routes stand on supplier sections; a title and a theorem number would let a reader find them.

## Questions for the author

- 5.7 leaves two choices open in the definition of the model lift: whether the forms on `U(V_j)` take values in `𝒲_j` or in its contragredient (lines 896–899), and which case of `ϑ_v` occurs (lines 957–959). Statement (ii) does not depend on either (`dim 𝒲_j`, `‖Δ_j‖²` and `|ϑ_v| = 1` are the same). Does the bilinear pairing "with the `U(V_j)`-factor `𝒲_j` of the Fock vector" not force the contragredient? I could not settle it without the Fock model of ThetaChainsOnDefiniteUnitaryGroups §2.2a worked out at the real places.
- 5.7 asks to prove that the span of the translates of `Δ_j` is irreducible, and the Route says this is not proved here and that [FormalProof] carries an irreducible representation in its records (`Formalism.IndefR.Links.CoefA`, `LinksDefs.lean`, line 240), that is, as data. Is the intended argument that `Δ_j`, a product of powers of leading minors, is a highest-weight vector for a Borel subgroup of `U(V_j)(F_τ)`? I did not check the minors of the negative block against the Fock model.

## Verified sound

| Statement | Instances tried | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 5.2 gap (G); Check | `min(p,q) ≤ m`; `j = 1` | `120·n·min^{3/2} ≤ 2N_m³`; `μ_1η̃^{−1}` on `Y_0` | needs `N_m ≥ 7.75m`, has `N_m ≥ 3m²`; `dim Y_{j−1} ≡ j`, `Y_0` odd | holds | — |
| 5.2 measures | scale `𝔪_j ↦ c𝔪_j`, `j < m`; `j = m` | both sides of (2) scale alike; class-sum product | `io_j`: `𝔪_j^{−1}`, product `𝔪_{j−1}^{−1}`; `Θ_j`: `𝔪_{j−1}^{−1}`, product `𝔪_j^{−1}`; `Σ_i\|F(e_i)\|² = ‖F‖²` | holds | — |
| 5.2 (3), `B^{(i)}` | step `a` odd and even | ratio of splitting characters, string at the source's | `a` odd: factor `η̃^{−1}`, string `μ_aη̃^{−1}`; `a` even: `η̃`, string `μ_a` | holds | — |
| 5.4 identity | level `(P_1, χ_{P_1})` | `c_I(j) = 𝔪_j·vol_f(K^{rt})`; `c_I(ξ)·idx = c_I(1)` | `\|P_1\|·𝔪_j·vol_f(K^{pr})`; `vol(K(ξ))·[K(1):K(ξ)] = vol(K(1))` | holds | — |
| 5.5 Lemma (a) | exponent of `H_∞` | `s_∞ = −n_i/2` | `n_{i+1}/2 + s − t/2 = n_i/2 + s ≥ 0` | holds | — |
| 5.5 twist places | general `(i, r, t, q)`; `(0, 1, 3, 2)` | product `∏_{n=(i+1)t+1}^{(i+1)t+r}(1−q^{−n})`; `15/16` | Gaussian binomial times `\|GL_r\|q^{−r²−r(i+1)t}`; `15·(1/16)`; with `loc_v`: `∏_{t+1}^{t+n_i}` | holds | — |
| 5.5 Hecke factors; integrability | `s = t/2`; `N_m > 3m²` | values at `1, …, t`; both thresholds `< 2N_m³` | arguments `s − t/2 + 1 + l`, `l < t`; `n³/4 + 1`, `8m^{3/2}N_m` | holds | — |
| 5.5 against §6.13c | `N = it`, `s = t/2` | inverse normalising factor `∏_{n=t+1}^{(i+1)t}(1 − N w^{−n})` | supplier: `∏_{i=1}^{N}(1 − q^{−(2s+i)})` gives `t+1 … t+it` | holds | — |
| 5.6 identity (headline 1) | split place; inert place; convergence | factors positive; absolutely convergent for `t > r` | `\|1 − βūN w^{−s}\|^{−2}`; `μ(ϖ_v) = 1`, `\|β\|N w^{−s} < 1`; exponent `(r−t)/2 − 1 < −1`; `t ≥ 7r + 4` | holds | — |
| 5.6 unprojected descent | formal statement | onto for every level, `i ≤ m` | `OntoAll`: every reachable composite, `k ≤ m`, surjective under `NodeGap` | agrees | — |
| 5.7 (ii), (ii′) | normalising factor; `f_H` | `∏_{n=t+1}^{r+t}L(n, η^n)`; factor `\|H\|` | arguments `t + i`, character `η^{t+i}`; `(\|H\|^{1/2})²` | holds | — |
| 5.8a signatures and ranks | `i` even, odd; `C⁺` | `⌊(m−i+1)/2⌋ + ⌊i/2⌋ = m/2`; complement rank `i − 1`; `C⁺` rank `m − 1` | `m/2` both parities; `r + is − (r+1) − i(s−1)`; `2n⁺ + 1`, `m/2` negatives | holds | — |
| 5.8a (p), (e) | `r′`, `#μ_E` | `p_□ ≠ p_δ, p′_δ`; `p_□ − 1 > #μ_E`; coset of size `≥ 2` | `r′ ≥ 3` (as `2 \| p_δ − 1`), `p_□ − 1 ≥ 3N_E > 2N_E ≥ #μ_E` | holds | — |
| 5.8b ranks and spacing | `t ≥ 3m+1`, `s = r+6` | `ε_□ > 2(p+q)+1`; left side `> 3h_c − 1` | `(t+s)/2 ≥ 2m+1`, `2(p+q)+1 = 2m−2j−1`; `c_{m−i} > v_0 + (i+3/2)h_c − ½`; ranks `< N_□` | holds | — |
| 5.8b against ThetaLifts §6.11 | hypotheses 1–4 | as quoted | same four at its head; unique `c ≠ 0` | agrees | — |
| 5.8d recursion | `q − p ∈ {0, 1}`; §6.12 | `p` values at `ε_□+q−p+1 … ε_□+q`, `q` inverse at `ε_□+1 … ε_□+q` | §6.12: `L^T(ε₀+1)` per step on `V′`, `L^T(ε₀)` on `V`; at most `ρ(ε_□+1)^{−1}` left | holds | — |
| 5.8d constants at `T` | valuations; `n = −2` at `v_□` | `\|v_𝔭\| ≤ c(\|n\|+1)v_𝔭(N v)`; factor `N v_□²` | `−cn·v + v(G)`, `0 ≤ v(G) ≤ c·v`; formula equals §6.12's `c_T(G)` | holds | — |
| 5.8d, (L6) | trivial zeros; critical range | values nonzero; critical at `1 ≤ s ≤ N_□+1` | weight `e_j + c_{m−i} > (3h_c−1)/2 > N_□ + 1 ≥ h_□ ≥ e_□` | holds | — |
| 5.8e count; depth | rank of `Hom`; `d_□` | `N(𝔪_□)^{Σ(r+is)(r+(i+1)s)}`; `d_□·log p_□ > C_F f²(r+1)⁶ log(…)` | `𝒪_E`-rank `(r+is)(r+(i+1)s)`; floor plus one | holds | — |
| 5.8e Lemma (the depth pays) | `σ = ½(2e^Q r²f g₀g₁ rd_E)^{−m}` | losses at most half of `log N(𝔪_□)` | `log(1/σ) = log 2 + m(log 2 + Q + log(…))`; `fmQ ≤ Cf²m(r+1)⁴L`, `Cm ≤ (r+1)²` | holds | — |
| 5.8e `Size_□`, statement | formal predicate | (o), (i)–(viii), `ccK = 𝒪_K`; `∀ε, C_F ≥ 6510, ∃x₀` | `SizeRows`: same conjuncts; `SizesAt`: 23 predicates; `FunctionalsSeparate`: same quantifiers, good rows | agrees | C03 |
| 5.8 (headline 2) | `𝔼_𝕃`; lattices; Check | `𝔼_𝕃 ⊗ ℂ = 𝔼^♮`; lattices span `𝔼_{1,𝕃}` | `c_tot(1)κ_G^{−1}ℬ_a(ι_ξx) = ϱ_ξ^{−1}(c_tot(1)/c_tot(ξ))v`; injective into `𝕃^A`; equal dimensions | holds; no locator | C04 |
| 5.9 | BaseChange §13.8a; formal `HostHyp` | hosts of the chain; gap `100r⁴` | supplier: any CM extension unramified at finite places; `gapR`: `100r⁴` | holds; quotation out of date | C01, C02 |
| 5.10 | `𝔪_j ↦ c𝔪_j`, `1 ≤ j < m` | `ιι^*`, `𝔫` by `c^{−2}`; `λ_j` fixed | `𝔫_j`, `𝔫_{j+1}` each by `c^{−1}`; products of `𝔼^♮`, `𝒰^♮` fixed | holds | — |
| 5.10a | reflex field | `K`; `k + j − 1 ≠ m − j` | stabiliser of `Φ` is `Gal(E/K)`; `k ≥ m + 3` | holds | — |
| 5.11 | `𝔫 > 0`; places of `𝕃` | from `ι_1ι_1^* ≥ 0`, `λ_j > 0` | `𝔫₀∏L_j > 0`, `L_j > 0`, `a_j > 0`; one of `σ, c∘σ` over `K` | holds | — |
| 5.12 (headline 3) | Gram matrix; rational points | `\|H\|·𝔫·∏λ_j·X_ξ`; bijection | `ι^*ιx = cx` on `ι^*(𝔼[𝔥])`; `⟨x,y⟩ = \|H\|X_ξ`; equal `𝕃`-dimensions | holds | C01 |
| 5.3 Checks | `r = 15`; `r = 7`; `r ≥ 8` | (4) fails at `a = 4`; no good tuple; a prime exists | sums `{1,3,4,…}`, `{2,4,…}`; `(3.5, 4]` empty; prime in `(n, 2n−2)`, `n ≥ 4` | holds | — |
| 5.2a | Schur orthogonality; `SL₂(ℝ)` weight 2 | `σ(e_σ)` projects on `w`; not integrable | `⟨u, σ(e_σ)v⟩ = ⟨u,w⟩⟨w,v⟩`; integrable iff weight `> 2` | holds | — |

- Source locators checked against the text: 7 in 4 classical sources (Rallis84Injectivity line 345, printed pp. 149–150; Rallis84Howe lines 429–435 and 520–528, pp. 345 and 351; BernsteinZelevinsky77 lines 329–338, p. 448; GanGrossPrasad12 lines 1528, 2229, 3017–3093, pp. 43, 63, 86–88): all correct.
- [FormalProof], in the linked repository: 21 files fetched, 25 cited declarations found at the cited files (among them `SizesAt`, `SizeRows`, `FunctionalsSeparate`, `OntoAll`, `ParBound`, `MultEq`, `HostHyp`, `StepLam`, `LevInt`, `QPeel`, `RealZetaQ`, `SquareTriple`, `IsSquareConst`, `SquareNonzero`, `JEvExists`, `phase_of_oneMap`, `fit_gap`, `exists_places_of_cls`, `size_le`, `CoefA`, `IsModels`, `IsIoW`, `RatZ`, `GalD`, `PhasesIn`); proofs not read.
- Supplier sections read at their heads: BaseChange §13.8a; ThetaLifts §§6.5, 6.11, 6.12; ThetaKernels §§3.46a, 5.6a, 6.13c; DiscreteSeriesCoefficients §2.4a (d); ThetaChains §§2.1, 2.3 (h), 2.3c, 2.9c; FrobeniusRestrictedRieszSums §§0.4, 0.9; MetaplecticAutomorphicForms §§5.7, 6.13, 6.14; GanGrossPrasadUnitaryGroups §2.6. Headings of 40 further cited sections resolved; none missing.
- Library declarations opened at the pin: `NumberField.IsCMField` (NumberTheory/NumberField/CMField.lean:70), `NumberField.AdeleRing` (AdeleRing.lean:56), `Matrix.unitaryGroup` (LinearAlgebra/UnitaryGroup.lean:105), `DirichletCharacter.LFunction` (LSeries/DirichletContinuation.lean:60), `HeckeRing` (NumberTheory/HeckeRing/Defs.lean). Tau Ceti has Petersson products of classical modular forms only; no carrier of a headline.
- Dependency check: `depcheck: 171 roadmaps, 2006 edges, 0 problem(s)`. Automatic checks: all passed. Changes outside the folder: none beyond the family index.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no message; the file declares nothing, so there is no `#check` comparison and no one-tactic probe.
- Headlines: (1) 5.5/5.6/5.10, (2) 5.8, (3) 5.12; none statable at the pins; the docstring names each with the carriers it lacks. The projector lemma 5.2a is owned by no other roadmap (searched on main and at the open heads).
- Pull request text: title and description agree with the head (a new roadmap; `Suggested.lean` declares nothing; the fourteen open suppliers listed are those the README cites).

Overlap check: read SeesawForThetaChains, ThetaLiftsForDefiniteUnitaryGroups, GluedTargetAndDivisionInequality, BesselPoincareSeriesAndGramBounds, ThetaKernelsForUnitaryDualPairs, ThetaChainsOnDefiniteUnitaryGroups (open) and AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups (main); the open ones name 5.1–5.12 as this roadmap's and it names theirs; nothing shared.

Source independence: 12 passages compared with 5 sources (7 at the classical locators, 5 statements of [FormalProof], which are Lean code without prose), none shared (longest common run 5 words, at Rallis84Howe line 431); largest share [FormalProof], 82 of 89 locators; it has no table of contents, and the 66 cited files lie in six directories in no order matching 5.1–5.12: independent. [Announcement] was not opened in this round.

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1984; Li 1992; Ichino 2004, per the README's References and Rallis84Injectivity), assembled into the row side of the chain of theta lifts of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README Conventions and References).

## Not verifiable

- [FormalProof] beyond the statements opened: no proof was read, and the constant identities of 5.5, 5.7 and 5.8d were not compared with it. The repository's file listing is too large to search, so I did not look for the declaration behind the identity of 5.8 (C04).
- The works credited by name or title only (N03), and Li 1992, Ichino 2004, Arthur–Clozel, Labesse, Milne, Harris, Katz: no locator, not opened.
- [Announcement]: not opened in this round.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets rest on [FormalProof] alone (README lines 2046–2052), a Lean formalisation by one author announced on 2026-11-20 with no paper; the linked repository's README describes it as a formalisation "that claims a proof".
- Scope: one statement I opened, `GlobalTheory.T.theta_lift_onto_all` (`src/Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/ThetaLiftOntoAllStatement.lean`), takes hypotheses named `GlobalTheory.Published.…` (classical theorems); I did not check where they are discharged.
- Licence: the repository linked for [FormalProof] shows no licence in its metadata. The roadmap restates mathematics and cites file and declaration names; it copies no code.
- Not tested: [FormalProof], the source with the largest share of locators, has no prose and no table of contents; wording was compared with five statements and the arrangement with its directory tree only.
