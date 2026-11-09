# Review of SmoothRepresentationsOfLocalGroups (pull request #1688 at 3208d03)

**Verdict:** needs changes

Incremental re-review of the 29 lines changed since 4178a1e. The change is one thing: a new supplier citation, CyclicHomologyLieHomologyAndQuasiFreeAlgebras §5.4 (unitary and firm modules over a nonunital ring, left xst rings), added in Scope (README 79–81), in the shared-interfaces paragraph (135–138), as a contract subsection (528–534), in the SR.1.3 target *locally-unital-algebra* (1313–1318, Needs at 1322) and in the SR.1 Dependencies (1662). The mathematics of the citation is right and the cited text exists at the supplier's open head; the direction of supply is wrong (R01). `Suggested.lean` is unchanged, but the pins moved with the merge of main and the gate's new statement-hygiene scanner reports two hits in it (R02, R03). Nothing outside the folder differs from `origin/main`.

## R01 (P2) — CyclicHomologyLieHomologyAndQuasiFreeAlgebras is an upward supplier

**Location.** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` 528 (`### From TauCetiRoadmap.CyclicHomologyLieHomologyAndQuasiFreeAlgebras`), 1322 (`*Needs:* … CyclicHomologyLieHomologyAndQuasiFreeAlgebras §5.4`), 1662 (SR.1 Dependencies), with the prose at 79–81, 135–138 and 1313–1318 (“These are the unitary modules of … §5.4 … so that §5.4 identifies NondegMod H with the firm H-modules and makes it abelian”).

**Claim.** The roadmap now consumes §5.4 of CyclicHomologyLieHomologyAndQuasiFreeAlgebras, an open pull request by another author (mycaule, head 6dd4f41) that adds a new roadmap folder, so the citation is of a permitted kind; but that roadmap cannot precede this one in the merge order, so the edge is upward.

**Witness.** The merge order lists SmoothRepresentationsOfLocalGroups at line 25 and twelve roadmaps that cite it as a supplier between lines 52 and 148: AdelicAlgebraicGroups (52; its README line 143 says this roadmap supplies ring-valued Haar measures, SR.1.1), ArithmeticGaloisRepresentations (58; supplier table rows for SR.5.2 at its README 705–706), ArithmeticLocallySymmetricSpaces (59), FiniteFlatGroupsAndIntegralPadicHodgeTheory (65), NeronModelsAndSemistableAbelianVarieties (66), DiamondSixOperations (76), LocalGaloisDeformationRings (86), AutomorphicLFunctionsAndLocalFactors (94), AutomorphicSpectralTheory (96), GL2AutomorphicRepresentationsAndTransfer (100), ShimuraVarieties (105), EndoscopicTransferAndUnitaryTraceComparison (148). CyclicHomologyLieHomologyAndQuasiFreeAlgebras is not in the merge order; its Layer 5, the layer of §5.4, needs RefinedTraceMethods (its README 828–829: “KTheoryFiniteLocalFields §4.0 and RefinedTraceMethods §1.4 for 5.2; RefinedTraceMethods §4.18 … for 5.3”), and RefinedTraceMethods is at line 328, KTheoryFiniteLocalFields at line 90. The tool places it accordingly:

```text
candidate: CyclicHomologyLieHomologyAndQuasiFreeAlgebras is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
```

With the supplier inserted there (a scratch copy of the order, line 329) the dependency check of this README prints

```text
UPWARD: SmoothRepresentationsOfLocalGroups (#25) -> CyclicHomologyLieHomologyAndQuasiFreeAlgebras (#329) at README lines [528, 1322, 1662]
```

and `--movable` cannot repair it: moving this roadmap below line 329 would put it after its own consumers at lines 52–148. The worker's gate and the plain check print `0 problem(s)` only because the supplier's name resolves nowhere the tool reads (neither main nor the order), so the edge is dropped: 2262 edges counted against the real order, 2263 against the scratch order. The pull request's own merge-order paragraph shows the same inconsistency: it lists #792, #856, #871, #924, #931, #1037 and #1689, all consumers of this roadmap, before #2037 and before this pull request.

**Repair.** The notion moves down, as the brief prescribes for a supplier later in the order, and the move is recorded here. (1) Restore SR.1.3 as a self-contained target, as at the previous head: “Define NondegMod H … Prove that NondegMod H is a full abelian subcategory of H-modules with exact filtered colimits … ([Ber87] §1.1–1.2 and §1.8, pp. 3–4 and 8). *Needs:* the library vocabulary of this layer.” The two new facts may stay as this roadmap's own statements without a citation: a submodule of a nondegenerate module is nondegenerate, and the multiplication H ⊗_H M → M of a nondegenerate module is bijective with inverse m ↦ e ⊗ m for a local unit e of m (both computed below). (2) Delete the contract subsection at 528–534 and the Dependencies item at 1662. (3) In Scope (79–81) and the shared-interfaces paragraph (135–138), replace “From CyclicHomologyLieHomologyAndQuasiFreeAlgebras §5.4 it takes …” by a deferral in the consumer direction: unitary and firm modules over an arbitrary nonunital ring, left xst rings and the abelian category of their firm modules are stated by CyclicHomologyLieHomologyAndQuasiFreeAlgebras §5.4, later in the merge order, which records SR.1.3 as its idempotented instance; this roadmap proves the idempotented case itself. (4) The pull request description's depends-on list and merge-order chain then drop #2037 (outside the folder; not a finding of this report). Tested: the README of the previous head 4178a1e, which has no such edge, checked against the same scratch order prints `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`.

## R02 (P3) — `letI` in the signature of `SmoothRep.grothendieck`

**Location.** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean` 95: `∃ h : Abelian (SmoothRep A G), letI := h; IsGrothendieckAbelian.{u} (SmoothRep A G)`.

**Claim.** The gate's statement-hygiene rule forbids `letI`/`haveI` in a signature (gate at this head: `statement-hygiene=2 … FAIL`).

**Witness.** The gate line: “line 95: P3 `letI` in the signature of theorem `SmoothRep.grothendieck`; repair: use an instance binder or a named instance in the signature”.

**Repair.** Pass the instance explicitly: `∃ h : Abelian (SmoothRep A G), @IsGrothendieckAbelian.{u} (SmoothRep A G) _ h := sorry` (`IsGrothendieckAbelian` at the pin takes `[Abelian C]` as its last instance argument, `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean:70`). Tested on a scratch copy of the file with this line and the line of R03 changed: `lake env lean` exits 0 with the same 12 `sorry` warnings and nothing else. The README's `*Lean:*` mention at 1687 keeps the name and needs no change.

## R03 (P3) — `whittakerCoinvariants_one_dimensional` concludes `Nonempty (… ≃ₗ[ℂ] ℂ)`

**Location.** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean` 115–116.

**Claim.** The statement-hygiene rule forbids a theorem concluding `Nonempty (A ≃ B)` unless it is named `nonempty_*`.

**Witness.** The gate line: “line 115: P3 theorem `whittakerCoinvariants_one_dimensional` concludes `Nonempty (WhittakerCoinvariants …`; repair: state the canonical map and `IsIso` of it, or name the isomorphism as data; keep `Nonempty` only as a corollary named `nonempty_*`”.

**Repair.** State the dimension, which is what the name and the README (2292, “one-dimensional”) say: `Module.finrank ℂ (WhittakerCoinvariants (ρ.comp (TauCeti.upperUnitriangularGroup (Fin 2) F).subtype) ψ) = 1 := sorry`. Since `Module.finrank` is 0 on an infinite-dimensional module, `= 1` is exactly “finite-dimensional of dimension one”, the content of [BH06] 36.1. Tested in the same scratch copy as R02: elaborates at the pins, 12 `sorry` warnings, exit 0.

## Previous findings

The previous report (r6, at 4178a1e) was an acceptance with no findings of its own; its `## Previous findings` section recorded r5's R01–R04 as repaired, and the passages it checked (698–733, 531–533, 4571–4637 there) are untouched by this change.

## Verified sound

### The changed passages

**The cited text exists and says what the contract says.** At the supplier's open head (CyclicHomologyLieHomologyAndQuasiFreeAlgebras, pull request #2037, head 6dd4f41), `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md` 744–757 (“### 5.4 Firm modules”) defines unitary (`AM = M`) and firm (`A ⊗_A M → M` bijective) left modules over a nonunital ring, with Convention 8 at 132–135 making an `A`-module a module over `Unitization ℤ A` and `A ⊗_A M` the quotient of `A ⊗_ℤ M` by `ab ⊗ m − a ⊗ bm`; it states that firm modules are unitary, that `A` with local units is firm over itself, that `A` is left xst (“the class of unitary modules is closed under submodules”) if and only if every unitary module is firm, and that the firm modules then form an abelian category (González-Férez–Marín 2007). The contract at README 530–534 and the parenthesis at 1316 restate exactly these, including the definition of left xst. The supplier's Scope (50–53) and Downstream (835–838) name this roadmap's nondegenerate modules over an idempotented algebra as the instance and nothing else of this roadmap: no cycle through its Needs lines (its only roadmap suppliers are RefinedTraceMethods, KTheoryFiniteLocalFields, GeneralAlgebraicKTheory, AlgebraicKTheory, PerfectoidSpaces, NoncommutativeGeometry). After the R01 repair this remains consistent: the general notion is owned there, the idempotented instance here, one owner each.

**The mathematics of the identification (1313–1318)** is computed in the table below: nondegenerate = unitary for an idempotented H; the recovered A-action `a·m = (ae)m` is independent of the local unit, associative and commutes with H; H-linear maps between nondegenerate modules are A-linear; submodules of nondegenerate modules are nondegenerate (so H is left xst in the supplier's sense); every nondegenerate module is firm. The Ber87 citation kept at 1320–1321 was re-read: ber87 lines 100–109 (§1.1, printed p. 3) state that M(H) is abelian with direct limits, that filtered direct limits are exact and that products are the nondegenerate part of the set-theoretic product.

### Gate, dependency check, elaboration

Gate rerun on 3208d03: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=2 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`; the two hits are R02 and R03. `git diff --stat origin/main...HEAD` outside the folder is empty (the 618 files the change summary lists outside the folder are the merge of main, commit d4381fe4, not the pull request's own changes).

Dependency check as the brief gives it (real order, `--movable`):

```text
depcheck: 236 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line, for the reason given in R01: the new supplier is unknown to the tool. The candidate check of the supplier and the scratch-order check are quoted in R01.

Elaboration rerun because the pins moved with the merge of main (Mathlib f6090c709 → 1b1ccf4b0, Tau Ceti 358314d4a → 2fd255d99, toolchain v4.35.0-rc3 → v4.36.0-rc2): `lake env lean TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean` exits 0 with 12 `declaration uses sorry` warnings and nothing else. The file is byte-identical to the one r4–r6 read (`git diff 4178a1e HEAD` touches only README.md), so the 25 declarations, the headline list, the padding audit and the duplication audit of r4 stand. The three section binders the signature inventory flags as dropped (`[TopologicalSpace F]` from `Points`, `[TopologicalSpace G]` from `AbsolutelyIrreducible` and `IsGeneric`) are the same three r6 re-read at `Suggested.lean:125, 202, 206`: algebraic definitions whose bodies do not use the topology, with the theorems about them carrying it; correctly dropped.

### Seeded sample

None of the fifteen seeded targets falls in the five hunks (76–84, 132–141, 525–538, 1310–1326, 1660–1663): is-smooth (631), smooth-discrete-comparison (748), unit-pro-order (799), klingen-positive-hecke (1565), compact-generation (1797), derived-hecke-algebra (1869), geometric-lemma (2175), the “Check (which operator)” line (2230), compact-representations (2339), langlands-classification (2938), paired-unitary-parameter (3460), distinguished-cuspidal-types (3885), universal-whittaker (4319), wd-raw-parameters (4476), llc-family-conditional (4832). They are untouched since fa1d0be and keep the verification of the earlier full reviews. No locator in the changed lines is flagged unverified; the only sources the change cites are the supplier's §5.4 (verified above at its head) and [Ber87] (verified above).

### Computed adversarial pass

New rows for the changed statements; the rows for untouched statements are carried from the r6 report.

| Statement and line | Instances and computed values on the two sides | Result / change |
|---|---|---|
| NondegMod H = unitary modules over the nonunital ring H (1313–1315) | H unital, e = 1: nondegenerate = all modules = unitary (1·m = m). H = ⊕_{n∈ℕ} ℤ with local units e_N = (1,…,1,0,…): M = H is nondegenerate (m ∈ e_N M for N past its support); M = ∏_n ℤ coordinatewise: HM = ⊕ ≠ ∏, not unitary and not nondegenerate, both notions reject it. H = 0 (idempotented with e = 0): both classes are {0}. HM = M ⇔ M = ⋃ eM: m = Σ h_i m_i, e with e h_i = h_i gives em = m; conversely eM ⊂ HM. | Pass / — |
| Recovered A-action a·m = (ae)m (1315) | e, e′ local units of m, f a local unit of {e, e′}: fm = (fe)m = em = m, (ae)m = (afe)m = (af)(em) = (af)m = (ae′)m, independent of e. a·(b·m) = (ae)((be)m) = (a(e·be))m = (abe)m = (ab)·m since e(be) = b e² = be. h(a·m) = (h·ae)m = (a·he)m = (ah)m = a·(hm) (e″h = h for a local unit e″ of h). H unital: a·m = (a·1)m = am, the original action. H-linear f: f(a·m) = (ae)f(m) with e f(m) = f(em) = f(m), so f is A-linear. | Pass / — |
| H is left xst: submodules of nondegenerate modules are nondegenerate (1316) | N ⊂ M nondegenerate, n ∈ N: n = em for some m, so en = e²m = em = n ∈ HN; N = HN. Negative control outside the hypothesis: 2ℤ (no nonzero idempotent) on ℤ[1/2]: 2ℤ·ℤ[1/2] = ℤ[1/2] unitary, submodule ℤ has 2ℤ·ℤ = 2ℤ ≠ ℤ: not left xst, so the idempotented hypothesis is used. | Pass / — |
| Every nondegenerate module is firm (1317, the supplier's conclusion specialised) | Inverse m ↦ e ⊗ m (e a local unit of m): well defined, e ⊗ m = fe ⊗ m = f ⊗ em = f ⊗ m for f a local unit of {e, e′}; M → H ⊗_H M → M is m ↦ em = m; H ⊗_H M → M → H ⊗_H M is h ⊗ m ↦ hm ↦ e ⊗ hm = eh ⊗ m = h ⊗ m with eh = h. Firm ⇒ unitary (531–532): the image of the multiplication is RM, bijective forces RM = M. | Pass / — |
| Contract wording (530–534) against the supplier (744–752, Convention 8 at 132–135) | Unitary RM = M ✓; firm R ⊗_R M → M bijective ✓; modules over `Unitization ℤ R` ✓; firm ⇒ unitary ✓; left xst ⇔ every unitary module firm ✓; then firm modules abelian ✓; left xst defined as closure of unitary modules under submodules, restated at 1316 ✓. | Pass; direction of supply is R01 |
| Scope sentence “takes … and adds idempotented algebras, their principal projective generators and the Hecke-module equivalence” (79–81) | The supplier's §5.4 has no idempotented algebras, no principal projectives He, no Hecke-module equivalence (its Checks 760–764 and 5.5 Morita contexts only): the division of ownership is right. | Pass; the “takes” edge is R01 |

Carried from the r6 report (its new rows for *smooth-rep-abelian* and *wd-algebraic-composition* and the 173 rows it carried from r4 and r5), unchanged at this head since the diff touches none of them. Their line numbers at this head are those r6 lists plus the hunk offsets: +3 for lines 82–141 of r6, +6 for 142–536, +14 for 537–1326, +18 for 1327–1665, +19 beyond (checked on four labels: is-smooth 617 → 631, unit-pro-order 785 → 799, klingen-positive-hecke 1547 → 1565, compact-generation 1778 → 1797).

### Ownership and overlaps

`scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped by an open pull request, no cited id is defined only by an open revision. The closest roadmaps in vocabulary (SmoothRepresentationsOfLocalGroupsPartII #1815, ExoticMonoidalStructuresAndAbstractAutomorphicity #1737, ExceptionalThetaCorrespondencesForG2 #1736, EndoscopicTransferAndUnitaryTraceComparison #999, GL2AutomorphicRepresentationsAndTransfer #931) are consumers or Part II; none owns nondegenerate modules over idempotented algebras. The one new ownership question, firm modules over a general nonunital ring, is settled by R01's repair: CyclicHomologyLieHomologyAndQuasiFreeAlgebras owns the general notion and records SR.1.3 as its instance (its README 50–53, 835–838); this roadmap owns and proves the idempotented case. No declaration of `Suggested.lean` carries a fully qualified name of another readable roadmap.

## Not verifiable

- **[Tat79]**, J. Tate, *Number theoretic background*, PSPUM 33 (1979) Part 2: paywalled at the AMS (DOI 10.1090/pspum/033.2/546607), settled as `uncertified` in the manifest and cited by its locator; not cited by the changed lines.
- BH06, Mac, HM18 and Nak remain as in the earlier reports; none is cited by the changed passages.
- González-Férez–Marín 2007 (the xst theorem the supplier cites at its 752) is the supplier's source and was not opened here: this roadmap's use of it is removed by R01, and the idempotented case is computed above without it.

## Source issues

- none
