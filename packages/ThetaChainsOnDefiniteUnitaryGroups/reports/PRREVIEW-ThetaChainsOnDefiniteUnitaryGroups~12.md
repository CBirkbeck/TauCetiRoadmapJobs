# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 439 changed lines since `b8f3652`. I checked the new `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels of all 31 sections, the seven general sections they name, the two rewritten cross-roadmap descriptions (3.3, Downstream consumers) and the seeded sample. I checked the labels against the cited texts, against the formal proof's Lean source and kernel export, and by computation. Nothing is false and no finding remains. There are three small corrections and one format note, none blocking: the Conventions list of sections that go beyond the formal proof omits 3.5 and 3.3 (v); the lemmas of 2.2, 2.2a and 2.9a are labelled "definitions and conventions"; and the description does not name this roadmap's five new suppliers. The human reviewers have nothing to decide beyond the standing facts listed at the end.

## C01 — The Conventions' list of sections whose statements go beyond [FormalProof] omits 3.5 and 3.3 (v)

A reader who trusts the Labels paragraph would take 3.5 as a whole, and 3.3 on the hosts of FrobeniusRestrictedRieszSums §0.4, to be statements of the formal proof. The list at lines 156–158 names "2.3a, 2.4 (a), 2.5 (a), 3.1, 3.1a, 3.1b and 3.7, and 3.1d and 3.3 for the hosts other than those of FrobeniusRestrictedRieszSums §0.4". But 3.5's own method label (line 2368) says that the sum over the index paths of a system of data and the API are proved by the route given here. The formal proof's `ColumnChain.col` (`Formalism/LocalRingCardinality/DataKernels.lean`) has one kernel map per step and pair of classes. 3.3's origin label (line 2243) says (v) is this roadmap's own formulation for every host, and its `*Sources:*` line (2320) credits [FormalProof] with (i)–(iv) only. The smallest repair is to read "… 3.1b, 3.5 and 3.7, 3.3 (v), and 3.1d and 3.3 for the hosts other than …".

## C02 — 2.2, 2.2a and 2.9a state lemmas, but their only label is "definitions and conventions"

The labels of these sections give no origin and no method for their lemmas. 2.2's lemma (a)–(g) includes (c) and (e), which rest on the local classification and the Hasse principle (HermitianFormsAndLattices §§2.1, 2.3, 3.1). Its `*Sources:*` line (478) says that [FormalProof] proves "the spaces and the lemma". 2.2a's lemma (a) at the split places is credited to [FormalProof] at line 581. 2.9a's lemma is called elementary at line 1606. The description's rule ("Each section that states something to prove now carries `*Origin:*`, and `*Method of the formal proof:*` if the proof states it") is therefore not met for 2.2 and 2.2a. One repair would extend each origin label, for 2.2 for instance "definitions and conventions; the lemma is elementary, with (c) and (e) from the local classification and the Hasse principle", and add a method label to 2.2 and 2.2a. Another would have the Labels paragraph (line 156) say that the lemmas of these sections carry no method label.

## C03 — The description does not say that this roadmap gains five suppliers

A reader of the description cannot learn that this folder's supplier set changes. The head adds supplier contracts for ExplicitNumberFields §0.7, ArakelovGeometryAndAbelianHeights §1B.5, AnalyticNumberTheoryPartI §1.7b, RepresentationTheory/SchurWeyl §8.4 and FourierDeligneTransform §0.2. None of these roadmaps supplies this roadmap on `main`. The head also adds AutomorphicFormsOnReductiveGroups §7.5a, a section new in this pull request of an existing supplier. The description lists new suppliers for several roadmaps of the family but not for this one, and it never names FourierDeligneTransform or §1B.5. A sentence that would be right: "ThetaChainsOnDefiniteUnitaryGroups gains ExplicitNumberFields (§0.7), ArakelovGeometryAndAbelianHeights (§1B.5), AnalyticNumberTheoryPartI (§1.7b), RepresentationTheory/SchurWeyl (§8.4) and FourierDeligneTransform (§0.2) as suppliers, named in the `*Corollary of:*` lines of 2.6, 2.6a, 2.7, 3.4 and 3.7, and cites AutomorphicFormsOnReductiveGroups §7.5a, added here, in 3.10."

## N01 — Several `*Sources:*` lines name topics rather than sources, and five sections open the same paragraph with no label

Examples are "*Sources:* (construction)" (line 478), "(Minkowski; composition)" (2441), "(finite Fourier analysis)" (2513), "(stabiliser denominators)" (2704), "(divisibility of `ℚ̄^×`)" (1923), and "ingredients (…)" (1194, 1415). The citation paragraphs of 2.9b, 2.9c, 3.5, 3.8 and 3.9 (lines 1649, 1689, 2407, 2554, 2665) have no label at all. These might read better as, for example, "*Sources:* Minkowski's bound (Serre, §1.1, Theorem 1)", with the topic words moved into the origin label.

## Questions for the author

- 3.7's method label says the identities it describes "are the statements of [FormalProof], at level `0`", but the section names no declaration of the formal proof. Which declarations are they? I could not locate them in the formal proof's source.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result |
|---|---|---|---|
| Labels paragraph (Conventions, l. 154) | every label of 2.1–3.10 tabulated | Origin in 31 of 31 sections; Method absent exactly in 2.2, 2.2a, 2.9–2.9c; list omits 3.5 and 3.3 (v) | C01 |
| 2.1 Lemma (sample) | `k=6, m=2, f=2, r=7, t=109` | `n_j − N_j = 1, 0, −1 = m−1−j`; `n_2 = 225 = N_2 − 1` | holds |
| 2.2 Lemma (sample) | `k=6, m=2` | signature of `Y_0` is `(6, 1)`, rank `7 = n_0`; label covers the definitions only | C02 |
| 2.3 (g), method via `cσ_d` (sample) | `E=ℚ(√−7, i)`, `K=ℚ(√−7)` | `cσ_d: i↦−i`, fixes `√−7`, so lies in `Gal(E/K)`; `N_{E/K}(i) = i·(−i) = 1` | holds |
| 2.3b method (sample) | `b₁=100, h₀=10` | `e′₀=100, e₀=105, e′₁=110`; `w₁ = 105 = b₁ + (1−½)h₀`, as in 2.3a | holds |
| 2.3c Check (sample) | `e_i − e′_i = (t+3)/2` | (W1) needs `≥ t/2 + 1.5`: met; (W7) needs `≥ 2b/ℓ* + t/2 + 3`: fails | holds |
| 2.3a uniqueness of `s₁` (sample) | `μ_E = {±1}`; `μ_E = μ₄` | one `s₁ ∈ {0,1}` fixes the parity; `τ₁(i)` of order 4 gives one `s₁ mod 4` | holds |
| 2.6 ↔ ExplicitNumberFields §0.7 | `ℚ(ζ₈)/ℚ`, `n = 2` | `log rd = log 4 ≤ log 8` (route); `≤ ¾ log 2 + log 4` (Serre (6)) | holds |
| 2.6a ↔ Arakelov §1B.5, Bost A.2 (sample) | `ℚ(i) ⊂ ℚ(ζ₈)`, `L₂ = (1+i)` | index `1 → 2` (`e=2`); `ϱ`: `log2/2 → log2/4`; weighted both `log2/2`; Bost A.2 states the invariance | holds |
| 2.7 (b) ↔ AnalyticNumberTheoryPartI §1.7b | `M = 3` | `p₁ = 7`; next `p ≡ 1 (mod 21)` is `43`; two primes `≤ M^{A+A²}` | holds |
| 2.9, 2.9a, 2.9b (sample) | `r_S = 0` (`m = 2`); level prime `T(u)` | 2.9a: `χ₂ = χ_{P₀}|_{P₁}`; 2.9b: `L_𝔡` and `Λ ⊕ Λ*` differ by index `T(u)` at `w` | definitions; C02 for 2.9a |
| 3.1b method (sample) | kernel export scan | `chiMod1` (all conjugates of absolute value 1) not in export; only `|χ_D| = 1` in `ℂ` reached | label accurate |
| 3.2 origin (sample) | Gross 1999, Kashiwara–Vergne 1978 | both uncertified; Check (ii): old entries drop by 1, new ones `−w + N_{j−1}/2` | not verifiable at source |
| 3.4 ↔ SchurWeyl §8.4 (headline 2) | `n=2, m=3, k=2` | `dim Sym²(ℂ⁶) = 21 = 3·6 + 1·3`; `ℓ(ν_j) ≤ N_{j−1}` gives a nonzero summand | holds |
| 3.5 method (sample) | `DataKernels.lean` | `col = chainOpM wt Kmap m`, `wt = |stab|⁻¹`, one `Kmap` per class pair: matches | holds; C01 |
| 3.6 ↔ FiniteGroupInvariants §10.2 (headline 3) | `Γ = {±1}`, rank 2 | `minkowskiBound 2 = 24`, `2 | 24`; Check `K_j 1 = 1/2` | holds |
| 3.7 ↔ FourierDeligneTransform §0.2 (sample) | `W = 𝔽₃`, `t = δ₁`; `q=3, N=1` | `Σ|𝔉t|² = 3 = 3·1`; `Σ|FF*φ|² = 6 = 3·2`; `AB = cI ⇒ BA = cI` (finite dimension) | holds |
| 3.8 (headline 4, sample) | `T = 3`; `trivStabU` | rank `1 = 2·(1/2)`, slope `−log 2`; triviality from two distinct type primes, as labelled | holds |
| 3.10 ↔ AutomorphicForms §7.5a (headline 3) | `GL₁`, `J = Ẑ^×` | `(1,1) = 1/2`: unit for odd `ℓ`, not for `ℓ = 2`; `p ∤ D_Γ` gives bound `v ≥ 0` | holds |
| 2.4 (a) (headline 1) ↔ BLGGT A.2.4 | `ζ = −1`, `x = √−d` | `Σ w_j` odd violates `(U_j)`; BLGGT prescribes `φ` on `F^×`, `(𝔸^∞_{F⁺})^×`, `O_{F,S}^×` | holds |
| 3.3 description of ThetaKernels §4.4a (5) | head of that roadmap | (5) is continuity of the theta function of `ω(g, h)φ`, as 3.3 now says | holds |
| Downstream: Seesaw §6.14 (c) | head of that roadmap | `P̃_ξ = ζ_ℂ(u, ξ)·B_u(φ)(ι_ξΥ)`, `ζ_ℂ` a root of unity | holds |
| 3.1c method identity | quasi-periods of `ℂ/Λ` | `Σ_{P≠0} ℘(P) = (α² − αᾱ)s₂`, equivalent to the route's `α(α−ᾱ)(s₂ + b₂/12) = Σx(P) + (α²−1)b₂/12` | holds |

- Source locators checked against the text: Serre 1981 Propositions 4, 4′ and 5 (`serre1981` lines 225–251); Bost Proposition A.2 (`bost95` lines 813–819); BLGGT Lemma A.2.4 (arXiv v4, line 4110); Serre, *Bounds*, §1.1 Theorem 1 (`serre-bounds` line 85); Bannai–Kobayashi and Amir-Khosravi, abstracts (lines 9–17, 8–17).
- Formal proof (operator-held copy of the public repository) opened: `ColumnChain`, `wt`, `col` (`Formalism/LocalRingCardinality/DataKernels.lean` 14–77); `card_stab_zero`; `trivStabU`, `stabZero_rec` (`GramTotallyDefinite.lean`); `adm26`, `lemma_five_one_of_theorem_two`; `MuCond`; `chiMod1` (`GL3Theta.lean` 430). The kernel export was scanned for 12 name components.
- Cross-roadmap citations resolved at the head: the seven `*Corollary of:*` targets, ThetaKernelsForUnitaryDualPairs §4.4a, SeesawForThetaChains §6.14, SlopesOfHermitianVectorBundles §3.5, RieszSumsOverPrimesAndExceptionalZeros §1.7b and GanGrossPrasadUnitaryGroups §4.1 (on `main`). All 12 exist and say what is cited.
- Automatic checks: all passed. Dependency check rerun: `depcheck: 129 roadmaps, 1449 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gave no message (it declares nothing). The pull request leaves the file unchanged.
- Record: 0 headings removed and 5 added (supplier subsections); Layers 2 and 3 and all 31 sections keep their ids and statements; the deleted lines are the former tags, rewritten in place.
- Overlap check: read ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, GluedTargetAndDivisionInequality, SeesawForThetaChains, LocalGainOfThetaChains and HodgeClassesForJacquetLanglands; nothing is shared. The family roadmaps consume this roadmap's chain data, chain lift, source lattices and top period, which this roadmap owns and they cite. The seven general theorems of the new `*Corollary of:*` lines are owned by the roadmaps named there and only cited here.
- Source independence: changed passages only. I compared 14 passages with 7 sources (Serre 1981, Bost 1996, BLGGT, Serre *Bounds*, Bannai–Kobayashi, Amir-Khosravi, the formal proof's source); none shares wording beyond formulas and standard names. The largest share is [FormalProof], about 82 of 140 locators. The arrangement was not compared, since no layer is added, removed or reordered.
- Research link: the chain lift, its source lattices and its top period are the steps of Alpöge's formal proof of GRH for Dirichlet L-functions (2026; README summary, [Announcement]). They are stated with Gross's algebraic modular forms (1999), the theta correspondence for compact pairs (Kashiwara–Vergne 1978, Howe 1989) and Shimura's CM theta functions (1976). This rests on the README.

## Not verifiable

- Gras and Munnier 1998, Théorème 1.1 and Remarque 5.2 (origin of 2.5): the sources service found no legal copy.
- Green 1980 (LNM 830, origin of 3.1); Shimura 1976, Mumford 1970, Howe 1989 and Weil 1955 (origins of 2.4, 3.1a, 3.1d, 3.3): paywalled or print, not fetched.
- Gross 1999 and Kashiwara–Vergne 1978 (origins of 3.1, 3.2, 3.3, 3.4, 3.8, 3.10): settled as uncertified.
- BLGGT: only the arXiv v4 numbering was checked, not the published one.
- Method labels of 2.1, 2.4–2.8, 3.1, 3.1a, 3.1c, 3.1d, 3.2–3.4, 3.6, 3.7, 3.9 and 3.10: checked for consistency with their routes and by computation, not traced declaration by declaration in the formal proof.

## Source issues

- none

## For the human reviewers

- Neither decision recorded for this pull request concerns this folder: it removes, moves and renumbers no section, so no decision was applied here.
- The source with the largest share of locators is [FormalProof], a Lean formalisation in a public repository announced in 2026 (`Announcement`), not a refereed publication. The new labels classify each section as published, adapted, or particular to that proof.
- [FormalProof] was read from an operator-held copy of the public repository, and its licence was not checked. The README cites file paths and declaration names only.
