# Review of SmoothRepresentationsOfLocalGroups (pull request #1688 at 1b376be)

**Verdict:** needs changes

Incremental re-review of the 60 lines changed since 3208d03. The change repairs the three findings of the previous report: the upward supplier CyclicHomologyLieHomologyAndQuasiFreeAlgebras §5.4 is gone from the contract subsections, the SR.1.3 `*Needs:*` line and the SR.1 Dependencies, and SR.1.3 *locally-unital-algebra* is self-contained again with the two facts it had taken from the supplier now stated as its own (README 1302–1313) and two new Checks (1338–1343); Scope (78–85) and the shared-interfaces paragraph (135–138) now defer the general nonunital theory in the consumer direction. `Suggested.lean` changes two lines: `SmoothRep.grothendieck` passes the `Abelian` instance explicitly (95) and `whittakerCoinvariants_one_dimensional` concludes `Module.finrank ℂ … = 1` (115–116), with the README's `*Lean:*` note at 2291–2293 adjusted. All three repairs are correct; one of the two new Checks is false for the zero ring (R01). The gate passes, the dependency check prints no problem against the real order and against a scratch order with the former supplier inserted, and the file elaborates at the pins with `sorry` as the only warning. Nothing outside the folder differs from `origin/main`.

## R01 (P3) — the tensor Check of SR.1.3 fails for A = 0

**Location.** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` 1338–1341: “For `H = ⊕_{n ∈ ℕ} A` with componentwise product, local units `u_N = Σ_{k ≤ N} ε_k` and M = H, … in H ⊗_A H these two tensors differ for N > n”.

**Claim.** The bullet is stated for every commutative A, and its third clause is false when A = 0.

**Witness.** For A = 0, H = ⊕_n A = 0, so H ⊗_A H = 0 and u_N ⊗ ε_n = 0 = ε_n ⊗ ε_n for every N and n: the two tensors do not differ. For A ≠ 0 the clause holds: H is free over A on the ε_k, H ⊗_A H is free on the ε_i ⊗ ε_j, and u_N ⊗ ε_n − ε_n ⊗ ε_n = Σ_{k ≤ N, k ≠ n} ε_k ⊗ ε_n is a sum of N ≥ 1 distinct basis vectors, nonzero since 1 ≠ 0 in A. The neighbouring bullet at 1334–1336 states the same carrier with the hypothesis “For `A ≠ 0`” and treats A = 0 separately, so the list's own standard is to exclude the zero ring where it matters.

**Repair.** Begin the bullet “For `A ≠ 0` and `H = ⊕_{n ∈ ℕ} A` with componentwise product, …” (the first two clauses, the inverse ε_n ↦ ε_n ⊗ ε_n and the identity in H ⊗_H H, hold for every A and need no hypothesis). Tested on the instance: with A ≠ 0 the difference computed above is nonzero, and the conclusion drawn, that the relations hh′ ⊗ m − h ⊗ h′m are needed for the inverse to be well defined, follows since u_N and ε_n are both local units of ε_n.

## Previous findings

- R01 — repaired: README 78–85 and 135–138 now defer “unitary and firm modules over an arbitrary nonunital ring, left xst rings and the abelian category of their firm modules” to “the later roadmap CyclicHomologyLieHomologyAndQuasiFreeAlgebras §5.4” and say this roadmap cites no section of it; the contract subsection, the `*Needs:*` item and the SR.1 Dependencies item are deleted; SR.1.3 states the submodule and multiplication facts itself (1302–1313). The repair introduced R01 of this report (one new Check).
- R02 — repaired: `Suggested.lean` 95 reads `∃ h : Abelian (SmoothRep A G), @IsGrothendieckAbelian.{u} (SmoothRep A G) _ h`; the gate's statement-hygiene count is 0.
- R03 — repaired: `Suggested.lean` 115–116 reads `Module.finrank ℂ (WhittakerCoinvariants (ρ.comp (TauCeti.upperUnitriangularGroup (Fin 2) F).subtype) ψ) = 1`; README 2291–2293 says the theorem is stated as `V_{U,ψ}` having ℂ-dimension one.

## Verified sound

### The changed passages

**SR.1.3 is self-contained and its locator supports it.** Every statement of the target (1302–1314) is now the roadmap's own or [Ber87]'s: ber87 lines 96–99 (§1.1, printed p. 3) define nondegenerate modules by HM = M, equivalently M = lim eM; lines 100–109 state that M(H) is abelian with direct limits, that filtered direct limits are exact and that products are the nondegenerate part of the set-theoretic product; lines 111–116 (§1.2) state eM = Hom_H(He, M), that He is a finitely generated projective object and that the He form a system of projective generators; lines 306–317 (§1.8, printed p. 8) identify the central algebra of M(H) with the endomorphisms of H commuting with both actions. The three facts without a locator (the A-structure is determined, submodules of nondegenerate modules are nondegenerate, H ⊗_H M → M is bijective) are elementary and computed in the table below. The `*Needs:*` line (1313–1314) names only the library vocabulary of the layer.

**The deferral is in the consumer direction and the mention is not an edge.** CyclicHomologyLieHomologyAndQuasiFreeAlgebras is not in the merge order (ORDER.txt lists this roadmap at line 25; RefinedTraceMethods, that roadmap's last supplier, at 330), so “later roadmap” is right once it is inserted. Its open head (pull request #2037) still records this roadmap's SR.1.3 as the instance of its §5.4 (its README 52 and 835–836, “### 5.4 Firm modules” at 744), so one owner each: the general notion there, the idempotented case here. Its Downstream paragraph (835) still says this roadmap “consumes 5.4”, which this head no longer does; that is a sentence of the other pull request, not of this folder, and the ownership division it describes is unchanged. The pull request description's merge-order chain still ends “#2037 → this pull request”; it is outside the folder and the worker regenerates it.

**Lean statements.** `IsGrothendieckAbelian` at the Mathlib pin is `class IsGrothendieckAbelian [Abelian C] : Prop` (`Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean:70`), so `@IsGrothendieckAbelian.{u} (SmoothRep A G) _ h` passes the category instance and the chosen `Abelian` instance in the right positions; the elaborated type in `scratch/signatures.md` is `∃ h, IsGrothendieckAbelian.{u_1, u_1, u_1+1} (SmoothRep A G)` with the eight binders of the README statement (commutative ring, topological group, locally compact, totally disconnected, Hausdorff). `Module.finrank ℂ (WhittakerCoinvariants …) = 1` is “finite-dimensional of dimension one” since `Module.finrank` is 0 on an infinite-dimensional module; the elaborated type keeps `IsOpen ψ.ker`, `ψ ≠ 1`, `IsSmooth ρ`, `ρ.IsIrreducible` and `¬ Module.Finite ℂ V`, the hypotheses of [BH06] 36.1 as the README states them at 2280–2286. Neither statement closes by one tactic (an existence of an `Abelian` structure, and a finrank equality on a quotient carrier); the padding audit of r4 stands for the other 23 declarations, which the diff leaves byte-identical.

### Gate, dependency check, elaboration

Gate rerun on 1b376bee: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. `git diff --stat origin/main...HEAD` outside the folder is empty.

Dependency check as the brief gives it (real order, `--movable`):

```text
depcheck: 236 roadmaps, 2266 edges, 0 problem(s)
```

The same check against a scratch copy of the order with CyclicHomologyLieHomologyAndQuasiFreeAlgebras inserted after RefinedTraceMethods (line 331), the test that produced the UPWARD line of the previous report, now prints `depcheck: 236 roadmaps, 2266 edges, 0 problem(s)`: the Scope mention at README 82 is not read as a supplier edge.

Elaboration: `lake env lean TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean` exits 0 in 15 s with 12 `declaration uses sorry` warnings (lines 92, 106, 139, 148, 161, 171, 186, 242, 260, 281, 331, 348) and nothing else. The signature inventory's three dropped section binders (`[TopologicalSpace F]` from `Points`, `[TopologicalSpace G]` from `AbsolutelyIrreducible` and `IsGeneric`) are the same three r6 and r7 read: algebraic definitions whose bodies do not use the topology; correctly dropped.

### Seeded sample

None of the fifteen seeded targets falls in the six hunks (78–85, 135–138, 525, 1302–1343, 1660–1663, 2291–2293): is-smooth (623), smooth-discrete-comparison (740), unit-pro-order (791), klingen-positive-hecke (1565), compact-generation (1796), derived-hecke-algebra (1868), geometric-lemma (2174), the “Check (which operator)” line (2229), compact-representations (2339), langlands-classification (2938), paired-unitary-parameter (3460), distinguished-cuspidal-types (SR.5), universal-whittaker (4319), wd-raw-parameters (4476), llc-family-conditional (4832). They keep the verification of the earlier full reviews. The only source the changed lines cite is [Ber87], verified above at ber87 lines 96–121 and 306–317; no locator in the changed lines is flagged unverified.

### Computed adversarial pass

New rows for the changed statements; rows for untouched statements are carried from the r7 report (its six new rows) and, through it, from r6, r5 and r4.

| Statement and line | Instances and computed values on the two sides | Result / change |
|---|---|---|
| The A-structure of a nondegenerate module is determined by its H-structure, a·m = (ae)m (1306–1308) | Independence of e: e, e′ local units of m, f a local unit of {e, e′}: (ae)m = (afe)m = (af)(em) = (af)m = (ae′)m. Compatibility with H: e a local unit of h, then e(hm) = hm, so a·(hm) = (ae)(hm) = (aeh)m = (ah)m. Unit and associativity: 1·m = em = m; a·(b·m) = (ae)((be)m) = (abe)m. Uniqueness: any compatible A-structure has a·m = a·(em) = (ae)m. H unital: a·m = am. H = 0: M = 0, one structure. | Pass / — |
| Same category as A-modules or as modules over the ring H (1308–1309) | Objects: by the row above each nondegenerate ring-module carries exactly one compatible A-structure. Morphisms: f H-linear, e a local unit of m: f(a·m) = f((ae)m) = (ae)f(m) = a·f(m) since e f(m) = f(em) = f(m); so H-linear = A-linear-and-H-linear. | Pass / — |
| Submodules of nondegenerate modules are nondegenerate (1309–1310) | N ⊂ M, n ∈ N, e a local unit of n: n = en ∈ HN, so HN = N. Negative control (1342–1343): 2ℤ on ℤ[1/2]: 2·(x/2) = x gives 2ℤ·ℤ[1/2] = ℤ[1/2]; submodule ℤ: 2ℤ·ℤ = 2ℤ ∌ 1. 2ℤ has no idempotent e with 2e = 2 (e² = e in 2ℤ forces e = 0), so it is not idempotented and the hypothesis is used. | Pass / — |
| H ⊗_H M → M bijective with inverse m ↦ e ⊗ m (1310–1313) | Well defined: e ⊗ m = fe ⊗ m = f ⊗ em = f ⊗ m by the relation hh′ ⊗ m = h ⊗ h′m with h = f, h′ = e. M → H ⊗_H M → M: m ↦ e ⊗ m ↦ em = m. H ⊗_H M → M → H ⊗_H M: h ⊗ m ↦ hm ↦ e ⊗ hm = eh ⊗ m = h ⊗ m for e a local unit of h. Zero module: both sides 0. H unital: H ⊗_H M = M by 1 ⊗ m ↦ m. | Pass / — |
| Check: H = ⊕_n A, inverse ε_n ↦ ε_n ⊗ ε_n, u_N ⊗ ε_n = ε_n ⊗ ε_n in H ⊗_H H, differ in H ⊗_A H (1338–1341) | ε_n is its own local unit, so the inverse gives ε_n ⊗ ε_n. In H ⊗_H H: u_N ⊗ ε_n = u_N ⊗ ε_n ε_n = u_N ε_n ⊗ ε_n = ε_n ⊗ ε_n for N ≥ n. In H ⊗_A H (free on ε_i ⊗ ε_j): u_N ⊗ ε_n − ε_n ⊗ ε_n = Σ_{k ≤ N, k ≠ n} ε_k ⊗ ε_n, nonzero for N > n iff A ≠ 0. A = 0: both tensors are 0. | Fails at A = 0 / R01 |
| Scope deferral (78–85) and shared-interfaces paragraph (135–138) | Supplier head #2037, README 744–757: §5.4 defines unitary and firm modules over a nonunital ring, left xst rings, their abelian category; no idempotented algebras, no He, no Hecke-module equivalence (its Checks 760–764). Its 52 and 835–836 name SR.1.3 as the instance. Order: this roadmap at 25; the supplier's last supplier RefinedTraceMethods at 330, so “later” holds at insertion. | Pass / — |
| `SmoothRep.grothendieck` form (Lean 92–95) | Pin: `IsGrothendieckAbelian [Abelian C]` (`GrothendieckCategory/Basic.lean:70`), explicit args `C`, category instance, `Abelian` instance. Elaborated type: `∃ h, IsGrothendieckAbelian.{u_1,u_1,u_1+1} (SmoothRep A G)` under the eight binders. G trivial: SmoothRep = Rep A G, Grothendieck (Mathlib `ModuleCat`-like); G discrete infinite: smooth = all representations, still Grothendieck; both consistent with the statement. | Pass / — |
| `whittakerCoinvariants_one_dimensional` form (Lean 106–116) | finrank = 1 ⇔ finite-dimensional of dimension 1 (finrank of an infinite-dimensional module is 0, so no false positive). One-dimensional irreducible V (excluded by `hinf`): V_{U,ψ} = 0 for ψ ≠ 1 since U acts trivially on V and through ψ⁻¹ on the twist, finrank 0 ≠ 1; the hypothesis is needed, as README 2282–2283 says. ψ = 1 (excluded by `hψ1`): V_U is the Jacquet module, dimension 2 for an irreducible principal series, ≠ 1. Direct sum of two generic irreducibles (excluded by `hi`): dimension 2. | Pass / — |

Carried from the r7 report, unchanged at this head: the six rows of r7 for the previous head's §5.4 identification (their mathematics is now this roadmap's own statements, re-verified in the rows above) and the 173 rows r7 carried from r4–r6. Their line numbers at this head are those of r7 shifted by the hunk offsets: +3 for lines 76–134 of r7, 0 for 135–527, −8 for 535–1312, −6 for 1313–1340, 0 for 1341–1663, −1 for 1664–2290, +1 beyond (checked on four labels: klingen-positive-hecke 1565 → 1565, compact-generation 1797 → 1796, geometric-lemma 2175 → 2174, universal-whittaker 4319 → 4319).

### Ownership and overlaps

`scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped by an open pull request, no cited id is defined only by an open revision. The closest roadmaps in vocabulary (SmoothRepresentationsOfLocalGroupsPartII #1815, ExceptionalThetaCorrespondencesForG2 #1736, ExoticMonoidalStructuresAndAbstractAutomorphicity #1737, EndoscopicTransferAndUnitaryTraceComparison #999, GL2AutomorphicRepresentationsAndTransfer #931) are consumers or Part II; none owns nondegenerate modules over idempotented algebras. The one ownership question the previous round raised is settled as its repair prescribed: CyclicHomologyLieHomologyAndQuasiFreeAlgebras (#2037) owns firm modules over a general nonunital ring and records SR.1.3 as the idempotented instance; this roadmap states and proves the idempotented case with no citation of it. No declaration of `Suggested.lean` carries a fully qualified name of another readable roadmap. The 13 Lean names `scratch/citations.md` lists as found nowhere are, as in the earlier reports, the README's own names for targets not in `Suggested.lean` (none is backticked as a declaration of this file: the gate's `readme-ids-missing=0`), and none is in a changed line.

## Not verifiable

- **[Tat79]**, J. Tate, *Number theoretic background*, PSPUM 33 (1979) Part 2: paywalled at the AMS (DOI 10.1090/pspum/033.2/546607), settled as `uncertified` in the manifest and cited by its locator; not cited by the changed lines.
- **[BH06]** 36.1 (the locator of `whittakerCoinvariants_one_dimensional`, README 2280–2283): not in the sources cache and not legally readable here, as in the earlier reports; the change touches only the Lean form of the statement, not its locator or hypotheses.
- Mac, HM18 and Nak remain as in the earlier reports; none is cited by the changed passages.

## Source issues

- none
