# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 439 changed lines since `b8f3652`. I checked the new `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels, the seven general sections the `*Corollary of:*` lines name as they stand at this head, the two rewritten cross-roadmap descriptions (3.3 and Downstream consumers), the five new supplier contracts and the seeded sample, against the cited texts, the formal proof's Lean source and by computation. Nothing stated is false and there is no finding. Three small corrections and one format note remain, none blocking: the Conventions' list of sections that go beyond the formal proof omits 3.5 and 3.3 (v); the lemmas of 2.2, 2.2a and 2.9a have no origin or method of their own; the description does not name this roadmap's new suppliers. Nothing new is left for a human beyond the standing facts at the end.

## C01 — The Conventions' list of sections whose statements go beyond [FormalProof] omits 3.5 and 3.3 (v)

A reader who relies on the Labels paragraph takes all of 3.5, and 3.3 (v) on the hosts of FrobeniusRestrictedRieszSums §0.4, for statements of the formal proof. The list (lines 156–158) reads "2.3a, 2.4 (a), 2.5 (a), 3.1, 3.1a, 3.1b and 3.7, and 3.1d and 3.3 for the hosts other than those of FrobeniusRestrictedRieszSums §0.4". But the method label of 3.5 says that the formal proof has the chain lift "for one kernel map per step and pair of classes" and that "the sum over the index paths of a system of data and the API are by the route given here"; and the origin label of 3.3 says that (v) "is this roadmap's own formulation" without restriction on the host, its `*Sources:*` line crediting [FormalProof] with (i)–(iv) only. The smallest repair: "… 3.1b, 3.5 and 3.7, 3.3 (v), and 3.1d and 3.3 for the hosts other than …".

## C02 — 2.2, 2.2a and 2.9a state lemmas, but their label covers only "definitions and conventions"

For these three sections a reader cannot tell where the lemma comes from or whether the formal proof has it. 2.2 is headed "Construction and lemma" and its lemma (a)–(g) uses the local classification and the Hasse principle; its `*Sources:*` line says [FormalProof] has "the spaces and the lemma". 2.2a is headed "Definition (the normal form of a step) and lemma". 2.9a is headed "Definitions and lemma (the type primes)" and its closing line calls the lemma elementary. Each origin label (lines 422, 490, 1479) speaks of definitions only, and the Labels paragraph says "The definitions of 2.2, 2.2a and 2.9–2.9c carry the first label only". One repair would extend the origin labels ("definitions and conventions; the lemma is elementary, with (c) and (e) from the local classification and the Hasse principle" for 2.2, and likewise for the other two); another would have the Labels paragraph say that the lemmas of these sections are elementary and carry no method label.

## C03 — The description does not say that this roadmap gains five suppliers

The description names the suppliers gained by several roadmaps of the family (SingularHermitianMetricsAndL2Methods, SlopesOfHermitianVectorBundles, LocalFactorsOfTwistsAndTypes) but not by this one, whose supplier set changes: the head adds contracts for ExplicitNumberFields §0.7, ArakelovGeometryAndAbelianHeights §1B.5, AnalyticNumberTheoryPartI §1.7b, RepresentationTheory/SchurWeyl §8.4 and FourierDeligneTransform §0.2, none of which supplies this roadmap on `main`, and a contract for AutomorphicFormsOnReductiveGroups §7.5a, a section this pull request adds to an existing supplier. A sentence that would be right: "ThetaChainsOnDefiniteUnitaryGroups gains ExplicitNumberFields (§0.7), ArakelovGeometryAndAbelianHeights (§1B.5), AnalyticNumberTheoryPartI (§1.7b), RepresentationTheory/SchurWeyl (§8.4) and FourierDeligneTransform (§0.2) as suppliers, named in the `*Corollary of:*` lines of 2.6, 2.6a, 2.7, 3.4 and 3.7, and cites AutomorphicFormsOnReductiveGroups §7.5a in 3.10."

## N01 — Several `*Sources:*` lines name topics rather than sources

"*Sources:* (construction)" (line 478), "(Minkowski; composition)" (2441), "(finite Fourier analysis)" (2513), "(stabiliser denominators)" (2704), "(divisibility of `ℚ̄^×`)" (1923) and "ingredients (…)" (1194, 1415) are what remained when the former status words were replaced; the citation paragraphs of 2.9b, 2.9c, 3.5, 3.8 and 3.9 now open with no label at all. They would read better with the source named, for example "*Sources:* Minkowski's bound (Serre, §1.1, Theorem 1)".

## Questions for the author

- The method label of 3.7 says that the identities it describes "are the statements of [FormalProof], at level `0`", but 3.7 names no file or declaration of the formal proof, unlike the other sections. Which declarations are meant? Without a name I could not find them in the source.

## Previous findings

- The earlier review of this folder had no finding. Its three small corrections and its format note concern text this head leaves as it was (the folder has not changed since), so they stand above as C01–C03 and N01: not repaired, and not blocking.

## Verified sound

| Statement | Instances tried | Values computed (README side / other side) | Result |
|---|---|---|---|
| Labels paragraph (Conventions) | labels of all 31 sections | Origin in 31; Method absent exactly in 2.2, 2.2a, 2.9–2.9c; list omits 3.5 and 3.3 (v) | C01 |
| 2.1, 2.9, 2.9b, 3.1d, 3.2 (sample) | formal-proof locators of each | every cited file exists and contains the cited declaration name (56 files, 81 names) | locators resolve |
| 2.2, 2.2a, 2.9a (sample) | headings against labels | each heading says "and lemma"; each origin label says definitions only | C02 |
| 2.3 (g), method label | `ζ = i` in `ℚ(√−7, i)`; `ζ = −1` | `cσ_d` fixes `√−7`, sends `i ↦ −i`: `i·(−i) = 1`; `(−1)^f = 1` as `f` is even | holds |
| 2.3a method, uniqueness of `s₁` | `μ_E = {±1}`, `μ₄` | shift by `s` multiplies by `τ₁(ζ_E)^s`, a primitive root: one `s` mod `|μ_E|` | holds |
| 2.4 origin (sample) | BLGGT Lemma A.2.4 | lemma prescribes `φ` on `F^×`, on `(𝔸^∞_{F⁺})^×` and on `O_{F,S}^×`, as the label says | holds |
| 2.4 method | norm-one units of a CM field | `uū = 1` gives all absolute values `1`, so `u` is a root of unity (Kronecker) | holds |
| 2.5 method | `E = ℚ(i)`, `ℓ^M = 3`, `N𝔓 = 13` | `(𝒪/𝔓)^×` has order `12`, divisible by `3`: the cubic residue symbol is onto `μ₃` on local units | holds |
| 2.6 ↔ ExplicitNumberFields §0.7 | `ℚ(ζ₈)/ℚ`, `n = 2` | `log rd = log 4`; route bound `log(2·4) = log 8`; §0.7 gives `¾ log 2 + log 4 ≤ log 8` | holds |
| 2.6a ↔ ArakelovGeometry §1B.5, Bost A.2 | statement at locator | Bost A.2: canonical filtration of the pull-back is the pull-back; §1B.5 states normalised slopes unchanged | holds |
| 2.7 (b) ↔ AnalyticNumberTheoryPartI §1.7b (sample) | `M = 3`, then `21` | least primes `≡ 1`: `7 ≤ 3²`, then `43 = 2·21 + 1` | holds |
| 2.8 method (sample) | `fk = 2`; `f = 2`, `T^k = 4` | `(3/2)² = 2.25 ≤ e`; `(3/4)² = 0.5625 ≥ 1 − 2/4 = 1/2` | holds |
| 3.1a method (sample) | trace form on `𝔞₀` | `𝔞₀𝔞̄₀𝔇_{E/K} = (d)/(√−d)² = 𝒪_E`, so `a·b̄·𝒪_E ⊂ 𝔇_{E/K}^{−1}` and its trace lies in `𝒪_K` | holds |
| 3.1b method (sample) | `z·z̄ = 1` | `z = b/b̄` (Hilbert 90); norm-one units `u`: `∏_τ τ(u) = N_{E/K}(u) = 1` by 2.3 (g) | holds |
| 3.1c method identity | quasi-periods `η(ω) = s₂ω + κω̄` | `−N(α)η(ω) = −αη(αω) + cω` gives `c = (α² − N(α))s₂`, `c = Σ_{P≠0}℘(P)` | holds |
| 3.4 ↔ SchurWeyl §8.4 (sample, headline 2) | `n = 2, m = 3, k = 2` | `dim Sym²(ℂ⁶) = 21 = 3·6 + 1·3` | holds |
| 3.6 ↔ FiniteGroupInvariants §10.2 (headline 3) | ranks `2, 3, 4`; `{±1}` | `24 | 48 | 5760`: the bound is monotone, so rank `2fN_j` divides rank `2fN_m`; `2 | 2` | holds |
| 3.7 ↔ FourierDeligneTransform §0.2 (sample) | `W = 𝔽₃`, `t = δ₁` | `Σ|𝔉t|² = 3 = |W|·Σ|t|²`; `D∘U = c` with `c ≠ 0` on a finite-dimensional space gives `U∘D = c` | holds |
| 3.8 method (sample, headline 4) | formal proof, `trivStabU` | hypothesis `gp 0 ≠ gp 1`: order a power of two distinct primes, so `1`, as the label says | holds |
| 3.10 ↔ AutomorphicForms §7.5a (sample, headline 3) | `GL₁`, `J = Ẑ^×`; `p ∤ D_Γ` | `(1,1) = 1/2`, a unit for odd `ℓ` only; bound `−e·v_p(D_Γ) = 0` | holds |
| 2.4 (a) (headline 1) | Suggested.lean docstring | not statable at the pins (no CM types); file declares nothing; unchanged by the pull request | unchanged |
| 3.3, description of ThetaKernels §4.4a | head of that roadmap | its property (5) is continuity of the theta function of `ω(g, h)φ`, as 3.3 now says | holds |
| Downstream: Seesaw §6.14 (c) | head of that roadmap | constant written `ζ_ℂ(u, ξ)`, a root of unity, in (c) | holds |

- Source locators checked against the text: Serre 1981, Propositions 4′ and 5 (`Serre1981` lines 233–249); Bost, Proposition A.2 (`Bost1996` lines 813–819); BLGGT, Lemma A.2.4 (`BLGGT2014` line 4110, arXiv v4); Serre, *Bounds*, §1.1, Theorem 1 (`SerreBounds` line 85).
- Formal proof (the operator's copy of the public repository): 56 cited files exist, and each of the 81 cited declaration names occurs in its file; `trivStabU` opened (`Formalism/LocalToGlobal/GroupLattices/TrivialTransfer/GramTotallyDefinite.lean`, line 59).
- Cross-roadmap citations resolved at this head: the seven `*Corollary of:*` targets, ThetaKernelsForUnitaryDualPairs §4.4a, SeesawForThetaChains §6.14, SlopesOfHermitianVectorBundles §3.5, RieszSumsOverPrimesAndExceptionalZeros §2.9b (iv) (c′), ReductiveGroups 10B and GanGrossPrasadUnitaryGroups §4.1 (on `main`): 13 of 13 exist and say what is cited.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1449 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gave no message; the file declares nothing and the pull request leaves it unchanged, so there is no signature to compare and no declaration to probe.
- Record: 0 headings removed, 5 added (supplier subsections); Layers 2 and 3 and all 31 sections keep their ids and statements; the 44 deleted lines are the former status words, rewritten in place. No file outside the pull request's own folders changes.
- Overlap check: read ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, GluedTargetAndDivisionInequality, SeesawForThetaChains, LocalGainOfThetaChains, HodgeClassesForJacquetLanglands; nothing shared. The family roadmaps cite this roadmap's chain data, chain lift, source lattices and top period, which it owns; the seven general theorems of the `*Corollary of:*` lines are owned by the roadmaps named there and only cited here.
- Source independence: changed passages only; 5 passages compared with 5 sources (Serre 1981, Bost 1996, BLGGT, Serre *Bounds*, the formal proof's source), none shared beyond formulas and standard names; largest share [FormalProof], 81 file-and-declaration locators against one or two for each published text; arrangement not compared, since the change adds, removes and reorders no layer.
- Research link: the chain lift, its source lattices and its top period are steps of Alpöge's formal proof of GRH for Dirichlet L-functions (2026; README summary and `Announcement`), built on Gross's algebraic modular forms (1999), theta correspondence for compact pairs (Kashiwara–Vergne 1978, Howe 1989) and Shimura's CM theta functions (1976). Rests on the README.

## Not verifiable

- Gras and Munnier 1998 (origin of 2.5); Green 1980, Shimura 1976, Mumford 1970, Howe 1989, Weil 1955 (origins of 2.4, 3.1, 3.1a, 3.1d, 3.3): paywalled or print; not read.
- Gross 1999 and Kashiwara–Vergne 1978 (origins of 3.1, 3.2, 3.3, 3.4, 3.8, 3.10): recorded as uncertified; cited by locator only.
- Bannai–Kobayashi 2010 and Amir-Khosravi 2018 (origins of 3.1c, 3.1a): not opened in this round.
- BLGGT: only the arXiv v4 numbering was read, not the published one.
- The method labels other than those in the table: checked for consistency with the routes, not traced declaration by declaration in the formal proof.

## Source issues

- none

## For the human reviewers

- Neither decision recorded for this pull request concerns this folder: it removes, moves and renumbers no section, so none was applied.
- The source with the largest share of locators, [FormalProof], is a Lean formalisation in a public repository announced in 2026 (`Announcement`), not a refereed publication.
- [FormalProof] was read from the operator's copy of the public repository; its licence was not checked. The README cites file paths and declaration names only.
