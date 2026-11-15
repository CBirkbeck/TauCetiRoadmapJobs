<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6896366651 -->
Review (claude) of 4a82b76

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Two letters still carry two meanings

   **Location:** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:629–633`: “split Tate curve `E_q/F_v` with `p ∤ v(q)` … `q = ϖ_v⁵` … Over `𝔽₅` with `q_v = 11`”; line 712 “`v(q) = 1`”; lines 107 and 132: “`U ⊂ 𝔸¹_K` is `switchParameterOpen`” and “For `U = 1 + e`”.

   **Claim:** after the round-7 repair each symbol denotes one object.

   **Witness:** §3.3 uses `q_v` for the residue cardinality (line 621) and `q` for a Tate parameter (line 629) in one section; §§7.1 and 7.3 were changed to `q_A` for exactly this. `U` is the matrix in Layers 3–6 (lines 556–712, 1016, 1023) and the parameter open in Layers 2 and 7 (lines 394, 426, 1097, 1130, 1214).

   **Repair:** in the first two Checks of §3.3 and in the Layer 3 Examples write the Tate parameter as `q_E` (“a split Tate curve `E/F_v` with Tate parameter `q_E` and `p ∤ v(q_E)`”, “`q_E = ϖ_v⁵`”, “`v(q_E) = 1`”). Add to the Conventions bullet on `ad⁰`: “The matrix `U` occurs in Layers 3–6 only, the parameter open `U` in Layers 2 and 7 only.” Tested: with `q_E`, the third Check's `q_v = 11` no longer shares a letter with the Tate parameter; a search of the line numbers above finds no layer using both meanings of `U`.

2. **F02** (P3) One page locator in the References

   **Location:** `design/README.md:1325–1326`: “§4 setting, pp. 6–7 (lines 264–289)”.

   **Claim:** the setting of Section 4 of CaptainSude26 is on printed pages 6–7.

   **Witness:** CaptainSude26 lines 264–289 lie between the page markers at lines 257 and 304, so all on printed page 6; the same entry places Lemma 4.1 (line 291) on p. 6.

   **Repair:** write “§4 setting, p. 6 (lines 264–289)”.

All four findings of round 7 are repaired. There is no P1 or P2 finding. Two P3 findings (R01, R02) remain, each with an exact repair, so the verdict asks for changes: an acceptance lists no finding. The declared supplier gap `acc-torsion-inertial-comparison` (AutomorphicGaloisRepresentationsPartII AG2.5) is precise, minimal and declared in both files, and is not a finding. This is a design: there is no `Suggested.lean`, and this lane does not elaborate.

## Verified sound

### Round-7 findings

- **F01 (§6.1, second Check): repaired.** Lines 1017–1026 now read “If `ρ(I_{v^c})` is infinite, or finite of order divisible by five …, no CM extension `F'/F` reaches `P'^c ∩ S' = ∅` with `P'` protected … If instead `ρ(I_{v^c})` has order three, a prescribed completion of ramification index three … keeps protection above `v`”. Recomputed below.
- **F02 (§8.1 *Needs*): repaired.** Lines 1269–1281: “re-run the argument of Theorem 2.1(c), which does not use `ζ₅ ∉ K`: `F = K(μ₃ₚ)` is CM by Theorem 1.1; `A_t` is geometrically non-CM because …”; *Needs* and the plan's `8.1` prerequisites list Theorem 1.1, the parent's §4.2 and FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3.
- **F03 (letters in Layer 7): repaired in Layer 7**, with different letters from those suggested (`λ`, `m_v`, `q_A`, `z₁z₂ = s²`, `r`, `γ`); lines 1095–1141, 1156–1173, 1065. The same pattern outside Layer 7 is R01.
- **F04 (dangling reference, manifest): repaired.** Line 1339: “replaced in this case by §4.2”; `sources.toml`, `LeHung26`, `cited_for` contains `"1.1"`. The added ACC23 citation in §6.1 (§6.5.12, p. 178, lines 7163–7187) was checked: line 7163 is on printed page 178 and introduces the three imaginary quadratic fields.

### Adversarial table (computed by hand this round)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.1 Check, impossibility | `ρ(I_{v^c})` of order 5; infinite | `[I_K : I_L] = e`, so `ρ(I_L) = 1` forces `5 ∣ e`; the kernel of `I → ℤ₅(1)` has order prime to 5, so the image of `I_L` lies in `5ℤ₅` and `ρ̄ = U^(5k) = 1` at the matching place above `v`; infinite image has no trivial open subgroup | true |
| §6.1 Check, order three | residue characteristic `≠ 3` | the unique index-3 subgroup of inertia is the kernel; above `v` the index 3 is a unit in `ℤ₅`, residual inertia `⟨U³⟩ ≠ 1` | true |
| §8.1 second branch | `K = ℚ(ζ₅)`, `K₆₀` | `SL₂(𝔽₅)` perfect, nonabelian, so no abelian subgroup of index `≤ 2`; `K₆₀(ζ₅)` has fixer `{a ∈ {1,29} : a ≡ 1 mod 5} = {1}`, so it is `ℚ(ζ₆₀)` | every step has a listed input |
| §2.1 | (a)–(c) against the parent's §7.4, §5.3 | §7.4(1) lists the pair `(3,5)` over an arbitrary number field; §5.3 is stated for any CM `L` with `ζ₅ ∉ L`; Theorem 1.2 needs only `G_{F(ζ₅)} ⊆ G_{K(ζ₅)}` and `F_w = K_v = ℚ_q` | holds; `ζ₅ ∉ F` not used |
| §2.2 | lifts at `p, 3, p`; twist | clause (4) of CN23 Theorem 5.2 is for `p = 5` only (line 3856); `χ² = 1` gives trivial central character | holds for `ζ₅ ∈ K` too |
| §2.3 Check | `q = 4`, `a = 4` | `1 − 4·4^(−s) + 4·4^(−2s) = (1 − 4^(−(s−1/2)))²`, roots `1, 1`; `4 = 2√4` meets the Hasse bound | shift direction correct |
| §3.1 | `X = [[a,b],[c,−a]]`; `diag(2,3)`; characteristic 2 | `UX − XU = [[c,−2a],[0,−c]]`, `UᵀX − XUᵀ = [[−b,0],[2a,b]]`; `2·3⁻¹ = 4 = 3·2⁻¹`; `Uf = f + E₁₁`; `(D−1)²f = −2e` | invariants zero iff `2 ∈ k^×` |
| §3.2 | `p = 3, 5, 7` | norm `= Σ C(p, i+1)(D−1)^i ≡ (D−1)^(p−1)`: `(D−1)² ≠ 0`, `0`, `0`; `p = 3`: `ker N = ke ⊕ kh = (D−1)M`, `H¹ = 0`; `p = 5, 7`: `M/(ke ⊕ kh) = k f̄` | as stated |
| §3.3 API | `g = [[a,b],[c,d]]`, `gU = U^q g` | `qc = 0`, `a = qd`: upper triangular of ratio `q_v`; a unipotent image is an elementary `p`-group, a quotient of `ℤ_p(1)`, so cyclic of order `p` | holds |
| §3.5 | `q ≡ 1`, `q ≡ 2 mod 5`; `p = 3` | `(D−1)(αh+βf) = −2αe + β(h−e)`: `M^(I) = ke`, `φ` scales `e` by `q`; `dim L_v = 3 − (3 − h⁰)`; cocycles `3 + 1`, coboundaries `2`; relation gives `(D−1)c(φ) = −((q−1)/p)·Norm·c(τ)`, zero for `p ≥ 5`, `(D−1)²c(τ) ≠ 0` possible at `p = 3` | (a)–(d) hold; `p ≥ 5` in (d) is needed |
| §4.1 | `G × A`, `A` abelian acting trivially | `H¹(A, M)^G = Hom(A, M^G) = 0`; inflation `H¹(V, M) → H¹(I_v, M)` injective; order-two inertia is `{±1}`, acts trivially, `Hom(ℤ/2, M) = 0` | holds; Checks correct |
| §4.2 (used by 4.3, 5.4) | `diag(2,3)` | eigenvalues on `e, h, f`: `4, 1, 4`; `Sym²` of the standard representation is irreducible for `p = 5` | detection works |
| §4.3 | `(d,t,r) = (2,1,6)`, `(2,3,10)` | `g = 0`, `6`; `dim R^loc = 1 + 9 + 4 = 14`, `14 + 6 = 20 = r + 4t − d`, `1 + 11 + 10 = 22`; framing `P`: `+4` on both sides | deficit `d` |
| §5.1 Check | local degrees multiples of 4, `≥ 8` | `a + a' < d/2` forces `d > 32`; `d = 36`: all degrees 8, `8 ∤ 36`; `d = 40`: `(8,8,24)` fails at 24 (`8 < 20`), `(8⁵)` gives `24 > 20` | correct |
| §5.2 | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·11 = 111 = 1 + 3t + 2d` | correct |
| §5.3 | `u ∈ R`, `v ∈ P`, `w ∈ Q` and their conjugates | `u^c ∈ P ⇒ u ∈ P^c ∩ S = ∅`; `v^c ∈ Q ⇒ Q ∩ S^c ≠ ∅`; `w^c ∈ S ⇒ w ∈ S^c` | conjugates outside `R ∪ P ∪ Q` are outside `S ∪ Q`, as ACC23 Theorem 3.1.1 needs |
| §5.4 | `r = 111` | `g = r − 111 = 0`; `dim R_∞ = 111`, `dim S_∞ = 151`; `det ρ̄` trivial at `R` gives `q_v ≡ 1 mod 5`, so `χ_v` of order 5 exists | deficit `40 = l₀` |
| §6.2 | `⟨SL₂(𝔽₅), μγ⟩`, `μ² = 2`, `γ = diag(1,2)`; `det` of order 4 | `det(μγ) = 4`, `(μγ)² = diag(2,3)`, order `240`, projective order `120`, both kernels of index `120`; order 4: `120 < 240` | `ζ₅ ∈ F` is a real hypothesis; a subgroup of `SL₂(𝔽₅)` onto `PSL₂(𝔽₅)` contains `−1` |
| §7.1 | fixed nodes 1 or 3 | `2r T' = c₀ − 2P₀` has one solution mod 3; `(x,y) ↦ (−x,−y)` has invariants `x², y², xy = s`, so `z₁z₂ = s²`; graph Betti number `2 − 2 + 1 = 1` against `3 − 2 + 1 = 2` | type `I₃`, thickness `2 + 1 = 3` |
| §7.2 | `v(s) = 1, 5, 7` | `v(q_A) = 3, 15, 21`; residues `3, 0, 1 mod 5` | protection lost exactly at `5 ∣ m_v` |
| §7.5 | `q` split completely in the normal closure of `K ⊇ ℚ(ζ₅)` | `q ≡ 1 mod 5`, `v ≠ v^c`, `μ₅ ⊂ K_v`; clause (4) fails over `L ∋ ζ₅` with projective image `PSL₂(𝔽₅)` | Theorem 6.2's protected alternative applies |
| Theorem 2.5, 6.2, 8.1 (headlines) | `ℚ(i)`, `K₆₀`, `ℚ(ζ₅)`, `ℚ(i, √5)` | `ζ₅ ∈ K`: no, no, yes, no | branches exhaustive and consistent with the Checks |

Rows of round 7 with computed values were relied on for §§1.1, 1.2, 2.4, 3.4, 7.3, 7.4; §§1.1, 1.2 and 3.4 were read again and the values recomputed (`q(q+1)²δ² = (1+q)²ψ(φ)`; ratio `1 ≠ 2` at `ℓ = 3`).

### Sources: the seeded sample

No locator is flagged unverified. All eight manifest texts were read in the sources cache; nothing was fetched, nothing is missing.

| Target | Checked at | Result |
|---|---|---|
| 2.1 | LeHung26 lines 336, 342–355; CN23 lines 4513–4517 (Theorem 6.1, `ζ₅ ∉ F`) | supported |
| 2.2 | LeHung26 lines 292–299, 344–351, 357–360; CaptainSude26 lines 634–670; OpenAI26 lines 1131, 1163 | supported |
| 3.1 | CaptainSude26 lines 187–193 | action of `Ad(U)` supported; the invariant statement is the roadmap's own, proved in the text |
| 3.2 | CaptainSude26 lines 231–241 | supported |
| 3.5 | CaptainSude26 lines 187–226 (scalar Frobenius, `μ₅ ⊂ F_v`) | supported; the general protected case is argued in §3.5 and recomputed above |
| 4.1 | CaptainSude26 lines 227–241 | supported |
| 4.3 | CaptainSude26 lines 416–444 | `g = r − 3d − 1 + t` supported |
| 5.2 | CaptainSude26 lines 285–289, 301–302; CN23 line 4361 | supported |
| 5.3 | CaptainSude26 lines 291–341; CN23 lines 4356–4366; ACC23 lines 2346–2355 (p. 58) | supported |
| 5.4 | CaptainSude26 lines 410–498; CN23 line 4261 | supported |
| 6.1 | CaptainSude26 lines 543–603; ACC23 lines 7163–7170 (p. 178) | supported |
| 6.2 | CN23 lines 3849–3872 (pp. 73–74), 4562–4572; CaptainSude26 line 267 | supported; the general statement is §6.1 plus descent |
| 7.1 | CaptainSude26 lines 509–519; parent §2.3 (`nodalModel`) | supported |
| 7.2 | CaptainSude26 lines 520–532 | supported |
| 7.5 | CaptainSude26 lines 120–125, 147, 604–609 | supported |

Also read: CN23 lines 1235–1239, 4226–4260, 4400–4408; AKT23 line 3979 (p. 86); CHT08 line 5723 (p. 116); MilneCM lines 273–295 (p. 10).

### Library, suppliers, order

- Pins `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti), read from `lake-manifest.json`. Opened: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142), `isConj_complexConj` (:148), `ofCMExtension` (:510), `of_isAbelianGalois` (:542), `IsCyclotomicExtension.Rat.isCMField` (:564, needs `∃ n ∈ S, 2 < n`); `isTotallyComplex_of_algebra` (`…/InfinitePlace/TotallyRealComplex.lean:229`); `Matrix.SpecialLinearGroup.toGL` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369`); `Matrix.SL2.commutator_eq_top` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`); `groupCohomology.map` (`…/GroupCohomology/Functoriality.lean:141`); `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`…/GroupCohomology/FiniteCyclic.lean:114`); `Representation.linHom` (`Mathlib/RepresentationTheory/Basic.lean:655`); `IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`); `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98`); `tateDualityPairing_perfect_mixed` (`…/Local/Duality/Perfect.lean`). All exist.
- Headlines: Theorems 2.5, 6.2, 8.1. A search of both pinned libraries for automorphic representations, Weil–Deligne representations, Hodge–Tate weights and potentially semistable representations returns nothing; none is statable, and the README's *Lean* paragraph names all three with what each lacks. The README attributes no backticked Lean name to this roadmap. The four leads of `scratch/citations.md` are three source keys and `ResidualImage.adZeroRep`, which ArithmeticGaloisRepresentations §7.9 defines (its README line 5249).
- Supplier citations resolved now, at the open heads or on main: the parent's 25 sections (headings, or bold paragraph titles for 4.2, 4.4, 5.3, 6.3, 6.6, 7.2, 7.4, 8.3, 8.5) and all 41 parent names; its §7.4 is stated for an arbitrary number field with any finite set of places containing those above `3p`, §5.3 for any CM field without `ζ₅`, `switch_five` without a `ζ₅` hypothesis. CrystallineLocalGlobalCompatibilityCM §§7.5, 8.1–8.7, 9.1, 9.3–9.12 (§9.1 clauses (5)–(15); §8.7 with `ζ_p ∈ F`); PotentialAutomorphyInfrastructure §§2.1, 2.3, 2.5 with their three names (§2.3 for CM or totally real fields, both directions); AutomorphicGaloisRepresentationsPartII AG2.0, AG2.5, AG2.7 with three names; GL2ModularityLifting §1.7 `cht_soluble_prescribed_completions`; and every section cited of the other 15 suppliers (67 section ids in all, none missing). ModularityAndLanglandsExtensions §§2.29–2.30 and BianchiModularForms are consumers only. No drift, no upward citation.
- Gap `acc-torsion-inertial-comparison`: same slug in `plan.json` (`gaps`, prerequisite of 5.3) and in the README (“Supplier obligations”, §5.3); supplier and section named; the stated hypotheses and conclusion match ACC23 lines 2309–2355. Not a finding.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined only by a revision; no second copy. The board index lists AnalyticNumberTheory and LawrenceVenkateshMethod, both unrelated. Round 7's search by object (protected or unipotent-inertia conditions, width-three degeneration, CM-ness of intermediate cyclotomic fields, ACC Theorem 3.1.1) was relied on for the open heads; the parent, CrystallineLocalGlobalCompatibilityCM and PotentialAutomorphyInfrastructure were read again this round and state none of the Layer 3–7 constructions.

Overlap check: read EllipticCurveModularityTotallyReal, EllipticCurveModularityImaginaryQuadratic, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (the lists on main and by results are empty); nothing shared.

### Shape and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References. Three definitions (3.3, 5.1, 5.2) with 3, 4, 4 API bullets and 4, 4, 3 Checks; 24 theorems, each with hypotheses and a locator; 92 plan tests over 28 targets. No LaTeX delimiters, pull-request numbers, machine paths, target tables, algorithms or process words (searched). The order of Layers 3 → 8 is forced by the *Needs* lines (4.1 needs 3.2 and 3.5; 5.4 needs 4.2 and 4.3; 6.2 needs 5.4; 7.5 needs 6.2; 8.1 needs 7.5).

### Copyright and arrangement

Wording: 20 passages put beside their sources (the fifteen sampled targets, §§1.2, 3.3, 4.2, 8.1 and the gap text). None reproduces a sentence; the longest shared runs are four words (“with trivial coefficient character”, CaptainSude26 line 336; “node of thickness one”, line 514), beside formulae and hypothesis lists. Arrangement: CaptainSude26 has Sections 2–6; the roadmap puts Section 6's assembly first (Layer 2, with LeHung26), splits Section 3 across Layers 3 and 4 and moves the presentation out of the proof of Theorem 4.2 into Layer 4, states a general preparation and lifting theorem (Layer 6) that the manuscript has only inside Section 5, and adds Layer 1: no one-to-one run. Reuse: no table, figure or data taken over.

Source independence: 20 passages compared with 4 sources, none shared; largest share CaptainSude26, 26 of 70 source citations; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and there is no Lean file at the design stage.
- The global patching argument of CaptainSude26 (lines 315–408, 445–498) beyond its hypotheses, counts and local computations: no refereed source states it, and it was not re-proved here.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since that definition excludes only the ratio `ℓ`; affects nothing.
- **Error** in CN23 at Lemma 5.6.5, printed pp. 85–86 (lines 4442–4450): the source says the determinant kernel is reducible when the projective image is `A₄` and `d = 3`; it should except that case, where the kernel has projective image `(ℤ/2)²` and is irreducible; affects a stated result.
- **Misprint** in CN23 at the proof of Theorem 5.2, printed p. 86 (line 4460): the source says the set contains the `q`-adic places of `K`; it should say of `F`; affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft); the parent rests on OpenAI26. No refereed source states these theorems; `sources.toml` records all three as unrefereed.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`); the README cites it by locator only. OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4a82b76315ff07e699f3266c4de7851a45b8f753", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~8", "model": "fable", "worker": "chris-x79"} -->
