# Review of AlgebraicModularFormsAndSerreWeights (pull request #928 at 9d42cd1)

**Verdict:** needs changes

The mathematics, the suppliers and the Lean headlines check out (details under *Verified sound*). What blocks acceptance is the push gate, which still fails on two style rules the previous review raised and this head did not repair: the 84 HTML anchors (`residue=84`) and the `R15` heading identifiers (`target-ids=4`). No P1 or P2 finding was found.

**Previous findings, finding by finding.** R01 (upward ClassFieldTheory edge): repaired; `README.md:83` and the two `*Needs:*` lines now cite ArithmeticGaloisRepresentations §2.3, and the dependency check reports 0 problems (output below). R02 (upward AlgebraicCurves edge): repaired; `README.md:82` and `README.md:1602` cite JacobianChallenge Layers A–B, which exist on main at `TauCetiRoadmap/JacobianChallenge/README.md:111` and `:135`. R03 (84 anchors): not repaired, see R01 below. R04 (layer and target headings): not repaired, see R02 below. R05 (namespace and layer order): repaired; `Suggested.lean:42` opens `namespace TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights`, the declarations follow README layer order with `/-! ## Layer … -/` comments, and all seven README names were updated. R06 (Diamond–Shurman DOI): repaired; `README.md:1929` carries `10.1007/978-0-387-27226-9` and the inline citation at `README.md:464` no longer links the wrong DOI. R07 (source manifest): not repaired, see R03 below. R08 (Igusa Checks): repaired; `README.md:821–828` add the API sentence and four Checks, whose values I recomputed (table rows "Igusa deck action").

## R01 (P3) — Delete the 84 HTML anchors

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:94`, `:114`, `:132`, `:156`, … (84 lines of the form `<a id="target-…"></a>` or `<a id="layer-r15-…"></a>`).

**Claim:** The anchors carry the README's internal links.

**Witness:** The worker's gate reports `residue=84`; its rule forbids `<a id=` tags. `grep -c '<a id=' README.md` gives 84 at this head, as at the previous one.

**Repair:** Delete the anchor lines and number the targets (`### k.n Title`, or `#### k.n.m Title` under a `### k.n` grouping), then rewrite every `[text](#target-…)` and `[text](#layer-r15-…)` link as a section reference (`§k.n Title`). Two consumers link fragments of this README (SerreWeightAndLevelOptimisation at its README line 114 cites `#target-s-type-arises-from-and-modular`); their links die with the anchors and are their own repair, so cite by number from now on. On the previous head the same deletion left every other gate counter at 0.

## R02 (P3) — Put layers, targets and the closing sections into the required shape

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:158` (`## Layer R15.1 — …`), `:1571`, `:1608`, `:1640`, `:1672` (`### R15.5A.1 …` to `### R15.5A.3 …`), `:1781`, `:1905`, `:1911`.

**Claim:** The `R15` identifiers and the `####` target headings are the roadmap's structure.

**Witness:** The gate reports `target-ids=4` at lines 1571, 1608, 1640 and 1672 ("write `### k.n Title`"). The seven layer headings are `## Layer R15.k — …` rather than `## Layer k: …`; every target is a `####` heading under an anchor; there is no `## Downstream consumers` heading (the consumer list is a paragraph at line 1781 inside Layer R15.6) and no `## References` heading (line 1911 is `## Sources and pagination`); three mathematical targets with Checks and `*Needs:*` lines (`README.md:96`, `:116`, `:134`) sit under `## Exact supplier contracts`, which is a contract section, not a layer.

**Repair:** Number the layers 1–7 (`## Layer 1: Geometric forms and comparison`, …), the targets `### k.n Title` in build order, and update the table in *How to read the build* and every cross-reference (including the `R15.x` names used by consumers: AutomorphicGaloisRepresentations and SerreWeightAndLevelOptimisation cite `R15.5A.1–R15.5A.3`, `R15.1–R15.3`, `R15.5`; a one-line concordance in *Scope and ownership* avoids silent drift). Move the Raynaud, finite-flat/peu and characteristic-polynomial-descent targets into the local-weight layer. Rename `## Sources and pagination` to `## References`, turn the paragraph at line 1781 into `## Downstream consumers`, and fold `## Reading and suggested Lean statements` into *Scope and ownership* (it describes the Lean file, which is not a layer). With the four `R15.5A.n` headings renumbered, the `target-ids` counter is 0.

## R03 (P3) — Add the source manifest

**Location:** the folder `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/` (README.md, Suggested.lean, metadata.toml only).

**Claim:** The inline links and the *Sources and pagination* list are the source record.

**Witness:** There is no `sources.toml`; the gate's manifest counters are therefore silent, and this review had to recover every text from the cache by URL. The README cites 19 distinct works, 17 in its reference list and two inline (Deligne 1969, Deligne–Serre, Serre 1987, Edixhoven, Raynaud, Katz 1973, Katz 1977, DDT, CG 2018, CG 2020, CDT, Pan, Dieulefait–Pacetti, Khare–Wintenberger, Diamond–Shurman, Jochnowitz, Serre 1975, Buzzard, Horawa).

**Repair:** Add `sources.toml` (schema `tauceti-roadmap-sources/v1`), one key per work, with the service's `url`, `fetched_from`, `sha256`, `licence_class` and `status` fields. Record Edixhoven under the journal version (Inventiones 109, pp. 563–594, open at GDZ, OCR text available: `edixhoven1992` below) with a `version_note` mapping the "author DVI" pages the README uses to the journal pages; record Diamond–Shurman as `uncertified`.

## R04 (P3) — Timeless wording in two places

**Location:** `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/Suggested.lean:35` ("These headline signatures are deferred until their prerequisite objects are available") and `README.md:56` ("at `a3a2f35`, is later than the declared pin `a91d3aa`", with a link to a library blob at that later commit); `README.md:1012` repeats SchemeAndStackFoundations §2.19, §§2.19–2.21, §§2.20–2.21 and §2.20 in one `*Needs:*` line.

**Claim:** The docstring names what is not statable; the contract names the Cartier API to follow.

**Witness:** "Deferred" is a process word the house style excludes; a citation of a library commit later than the pin is not a supplier at the pin (the resolver flags `PowerSeries.coeff_cartier` as absent from the pinned sources), and it dates the README.

**Repair:** In the docstring write "have no signature here" and name the missing carriers only (the paragraph already does). In `README.md:56` describe the coefficient-selection operator mathematically (the roadmap already makes it a target at `README.md:793`) and drop the commit-specific link and the comparison of commits. Collapse the `*Needs:*` line at 1012 to `SchemeAndStackFoundations §§2.19–2.21, 3.3`.

## Verified sound

**Scope of this review.** Both files at `9d42cd18`, every passage of the README (changed or not), the change set since `4e550b1`, the previous review, the main-branch suppliers, the open-PR suppliers (via `roadmaps show`) and the sibling checkouts named in the brief. There are **4 findings: 0 P1, 0 P2, 4 P3**; the verdict is *needs changes* only because the gate fails on R01–R02. No file in the worktree was changed. The diff outside the roadmap folder is empty.

**Gate and dependency check.** The worker's gate at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=84 … imports=0 … depcheck=0 … stray-files=0 outside-folder=0 build=0 FAIL`. The dependency command with `--movable` returned, in full:

```text
depcheck: 201 roadmaps, 1316 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at position 84, after ArithmeticGaloisRepresentations (41), FiniteFlatGroupsAndIntegralPadicHodgeTheory (45), AutomorphicFormsOnReductiveGroups (62), ModularCurvesPartII (70) and AutomorphicLFunctionsAndLocalFactors (77); its consumers SerreWeightAndLevelOptimisation (145), ClassicalSerreModularity (150), EllipticCurveModularity (151), GL2ModularityLifting (155) and AdmissiblePairsAndPadicHodgeStructures (233) come after it.

**Principles.** No route-specific shortcut: the geometric and local layers keep `p = 2, 3`, torsion coefficients, level-one and level-two stacks, coefficient primes dividing the level and inseparable DVR extensions. No re-planning: the objects this roadmap builds were searched by object in the pinned libraries, on main and in the open pull requests (below). No copied passages were found where source text was compared (Deligne–Serre §§2.7, 4.1, 5.1–5.5, 6.9–6.13, 8.2, 8.7; Katz 1973 §§1.5–1.12, 4.4; Serre §§1.2, 2.7–2.9, 3.2; Edixhoven §§2, 3, 4, 7, 8; Deligne 1969 §§2–4). The finite theta tables and small computations are Checks, not algorithms. No `set_option`, sorry'd data or extra import.

**Lean.** `lake env lean` on `Suggested.lean` at the head: exit 0, seven `declaration uses 'sorry'` warnings, nothing else. A scratch copy with `#check @…` for all seven declarations elaborated; the elaborated types keep every hypothesis the README states: `deligneSerreEigenvalueLifting` keeps `[IsDomain O] [IsDiscreteValuationRing O] [IsFractionRing O K] [Module.Finite O M] [Module.Free O M]`; `residual_attachment` keeps `[NumberField K] [IsFractionRing O K] [Finite κ] [CharP κ p]`, the kernel equation for `red`, the nonzero-reduction witness and the good-prime recurrence; `higherWeight_attachment` keeps `2 ≤ k`, `f ≠ 0`, the number-field embedding and `ℓ ∈ v`; the weight-one statements use the nonzero cuspidal carrier `EigenformAwayFromLevel N 1`. The one-tactic probe (`first | rfl | simp | infer_instance | decide | exact?` in place of each `sorry`) closed **0 of 7**: `exact?` fails on `boundedDenominators`, and the other six end with unsolved goals. No padding. Headline coverage: the seven statable headlines (all-prime bounded denominators; Deligne–Serre lifting; higher-weight attachment; weight-one prime moment; weight-one finite eigenvalue set; weight-one Artin attachment; residual attachment) are stated; the docstring names the geometric, local and witness headlines that lack carriers at the pins; nothing is forced through a stand-in. A note, not a finding: `hodd` in `weightOne_attachment` follows from `hf` (a nonzero form of weight 1 and character `χ` forces `χ(−1) = −1`), so it is redundant but harmless, and the README states the same oddness hypothesis.

**Pinned declarations opened** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`, repository-relative paths):

| Declaration | File and line | What it says, and what it does not |
| --- | --- | --- |
| `modFormCharSpace` | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:315` | Simultaneous diamond eigenspace in `ModularForm ((Gamma1 N).map (mapGL ℝ)) k`; no cuspidality, no normalization. |
| `HeckeRing.GL2.heckeTNat` | `TauCeti/NumberTheory/ModularForms/HeckeSlash/Operators.lean:84` | `T_n` on `M_k(Γ₁(N))`, `n ≠ 0`; at a prime it is the classical double-coset operator (`coe_heckeTNat_prime`). |
| `HeckeRing.GL2.EigenformAwayFromLevel` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84` | Extends `CuspForm`; fields `χ`, `mem_charSpace`, `eigenvalue` at indices coprime to `N`, `isEigen` through `heckeTCompositeGamma0`, `ne_zero`; no `a₁ = 1`. |
| `qExpansion_coeff_eq_eigenvalue_mul_coeff_one` | `…/Newforms/Coefficient.lean:110` | `a_n(f) = λ_n a₁(f)` for `(n,N)=1`; pins the normalization the README uses at line 1567. |
| `AlgHom.IsArithFrobAt` | `Mathlib/RingTheory/Frobenius.lean` | `φ x − x ^ Nat.card (R ⧸ Q.under R) ∈ Q` for all `x`; with `R = ℤ` and `q ∈ Q` the exponent is `q`, so the predicate is arithmetic Frobenius at `q` and not vacuous. |
| `Representation.IsSemisimpleRepresentation` | `Mathlib/RepresentationTheory/Semisimple.lean:34` | Every subrepresentation has a complement; continuity and finite image are separate conjuncts in the headlines. |
| `Representation.IsIrreducible` | `Mathlib/RepresentationTheory/Irreducible.lean:29` | `IsSimpleOrder (Subrepresentation ρ)`. |
| `ModularForm.IsCuspForm` | `Mathlib/NumberTheory/ModularForms/CuspFormSubmodule.lean:78` | Membership in the range of `CuspForm.toModularFormₗ`. |
| `UpperHalfPlane.qExpansion` | `Mathlib/NumberTheory/ModularForms/QExpansion.lean:171` | Taylor coefficients of `cuspFunction h f` at 0, i.e. the expansion in `e^(2πiτ/h)`; width `N` for `Γ ⊇ Γ(N)`, width 1 for `Γ₁(N)`. |

**Supplier citations resolved** (every cross-roadmap citation of the README, each round; line numbers are in the cited README on main or at its open head):

| Supplier | Sections resolved |
| --- | --- |
| ArithmeticGaloisRepresentations (open head) | Layer 1 (672), §§1.6–1.9 (1026–1149), Layer 2 §§2.1–2.3 (1450, 1625, 1692), Layer 3 (2375), Layer 4 (2830), §4.6 (3012), Layer 5 §§5.1–5.7 (3148–3329). §2.3 states both the direct construction `dirichletCharacterToGalois` with `ε_Gal(Frob_p) = ε(p)` and the Kronecker–Weber converse for open-kernel characters, as `README.md:83` says. (Its own `*Needs:*` cites ClassFieldTheory layer 13; that edge belongs to that roadmap.) |
| ModularCurvesPartII (open head) | §§2.6–2.7 (678, 719), 3.1–3.2 (901, 933), 3.7 (1080), 3.9 (1151), 4.1–4.4 (1358–1428), 5.21 (2090), 7.1–7.1a (2244, 2268), 9.1–9.3 (2561–2617), 9.9–9.11 (2778–2825; `coherentHecke`, `coherentHecke_baseChange`, `coherentHecke_qExpansion` listed at 2833–2836), 11.1 (2970), 14.1–14.4a (3499–3600), 14.11 (3755). |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory (open head) | R07.1.24/26/28/30/31/32 (1923–2326), R07.2.21 (3831), R07.3.7 (4963), R07.5.1–R07.5.11 (7495–8008), R07.5.6a (7777; `IsFiniteFlatResidual` 7781, `finiteFlatKummerCoefficients` 7792). R07.5.15 "Serre weights of GL₂(F)" are representations of `GL₂(k_F)`, a different object from the integer `k(ρ̄)` built here. |
| ComplexComparisonPartII (open head) | C−1.2 (815), C0.4 (1070), C1.7–C1.9 (1574–1673), C2.1–C2.2 (1720, 1745), C5.6 (3722; `CanonicalLogExtension` 3742), C6.3–C6.6 (4158–4324). |
| AbelianSchemesAndArithmeticModuli (open head) | §A4.3 (1900). |
| AutomorphicFormsOnReductiveGroups (open head) | §5.8 (869; `galoisAnemicEigenSystem` 903 with `t_v = tr`, `s_v = q_v⁻¹ det`), §7.3 (1163). |
| AutomorphicLFunctionsAndLocalFactors (open head) | Layer AL.3 (1844), named in Scope only. |
| SchemeAndStackFoundations (main) | §§2.19–2.21 (4094, 4275, 4390), 3.3 (4713), 4.8–4.9 (5383, 5448). |
| EtaleCohomologyFoundations (main) | 0.6 (417), 0.8 (565), 0.11 (1157), F.0–F.6 (175–1200). |
| JacobianChallenge (main) | Layer A (111), Layer B coherent cohomology and Serre duality (135). |
| ModularForms (main) | Layers 0 (259), 2 (383), 4 (532), 5 (638), 8 (764), 8G (935), 8W (prose at 923–931), 10 (1024), 10C (1119); the four `#layer-…` fragments the README links exist. |
| ModularCurves (main) | 0E (386), Layer 5 (1279), Layer 10 (2103). |
| EllipticCurves (main) | Layers 1 (423), 3 (683), 4 (793), 4.5a (905), 5 (1154); both linked fragments exist. |
| ArithmeticDirichletSeries (Completed) | Layers 3 (190), 7 (289; 7.2 at 300), 8 (320). |
| Chebotarev (Completed) | Layer 10 (410). |

**Ownership against open work.** Searched by object (`roadmaps grep`, 432 open pull requests and main) for Hasse invariant, theta operator, Serre weight, peu ramifié, Katz modular forms, q-expansion principle, Deligne–Serre, bounded denominators, Igusa, weight one. Results: AutomorphicGaloisRepresentations (#1007, order 147) consumes R15.5A (its §2.10 reads "Use R15.5A.3's unique semisimple finite-image representation", its §§1.1–1.5 and 3.11 cite R15.5A.1–R15.5A.2); SerreWeightAndLevelOptimisation (#1013, 145), ClassicalSerreModularity (#1020, 150), EllipticCurveModularityPartII (sibling checkout, README 75–77), ComputationalNumberTheory (#1408, 178, README 95–97) and NoncongruenceModularForms (#1709, §8.1) consume; ArtinRepresentations (#1711) cites AutomorphicGaloisRepresentations §2.10, which defers here. LocalGaloisDeformationRings (#923, order 71) uses `k(ρ̄)` as a given notion (§8.16) and does not define the recipe; HilbertModularVarietiesAndShimuraCurvesPartII §0.2 defines Buzzard–Diamond–Jarvis weight sets for unramified `K/ℚ_p`, a different object and later in the order; HodgeTateAndCanonicalSubgroups (#1084, 164) and AutomorphicBundles (#1069, 163) are later. No second owner of any of the seven headline statements or of the Serre weight recipe was found; the fully qualified Lean names are unique to this roadmap's namespace. Consumer drift worth passing on (not this roadmap's defect): NoncongruenceModularForms README 142 and §8.1 and SerreWeightAndLevelOptimisation README 114 cite the pre-rename names `TauCeti.KatzModularForms.boundedDenominators` and `TauCeti.ResidualModularity.ArisesFrom` (the latter is no longer a Lean declaration here at all).

**Source sample.** The brief names no targets ("none found by heading"), so I sampled 15 source-bearing target blocks with seed `int('9d42cd1', 16)` over the 77 such blocks. Texts were read from the sources cache; ids used below: `deligne-serre` (Numdam ASENS 1974; printed page = PDF page + 505), `katz1973` (author PDF; `Ka-nn` running marks), `katz1977` (author PDF; printed = PDF + 52), `serre1987` (Collège de France PDF; printed = PDF + 178), `deligne1969` (Numdam Bourbaki 355; printed = PDF + 137), `edixhoven1992` (GDZ scan of Inventiones 109, recognised by OCR this round; journal page = scan page + 561), `raynaud` (Numdam BSMF 102; printed = PDF + 239), `cg2018`, `cdt` (printed = PDF + 626), `ddt`, `kw`, `serre1975` (printed = PDF + 107), `buzzard`.

| Sampled target (README line) | Locator examined | Result |
| --- | --- | --- |
| Finite flatness and peu ramifiée (116) | `edixhoven1992` lines 1100–1187: §8.1, Prop. 8.2 (five equivalent conditions, no restriction on `p`; proof by the maximal prolongation), Lemma 8.3 (torsor equivalence), (8.4.3) and its dichotomy, Prop. 8.5 (`m ∈ {1,2}` for `p>2`, `{1,2,3}` for `p=2`), Prop. 8.6 (`p>2`, `f(Frob_p)(y)=0`, `p^s` solutions in `𝔽_(p^n)`), journal pp. 588–590 | Supports the statement as written, including the all-`p` equivalence and the `p>2` restriction on the explicit unit classification. The README's "DVI pp. 26–28" could not be checked (DVI not extractable); the journal pages are 588–590. |
| Functorial coefficient maps (222) | `katz1973` lines 448–470 (§1.5, Ka-14/15 = pp. 82–83) and 466–470 (§1.6: forms with coefficients in a `ℤ[1/n]`-module as `H⁰(…⊗K)`) | Supports the section-module definition for arbitrary modules; functoriality is elementary. |
| The Igusa interpretation (817) | `katz1977` lines 72–109 (§II, pp. 55–56): Theorem (1)–(3) and Corollaries (1)–(6) | Supports the derivation of degree `p+1`, `θ(g^p)=0`, the filtration jump for `p ∤ k` and injectivity in weights `1 ≤ k ≤ p−2` (Cor. 3). |
| The weight-two criterion (1244) | `serre1987` lines 452–554 (§2.8, Prop. 3 and Prop. 4 with proof, pp. 189–190) | Supports `k=2 ⇔ det|_I = χ̄ and finite at p`, the `GL₂(𝔽_p)` restriction with the Raynaud remark, and the `p ≠ 2` simplification in the proof. Line 549 cites Raynaud "th. 2.4.3" (misprint, see *Source issues*). |
| Fontaine–Laffaille weights (1292) | `serre1987` lines 439–451 (§2.7, p. 188: `k ≤ p+1` conditions, Remark 1 très ramifié `⇔ k=p+1`), 556–590 (§2.9); `edixhoven1992` lines 240–254 (Thm 2.5–2.6, p. 567), 424–445 (Def. 4.3, pp. 571–572) | Supports the normalized branches and the `r=1` peu condition. |
| Invariant-line eigencharacter (1366) | `deligne-serre` lines 574–597 (Lemme 6.11 and proof, p. 522) | The proof defines `χ : H → k` by `h·f = χ(h) f`; supports. |
| Character in a dominating DVR (1402) | same, lines 587–589 (prime `p ⊂ Ker χ` with `p ∩ O = 0`, character `χ′ : H → O′` reducing to `χ`) | Supports; the source's `O′` is a DVR with `O ∩ m′ = m` and `K′/K` finite, exactly the Lean conclusion. |
| Socle for a nilpotent ideal (1416) | same, lines 589–591 (the ideal lies in the support of `K ⊗ M`, hence a nonzero vector killed by it) | The source takes the support step in one line; the README's socle and localization targets expand it. Supports. |
| Occurrence in a faithful module (1436) | same | Supports (faithfulness is where `K ⊗ H ⊂ End(K ⊗ M)` enters). |
| Faithfulness of the generic action (1446) | same, lines 584–585 (`H ⊂ End(M)` generated by the operators; scalar extension) | Supports. |
| Integral representatives (1456) | same, lines 591–592 ("un multiple non nul de f″ appartenant à M") | Supports. |
| Failure of prescribed lifting (1482) | same, lines 582–583 (eigenvalues lift, eigenvectors need not) | The example at README 1484 realizes exactly the source's caveat. |
| R15.5A.1 (1571) | `deligne1969` lines 228 (Thm 2.10, p. 147), 393–421 (Déf. 3.9, (3.12), pp. 154–155), 465–483 (Prop. 3.18–3.19, (3.20) alternating for odd `k`, p. 158), 507–516 (§4, `Y[1/m]`, Thm 4.1, p. 160) | Supports the parabolic realization, the Hecke trace description and the pairing's parity; the README's pages agree with the +137 offset. |
| R15.5A.2a (1640) | `deligne-serre` lines 206–220 (Prop. 2.7(1)–(4), p. 512), 424–440 (Prop. 5.1, (5.1.1), proof 5.2 via the four-factor `L(s)`, pp. 518–519), 477–500 (§5.4, (5.4.1), Prop. 5.5 with `Y(c)` and `dens.sup ≤ r/c`, pp. 519–520), 683–690 (§8.2, p. 525), 741–750 (§8.7, p. 526) | Supports every quantifier and the `[K:ℚ]/B²` bound; the README's `log(1/(s−1))` normalization is (5.4.1). |
| The classical Serre target (1859) | `serre1987` lines 765–795 ((3.2.1)–(3.2.5), pp. 195–196), 842–845 (Remark (5), p. 197), 105–112 ((1.2.2), p. 181) | Supports the conductor exponent `dim V/V^(G₀) + b(V)` and the `(N,k,ε)` target with (3.2.5). |

So **15 of 15 sampled blocks have readable text at their locators**, now including Edixhoven. Beyond the sample I also read: `deligne-serre` Thm 4.1 and Cor. 4.2 (lines 262–279, pp. 513–514: oddness, `Tr(F_p)=a_p`, `det=ε(p)`, irreducible iff cuspidal, arithmetic Frobenius per its footnote), Thm 6.1 (507–515, p. 520), Thm 6.7 (546–559, p. 521), 6.8–6.9 (561–569), Lemme 6.13 (616–624, p. 523); `katz1973` Thm 1.6.1 (471), Thm 1.7.1 and Remark (526–542, p. 85), Thm 1.8.1–1.8.2 (544–586), Formula 1.11.1 and Cor. 1.11.2 (747–764, p. 92), Prop. 1.11.3 and Cor. 1.11.4 (765–788, pp. 92–93), Thm 1.12.1 (800–804, p. 94), Cor. 4.4.1–4.4.2 (2592–2640, pp. 151–152: `(p−1)p^(m−1)`, and `2^(φ(m))` with `φ(1)=0, φ(2)=1, φ(m)=m−2`); `edixhoven1992` §2.1 (137–193), Thm 2.5–2.6 (240–251), Def. 4.3 and Remark 4.4 (424–450), (7.1.1), Prop. 7.2 (`T_ℓ^*(Bf) = ℓ B T_ℓ^*(f)`, period `p²−1`), Prop. 7.3, Lemma 7.4 and §7.5 (971–1098: `N ≥ 5` main case; `N=2,4` via `X(4)`, `N=3` via `X(3)`, `N=1, p>3` via `SL₂(ℤ/3)` or `SL₂(ℤ/4)` invariants, `N=1, p=2,3` via Serre's Théorème 3); `raynaud` Prop. 3.3.1 (888, p. 265), Prop. 3.3.2 (944, p. 267), Cor. 3.3.6 (993, p. 268), Thm 3.4.3 and Cor. 3.4.4 (1047–1058, p. 270), Cor. 2.2.3 (722); `cg2018` Remark 3.4 (794–806, p. 316); `cdt` Lemma 4.2.2 (1745, p. 655, `q = e^(πiτ)`, `Δ⁻¹ ∈ q⁻²ℤ[[q]]`); `ddt` Lemma 4.1 (3939–3948, (b) needs `D` odd or 2 invertible); `kw` Lemma 6.2(ii) (458–462); `serre1975` Théorème 3 (153–160, p. 114); `buzzard` line 60 (`1 + 6q + 6q³ + …`). All agree with the README's statements and hypotheses.

**Adversarial calculations.** One row per statement checked; values are computed on the instances shown. Rows marked "sampled" or "headline" cover the sample and the seven Lean statements.

| Statement (README line) | Instances and computed values | Claim or competing model | Result |
| --- | --- | --- | --- |
| Tate conventions (21) | `q = t^n`: `dq/q = n dt/t`; `q d/dq = (t/n) d/dt`, so `t^i ↦ (i/n) t^i` | `KS(ω_can²) = n dt/t`, `θ(t^i) = (i/n)t^i` | Matches. |
| Raynaud boundary (98–108) | `ℤ₂`: constant model `v(δ)=0 < 1`; multiplicative `v(δ)=1 = p−1` fails strictness; `p=3`, `v(δ)=3 ≥ p` rescales to `3−2 = 1 < 2` | Maximal-model criterion `v(δ_i) ≤ p−1`, strict for one `i` | Matches. |
| Kummer peu/très (118–126) | class `1+p`: `v = 0` (peu, finite); class `p`: `v = 1` (très); at `p=2`: `−1` versus `2` | Weights 2 versus `p+1` (odd `p`) or 4 (`p=2`) | Matches Edixhoven (8.4.3). sampled |
| Char-poly descent (136) | `C₃` on `𝔽₄²` by `λI`, `λ²+λ+1=0`: trace `2λ = 0 ∈ 𝔽₂`, char poly `X² + λ²` | Traces alone do not descend; char-poly coefficients do (Lemme 6.13) | Matches. |
| Level-two λ-line (277) | `ω² ≅ O(1)`, three cusps: `M₂ = H⁰(O(1))` dim 2, `S₂ = H⁰(O(−2)) = 0`, `S₆ = H⁰(O(3−3))` dim 1; `M₄ = H⁰(O(2))` dim 3 = `4/2+1` | Dimensions 2, 0, 1 | Matches. |
| Group orders (252) | `|GL₂(𝔽₃)| = 8·6 = 48`; `|GL₂(ℤ/4)| = 6·2⁴ = 96`; kernel `I + 2M₂(𝔽₂)` has 16 elements | 48, 96, 16 | Matches. |
| Level-three weight one (272) | `Γ(3)`: genus 0, 4 regular cusps, `dim M₁ = 4/2 = 2`; level one over `𝔽̄₂`: `M₁ = 𝔽̄₂·A`, dim 1 | 2 and 1 | Matches. |
| Strong principle boundary (360) | `p=5`, `k=4`: `(5−1) | 4`, `A` has polynomial expansion 1 and `A ≠ 0`; `K = 𝔽₅` fails `5`-injectivity | Hypothesis excludes this instance | Matches Thm 1.12.1 exactly. |
| Formal Hecke model (394–400) | `Δ`, `ℓ=2`: `b₁ = a₂ = −24`; `f = q`, `ℓ=2`, `c=1`: `b₂ = a₄ + d·a₁ = d` | `−24`; `d` | Matches. |
| Katz coefficient formula (416) | `b_i = ℓ^(k−1) a_(i/ℓ) + a_(ℓi)`, `a_(i/ℓ)=0` if `ℓ ∤ i` | `katz1973` (1.11.1.2) | Matches. |
| Eigensequence recurrence (450) | `a(ℓ²m)` for `ℓ∤m`: `a(ℓ)a(ℓm) − e(ℓ)a(m) = (a(ℓ)² − e(ℓ))a(m) = a(ℓ²)a(m)`; `n=0` with `a(0)=0` trivial | Recurrence implies full multiplicativity and prime-power relations | Matches. |
| CDT normalization (508) | `Δ = q₁∏(1−q₁^j)^24`, `q₁ = q²`: `Δ⁻¹ = q⁻²∏(1−q^(2j))^(−24)` | As stated | Matches. |
| Bounded denominators (502; Lean 50) headline | `Δ/11`: `a₁ = 1/11`, `D = 11` works, `D = 1` fails; width-`N` expansion of a `Γ(N)`-invariant form is defined since `T^N ∈ Γ(N)` | `∃ D ≥ 1, ∀ n, D a_n ∈ ℤ` | Matches; statement nonvacuous at `k<0` (zero form, `D=1`). |
| Diamond parity (526) | `⟨−1⟩` on weight `n`: `(−1)^n`; `n = 3` gives `−1`, in char 2 gives 1 | `(−1)^n` for all `n ∈ ℤ` | Matches. |
| Boundary eigenvalues (677–679) | `E_k^(1,ε)`: `a_x = 1 + ε(x)x^(k−1)`, constant term `≠ 0` at `∞` (`δ(ψ)=1`); `E_k^(ε,1)`: `ε(x) + x^(k−1)`, nonzero at 0. `𝔽₅`, `n=3`, `x=3`, `ε(3)=−1`: `1−9 = 2`, `−1+9 = 3` | Two-character formula; single-orbit formula gives 2 for both | Matches; CG18 Remark 3.4 insufficient (source issue). |
| Hasse weight (707) | `F(λ⁻¹η) = λ^(−p)Aη = λ^(1−p)A·(λ⁻¹η)` | `A(E,λω) = λ^(1−p)A(E,ω)`, weight `p−1` | Matches. |
| Deligne congruence (733) | `v_p(B_(p−1)) = −1` (von Staudt), so `v_p(−2(p−1)/B_(p−1)) = 1` for `p ≥ 5`; `E₄ = 1 + 240q + …`, `240 = 2⁴·3·5` | `E_(p−1) ≡ 1`; `E₄ ≡ 1 mod 2, 3` | Matches. |
| Formal theta/Hecke (745–749) | `T_(ℓ,ℓ²c,d)(Θf)_n = ℓn a_(ℓn) + ℓ cd n a_(n/ℓ) = ℓ Θ(T_(ℓ,c,d)f)_n`; `f = q²`, `ℓ=2`, `c=d=1`: both sides `2q + 8q⁴` | Identity over any ring | Matches. |
| Theta on Δ mod 5 (751) | `2τ(2) = −48 ≡ 2 mod 5` | 2 | Matches. |
| Filtration (753) | `w(1)=0`, `w(A)=0`; `Δ mod 5` nonvanishing on the open curve while `A` vanishes at `j=0`, so `A ∤ Δ`, `w(Δ)=12` | 0, 0, 12 | Matches. |
| `T_p^*θ = 0` (757) | weight `k+p+1 ≥ 2`: `T_p = U` mod `p`; `U(Σ n a_n q^n) = Σ pn a_(pn) q^n = 0` | 0 | Matches. |
| `U`, `V`, Θ (785–809) | `𝔽₂(t)`: `V(tq) = tq²`, `(tq)² = t²q²`; `ℤ/9`, `p=3`: `Θ(V q) = 3q³ ≠ 0`, `≡ 0 mod 3`; `UV(q) = q`, `VU(q) = 0`; `U₀(f)_m = a_0` | `V ≠` Frobenius; torsion keeps the scalar `p`; only `UV = 1` | Matches. |
| Igusa deck action (825–828) | `p=5`, `u=2`: `u⁻¹ = 3`; `p=3`, `u=−1`: `a ↦ −a`, `a² = A` fixed; `2⁴ = 16 ≡ 1 mod 5`; char 2 width 3: `1/3 ≡ 1` | Inverse character `u^(−k)`; direct character would give `2f/a` | Matches; R08 repaired. sampled |
| Ordinary divisor (846–854) | exponents of `(ℤ/p^m)ˣ`: `(5,2) → 20`; `(2,1) → 1`, `(2,2) → 2`, `(2,3) → 2`, `(2,4) → 4`; odd formula at `(2,4)` gives 8 | Katz 4.4.1–4.4.2 | Matches. |
| Torsion socle (866–879) | `ℤ₃`, `m=2`: `(ℤ/9)[3] = {0,3,6} ≅ 𝔽₃` via `a ↦ 3a`, reduction mod 3 is 0; `K → 0` has `K[ϖ] = 0`, not injective | Criterion needs power torsion | Matches. |
| Weight-one doubling (889–897) | kernel on socle: `f + ⟨p⟩Vg = 0`; `θ`: `θf = 0`; weights `1..p−2` (`p=3`: `{1}`) give `f=0` (Katz 1977 Cor. 3); then `Vg = 0`, `g = UVg = 0`; over `ℤ/9` `Θ(Vq) = 3q³ ≠ 0` so the step needs the socle | Injectivity of `ψ` | Matches. sampled |
| Supersingular locus (929) | `p=2`, `N=5`: `j=0`, `Aut` of order 24; a unit `α ≠ 1` of the Hurwitz order has `deg(α−1) = 2 − tr α ∈ {1,2,3,4}`, never divisible by 5, so the action on the 24 points of order 5 is free: one point; mass check `24·(1/24) = 1` | `dim SS_k = 1` for every `k` | Matches. |
| Twisted periodicity (943–952) | `B ∈ SS_(p+1)` (`dA ∈ ω^(p−1)⊗Ω¹ = ω^(p+1)`); `T_ℓ^*(Bf) = ℓBT_ℓ^*(f)`; `p=5`: `B⁴` shifts by 24 with `ℓ⁴ ≡ 1`; `p=2`, `ℓ=3`: `3 ≡ 1` | Edixhoven Prop. 7.2 | Matches. |
| Root-dependent Fricke (963) | `ζ ↦ ζ⁻¹` sends `Q ↦ −Q`, `[−1]` acts by `−1` on `ω` | `W_(ζ⁻¹) = (−1)^n W_ζ` | Matches. |
| Twisted duality (993–1003) | dual of `ω^(2−n)(−C)` is `ω^(n−2)(C)`; with `Ω¹ = ω²(−C)`: `H¹(ω^(2−n)(−C)) ≅ H⁰(ω^n)^∨`; Hasse sequence `n = p+1−k`; scalar `ℓ^(1−n) = ℓ^(k−p) = ℓ^(k−1)` in char `p`; `k > p+1` gives `S_(p+1−k) = 0` | As stated | Matches. |
| Theta cycles, large table (1043–1052) | `a_p=0`, `k=2`: `w(θ^i f) = 2 + i(p+1)`, divisible by `p` first at `i = p−2` (`= p(p−1)`), then `θ^(p−1)f = f − VUf = f`, weight 2: `P(p+3,p−2), 2`; `a_p=0`, `3≤k≤p−1`: drop to `p+3−k` means `s = p+2−k`, next block ends at `p(k−2)`, final drop `s = k−1` to `k`; `a_p=0`, `k=p`: `p+(p+1)−2(p−1) = 3`, block ends `p(p−2)`, drop `s=p−1` to `p`; `a_p≠0`, `2≤k≤p−1`: first drop to `2p+2−k` (`s = p+1−k`), block ends `kp`, wrap `s = k` to `k+p+1`; `k=p+1`, `a_p=0`: `w(θ^(p−1)f) = p²+p ≠ p+1`, impossible; `p=5`: `[8,14,20,2]`, `[8,14,20,10]` | Table rows and lengths `p−1` | Matches, including the "does not occur" row. |
| Theta cycles, small primes (1056–1064) | `p=2`: `k=2`, `a_2≠0`: `θf = f − a_2Vf`, `w(Vf) = 4 > 2`, so `(4)`; `k=2`, `a_2=0`: `θf = f`, `(2)`; `k=3`, `a_2=0`: `w = 6 ≠ 3`, impossible. `p=3`: `k=3`, `a_3=0`: `w(θf) ∈ {5,3,1}`, only 3 returns to 3: `(3,3)`; `k=3`, `a_3≠0`: `w(θ²f) = w(Vf) = 9` forces `w(θf) = 5`: `(5,9)`; `k=2`: `(6,2)`/`(6,6)`; `k=4`, `a_3=0`: `12 ≠ 4`, impossible | Table | Matches. |
| General shapes (1036–1037) | one-drop cycle: last entry `h + (p−2)(p+1) ≡ h−2`, so `h ≡ 2`; two-drop cycle from the `a_p=0` row with `h=k`: `h₀ = k`, first block `p−k+1`, `h₁ = p+3−k`, second block `k−2`; the other cyclic reading has `h₀′ = p+3−k`, one of the two satisfies `h₀ ≤ (p+3)/2` | Shapes up to cyclic permutation | Matches. |
| Weight reduction, small levels (1078) | `N=3`, `p=2`: `G = Γ₁(3)/Γ(3) ≅ ℤ/3`, odd; `N=2,4`, `p=3`: `|Γ₀(2)/Γ(4)| = 48/3 = 16`, `|Γ₁(4)/Γ(4)| = 4`, prime to 3; `N=1`, `p ≥ 5`: `|SL₂(𝔽_ℓ)| = ℓ(ℓ²−1)` avoids `p` for `ℓ ≢ 0, ±1`; `N=1`, `p=2,3`: always divides | Only `N=1`, `p=2,3` need Serre 1975 | Matches Edixhoven §7.5 line by line. |
| Tame niveau two (1132–1134) | `(a,b)=(0,1)`: `k=2`; `(1,3)`, `p=5`: `k=9 = 3 + 1·6`; `k(a,b) = 1+pa+b = 1+(b−a) + a(p+1)` | (2.2.5) | Matches. |
| Unramified exception (1132, 1150) | `(0,0)`: formula 1, classical `p`; niveau-one range `b ≤ p−2` excludes trivial `χ^(p−1)` | `k = p` | Matches. |
| Wild table (1166–1170) | `(α,β)=(1,3)`, `p=5`: `1+5+3 = 9`; `(3,1)`: 9; adjacent `(0,1)`: peu `2`, très `(0+1)(6) = 6`, difference `p−1 = 4`; `p=2`: très `4 = 2+2`; `ℚ₂(√−1,√2,√5)`: `√5 ∈ ℚ₂^nr`, so `[LK₀:K₀] = 4`, `m=2`; `m ≤ 2` because the unramified class kills one of the three `𝔽₂`-dimensions of `ℚ₂ˣ/ℚ₂ˣ²` | Serre (2.4.6)–(2.4.9); Edixhoven Prop. 8.5 gives only `m ≤ 3` | Matches. sampled |
| Determinant and parity (1202) | `det = χ^(a+b)` with `k−1 = pa+b ≡ a+b mod p−1`; `det ρ(c) = −1 = ε(−1)(−1)^(k−1)`; `𝔽₂`: `c = ((1,1),(0,1))`, `c² = I`, `det = 1 = −1`, `c ≠ I` | `ε(−1) = (−1)^k` for odd `p`; no triviality at `p=2` | Matches. |
| Twist normalization (1216–1218) | `p=5`, `(1,3)`: exponents `16, 8`; twist by `ψ^(−6)`: `10, 2 = (0,2)`, `k=3 ∈ [2,6]`; `p=3` très `(0,1)`: 4; `p=2`: `χ̄₂ = 1`, weights fixed | Bound `2 ≤ k ≤ p+1`; dyadic `{2,4}` | Matches. |
| Dyadic descent (1230–1236) | niveau-two `ψ, ψ²` have Raynaud exponents `(1,0)`, `(0,1) ≤ e = 1`; Frobenius swaps the eigenlines over `𝔽₄`; `ℤ/2` and `μ₂` both model the constant group | Prolongation exists; uniqueness fails at `e = p−1` | Matches. |
| Weight-two criterion (1248) headline-adjacent | `p=5`, extensions of 1 by `χ̄`: unit class `→` finite, `k=2`; class of 5 `→` très, `k=6`; determinant alone gives `k ≡ 2 mod 4` | Prop. 4 | Matches. sampled |
| Edixhoven comparison (1262–1268) | unramified `p=5`: `1` vs `5`; dyadic très: `3` vs `4`; supersingular `(0,1)`: `2` both | Remark 4.4.1 | Matches. |
| Dyadic dichotomy (1282) | `d ∈ {5,−1,−5}`: unit classes, weight 2; `d ∈ {±2,±10}`: odd valuation, weight 4 | Serre 2.6 | Matches. |
| Fontaine–Laffaille (1296–1304) | `{0,r}`: niveau one `(0,r)`, `k = r+1` (`r ≤ p−2`); niveau two `(0,r)`, `r+1`; wild `(0,r)` generic `r+1`, `r=1` peu `2`, très would be `p+1`; `p=2`: empty range | `k = r+1` | Matches. sampled |
| Tate curve (1320–1321) | `q = p^p(1+p)`: `v ≡ 0 mod p`, peu, 2; `q = p`: très, `p+1` or 4 at `p=2`; `v_p(j) = −v_p(q)` | Prop. 5 | Matches (see source issue at `p=2`). |
| Bad dihedral (1332) | `p=5`: `k = 3` or `4`; `p = 2k−1` and `p = 2k−3`; `Ind` from `ℚ(√5)`: inertia `χ̄ ⊕ χ̄·sgn = (1,3)` normalizes to `(0,2)`, `k=3` | `(p+1)/2`, `(p+3)/2` | Matches KW Lemma 6.2(ii). |
| Invariant line and character (1358–1384) | `H = k×k` on `k²`: lines through `(1,0)` and `(0,1)` give `(1,0) ↦ 1` and `0`; nilpotent `h` maps to 0 | Existence, uniqueness for `f ≠ 0` | Matches. sampled |
| Horizontal prime (1394) | `H = O[t]/t²`, `Q = (ϖ,t)`, `P = (t)`: `P ∩ O = 0`, `Q ∩ O = (ϖ)` | Going down | Matches. |
| Dominating DVR (1404) | `H = O[x]/(x²−ϖ)`, `L = K(α)`, `α² = ϖ`: valuation ring above `O`, `α ↦ 0` | Krull–Akizuki, no separability | Matches. sampled |
| Socles (1418–1428) | `A = κ[t]/t²`: `tV = κt ≠ 0`, `t·κt = 0`; `κ×κ` at `I = 0×κ`: `(1,0)` killed by `I` | Nonzero socle; descent of a localized socle | Matches. sampled |
| Faithful occurrence (1438, 1512) | `κ×κ` on `κ²`: both characters occur; on `κ` via first projection, second character forces `0 = v` | Faithfulness necessary | Matches. sampled |
| Deligne–Serre lifting (1470; Lean 74) headline | empty family on `M = O`: `L = K`, `V = O`, `f′ = 1`; `T = ((0,ϖ),(1,0))`: `T² = ϖI`, residual eigenvalue 0, lift `α` with `α² = ϖ ∉ K` (odd valuation), `T(α,1) = (ϖ,α) = α(α,1)`; `𝔽₂[[t]]`: `X²−t` inseparable | Conclusion with `Module.Finite K L`, DVR `V`, residue square | Matches; Lean keeps all hypotheses. sampled |
| Prescribed vector (1484) | `T = ((0,ϖ),(0,0))`: residual `e₂` eigenvector; generic kernel `Ke₁` | Eigenvalue lifts, vector does not | Matches. sampled |
| Controlled lifting (1526–1528) | full eigenvector with `a₁ = 0` has `a_n = λ_n a₁ = 0`; shift `E₄` at `p=2,3` (`4 ≡ 0 mod p−1`), `E_(p−1)` at `p ≥ 5` | DS 6.9–6.10 | Matches. |
| Weight one to two at 3 (1538–1545) | `L(0,χ₋₃) = −B_(1,χ₋₃) = 1/3`, so `6E₁ = 1 + 6Σσ₀^χ(n)q^n`: coefficients `6, 0, 6, 6`; mod 3 the series is 1; `χ₋₃(ℓ) ≡ ℓ mod 3` | Expansion and determinant compensation | Matches. |
| Hodge dimensions (1595) | `g, 2g, g`: `X(1)`: `0,0,0`; `X₀(11)`: `1,2,1` | New Check | Matches. sampled |
| Higher-weight attachment (1610–1632; Lean 101) headline | `E₄`: `λ₂ = 1 + 2³ = 9`, `a₂ = 2160 = 9·240`; `2Δ`: `a₂ = −48`, `λ₂ = −24`; `Δ(q³)`: `a₁ = a₂ = 0`, `λ₂ = −24`, polynomial `X² + 24X + 2048`; level 11: `X² + 2X + 2`; pairing algebra: `B(Fx,Fy) = εcB(x,y)` so `det F = εc`, adjoint `(tr F)I − F = εV`, `tr F = λ_q`; `F=V=I` in char 2: `(X+1)²`; `F = rI`: `εV = rI`, `λ = 2r`, `r² = εc`; `F=I, V=2I`: `(X−1)² ≠ X²−3X+2` and the transpose identity fails | `X² − λ_q X + ε(q)q^(k−1)` at arithmetic Frobenius; `IsArithFrobAt` exponent is `q` | Matches; Deligne Prop. 4.8 gives `FV = p^(k+1)` in his weight `k+2`. sampled |
| Eisenstein branch over `K_v` (1610) | `ρ = ψ₁ ⊕ ψ₂χ^(k−1)`: a conjugation fixing traces permutes the two characters, cannot swap finite-order with infinite-order, so both are `K_v`-valued | Statement over `K_v` without enlarging `K` | Matches. |
| Weight-one prime moment (1642–1654; Lean 130) headline | `S₃`-form: values `2,0,−1` on classes of size `1,3,2`: `(4+0+2)/6 = 1`; Eisenstein `1 + χ₋₃`: `4·(1/2) = 2`; `log L(f⊗f̄) ≥ Σ|a_p|²p^(−s)` termwise | Coefficient 1 for cusp forms, 2 for distinct characters | Matches. sampled |
| Finite eigenvalues (1650; Lean 142) headline | `[K:ℚ]=2`, `B=4`: `2/16 = 1/8`; `∑'` over a subset of primes is summable for `s > 1`, so the inequality is not vacuous | `∃ Y, ∀ ε, ∃ δ, …` is upper density `≤ η` | Matches. |
| Weight-one attachment (1674–1691; Lean 155) headline | `χ₋₃(2) = −1`: `1 ⊕ χ₋₃` has trace 0, det `−1` at 2; `χ mod 5`, `χ(2) = i`: trace `1+i`, geometric would be `1−i`; `S₃`: transposition `(1,−1)`, `(1,1)` on `𝔽₂` shows `det=1` is uninformative; cusp with Eisenstein eigensystem would make `ρ_f` reducible against DS Thm 4.1 | `irreducible ↔ cusp`; `hodd` redundant | Matches. |
| Residual attachment (1735; Lean 186) headline | lattice `M` of forms with `O`-coefficients: `g ∈ ϖM ⇔` all coefficients in `ϖO`, so `M/ϖM ↪ κ[[q]]` and the recurrence gives `T_q f ≡ ã_q f mod ϖM`; `n=0`: `(1 + χ(q)q^(k−1))b₀ ≡ a_q b₀`, the correct constant-term action; `k=1` with even `χ` forces `f=0`, contradicting `hne`; `O ∩ ℚ = ℤ_(p)` since `O ≠ K`; descent from `κ_V` to `κ` by Lemme 6.13 | Representation over `κ` itself, `p | N` allowed | Matches. |
| S-type controls (1769–1851) | 11a1: `#E(𝔽₂) = 5`, `a₂ = −2 ≡ 1 mod 3`, `X² − X + 2`; trivial rep `(X−1)²`; `τ(2) = −24 ≡ 0`; `(5,5)` on the curve (`30 = 30`), order 5; `det ρ_f(c) = (−1)^k(−1)^(k−1) = −1 ≠ 1` in `𝔽₃` | As stated | Matches. |
| Place transport (1775) | `a² + a − 1 = 0`: roots mod 11 are 3 (`9+3−1 = 11`) and 7 (`49+7−1 = 55`); `σ(a) = −1−a`; `σ(λ) = (11, a−7)`; `σ(a) mod σ(λ) = −8 ≡ 3` | Transported place recovers 3 | Matches. |
| Classical target (1861–1879) | conductor exponent `dim V/V^(G₀) + b(V)` (Serre (1.2.2)); unramified at odd `p` requests `p`; dyadic très requests 4 | Target predicate | Matches. sampled |

**65 rows**, covering the 15 sampled targets, the 7 headlines and the targets touched by R01–R04. They exercise zero modules, the empty operator family, `k < 0`, `k = 0, 1, 2`, `p = 2, 3, 5`, `𝔽₂`, `ℤ/9`, inseparable extensions, nilpotents, nonfaithful actions, non-abelian `S₃`, and both directions of the stated equivalences.

## Not verifiable

- **Edixhoven's author DVI pagination.** The README cites Edixhoven by "author DVI" pages (24 December 1998 file). That file is not extractable; the journal text was read instead (GDZ scan, OCR). Statement numbers and content agree; the DVI page numbers themselves remain unverified. R03 asks for a version note.
- **Diamond–Shurman, Proposition 5.8.5.** Paywalled; cited by locator only. The recurrence it is cited for was checked against the pinned coefficient theorem and Deligne–Serre §1.6 instead.
- **Calegari–Geraghty 2020 Lemma 8.14, Pan §4.1.2, Dieulefait–Pacetti Lemma 1.14, Horawa p. 57, Jochnowitz §7.** In the cache but outside this round's sample; not re-read this round (the previous review read CG 2020, Horawa and Pan).
- **Open pull requests without files.** Ownership was checked against main, the board packages, the sibling checkouts named in the brief and the `roadmaps grep` index; open pull requests the brief does not name were not inspected beyond that index.

## Source issues

- **Error** in cg2018 at Remark 3.4, printed p. 316: the source says the diamond group acts transitively on the cusps of the auxiliary curve, so a boundary eigenform has eigenvalue `1 + χ(x)x^(n−1)` at every good `x`; it should be a cusp-type decomposition with two characters, since diamonds preserve cusp type and the zero-type cusps give `χ(x) + x^(n−1)`; affects the proof.
- **Misprint** in serre1987 at the proof of Proposition 4, printed p. 190: the source says the tame niveau-two case is treated in Raynaud, Théorème 2.4.3; it should be Théorème 3.4.3 (Raynaud has no 2.4.3; 3.4.3 is the tame prolongation theorem, printed p. 270); affects nothing.
- **Gap** in serre1987 at Proposition 5(ii), printed p. 191: the source says the weight is `p+1` when `p ∤ v_p(j_E)`, with no restriction on `p`; it should be 4 when `p = 2`, by the source's own dyadic rule in §2.4 (add 2, not `p−1`, in the très ramifié case); affects a stated result.
