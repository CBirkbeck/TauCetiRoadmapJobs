# Review of RootSystemsPartII (pull request #1731 at c2550ee)

**Verdict:** accepted

Incremental re-review of the 47 lines changed since bdea2b9 (25 insertions, 22 deletions, all in `TauCetiRoadmap/RootSystemsPartII/README.md`; `Suggested.lean` unchanged; nothing changed outside the folder). The change repairs both findings of the previous report: §3.3 now consumes the component decomposition from RootSystems §6.1 and keeps only the three facts that section does not state, and the Tau Ceti base-change path is corrected. No finding remains.

## Previous findings

- R01 — repaired: `README.md` line 13 "is RootSystems §6.1, consumed in §3.3. To it §3.3 adds only the base and root form of a restricted component pairing, the permutation of components induced by a based automorphism, and the restriction of a component-fixing power"; §3.3 (lines 243–283) opens with "Consume the decomposition … from RootSystems §6.1", the API bullets state only the restricted base, Cartan block, root-form restriction, induced permutation and restriction of σᶜ; *Needs:* and Layer 3 Dependencies name RootSystems §6.1; line 7 now says RootSystems stops at Layer 6 and line 57 says §6.1 is consumed and no other target is an input.
- R02 — repaired: line 53 cites `TauCeti/LinearAlgebra/RootSystem/BaseChange/Pi.lean`; at the pinned Tau Ceti 2fd255d9 that file holds `rootPairingBaseChange` (line 127), `isCrystallographic_rootPairingBaseChange` (193), `pairingIn_rootPairingBaseChange` (202), `isReduced_rootPairingBaseChange` (210), `rootPairingBaseChangeBase` (238) and `cartanMatrix_rootPairingBaseChangeBase` (264).

## Verified sound

### Gate, dependency check and elaboration

**The gate**, rerun on this head with the targeted build:

    gate RootSystemsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

**The dependency check** (`--movable`, against the merge order and main 5b506d94):

    depcheck: 238 roadmaps, 2321 edges, 0 problem(s)

No UPWARD or CYCLE line. RootSystems is on main and its Scope (lines 39–42) names RootSystemsPartII §3.3 as the consumer of §6.1, so the new edge points downward. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/RootSystemsPartII/Suggested.lean` took 13.8 s: 10 warnings, all `declaration uses sorry` (lines 35, 95, 113, 125, 142, 154, 168, 182, 204, 230), 0 errors. The file is byte-identical to the one the previous review read.

**Signatures.** `#check @name` for all 15 declarations (plus the 8 structure fields) in one scratch file importing the built module; after stripping whitespace and the namespace prefix the 15 types are identical to the worker's elaborated list. No section binder is lost: every theorem carries `[Finite ι]`, its `IsRootSystem`/`IsReduced`/`IsCrystallographic` instances and the explicit `hbase` hypothesis.

**One-tactic probe.** Every `sorry` replaced by `first | simp | rfl | infer_instance | aesop | decide` on a scratch copy: all 10 theorems fail (errors at lines 42, 106, 119, 136, 147, 162, 176, 197, 224, 251). No padding.

### The changed passages

**RootSystems on main (5b506d94; its README unchanged since bebc607, the copy the previous review read).**

- Line 7's layer list matches the headings at lines 428, 614, 685, 804 ("coefficient reflections and the greatest root"), 905 ("root automorphisms and the based complement") and 1035 ("invariant metrics and root lengths"); §6.1 is "Irreducible components" (line 1037).
- Line 57's description of §6.1 matches its text (lines 1039–1053): components are the connected components of the graph on b.support with an edge where the Cartan entry is nonzero; component spaces are the real spans of their simple roots with the restricted pairing; the bullets prove the internal direct sum with each root in exactly one component, irreducibility of the restricted pairings, base independence and transport by any root-pairing equivalence, and orthogonality under every positive-definite invariant form, with Milne C.23 (p. 612, line 25102) and C.55 (p. 625, line 25585).
- What §3.3 keeps is not in §6.1: the coroot side E′_K and the simple base of support K with Cartan matrix the K-block; the root form restricting with no factor; the induced permutation of components being the index permutation on simple indices; the restriction of a component-fixing power of σ to a based automorphism of P_K. §6.1 does not mention bases of components, Cartan blocks, the root form or automorphism powers.
- Line 57's "based subgroup of RootSystems §5.1" is `basedAut` at line 909; "marked Coxeter presentation of RootSystems §2.1" is at lines 616–625. Neither is consumed, as the line says.

**Library citations added or changed, at Mathlib 1b1ccf4b and Tau Ceti 2fd255d9.**

- `RootPairing.toInvariantForm`, `Mathlib/LinearAlgebra/RootSystem/Finite/Nondegenerate.lean` line 95: `[P.IsAnisotropic] : P.InvariantForm` with `form := P.RootForm`, in a section with `[Fintype ι] [CommRing R]`. The README's "anisotropic pairing with a `Fintype` index type" is exact.
- `RootPairing.instIsAnisotropicOfIsCrystallographic`, same file line 90: `[CharZero R] [P.IsCrystallographic]`. The README's "crystallographic pairing over a characteristic-zero ring" is exact.
- `RootPairing.InvariantForm`, `Mathlib/LinearAlgebra/RootSystem/RootPositive.lean` lines 50–55: fields `form`, `symm`, `ne_zero` (form at each root with itself nonzero), `isOrthogonal_reflection`. The README's gloss lists exactly these.
- `RootPairing.posRootForm_rootFormIn_posDef`, `Finite/Nondegenerate.lean` line 209: `(P.RootFormIn S).toQuadraticMap.PosDef` on the S-root span, with the ordered-algebra and `FaithfulSMul` hypotheses the untouched contract line already states; by the Conventions' spanning hypothesis the real root span is E.
- `RootPairing.flip` (`Defs.lean` line 129) and `RootPairing.Base.flip` (`Base.lean` line 173, `P.flip.Base`); the flip keeps `IsRootSystem` (`Defs.lean` line 148), `IsReduced` (`Reduced.lean` line 202, needs `IsTorsionFree R N`, true over ℝ) and `IsValuedIn ℤ` (`IsValuedIn.lean` line 71), so RootSystems §6.1 applies to it under its own hypotheses.
- `RootPairing.Base.cartanMatrix_nondegenerate`, `CartanMatrix.lean` line 173: `[P.IsRootSystem] [P.IsCrystallographic]` in a section with `[CharZero R] [IsDomain R] [Finite ι]`.
- `RootPairing.Hom.pairing`, `Hom.lean` line 79: `Q.pairing (f.indexEquiv i) (f.indexEquiv j) = P.pairing i j`, the statement the proof route uses.
- `RootPairing.pairing_eq_zero_iff` is still cited (line 47) and its use is now only the symmetry of the component graph, as the line says.
- The two names dropped from the contracts, `RootPairing.Base.IsPos.induction_on_reflect` and `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix`, occur nowhere else in the README (grep: 0 hits); RootSystems §6.1's *Needs:* line carries the second.

**The proof route of §3.3** was checked step by step: the flip has the transposed Cartan matrix, whose graph is the same graph; §6.1 on the flip places each coroot in one coroot component; vanishing Cartan entries between components make that coroot vanish on the other component spaces; ⟨α, α∨⟩ = 2 forces the coroot's component to be the root's block; the K-block of a nonsingular block-diagonal matrix is nonsingular; a root in E_K that is a signed ℕ-combination of all simple roots has zero coefficients outside K by independence; the terms of the root form with k ∉ Φ_K vanish on E_K × E_K; a `Hom` sends αᵢ to the root at σ(i) and preserves pairings; a component-fixing power preserves E_K, E′_K (the coweight map is contravariant, so it carries E′_σK to E′_K, which is E′_K when σᶜK = K) and Φ_K.

### Sources

- Milne17 line 25102 (C.23, printed p. 612): direct sums and indecomposability, with the decomposition unique. Line 25585 (Proposition C.55, printed p. 625, running head at line 25580): the Coxeter graph is connected iff the system is indecomposable; its proof (lines 25590–25594) uses orthogonality of roots iff n(α,β)n(β,α) = 0, which is the edge criterion of the component graph. Both support the §3.3 citation as written and are the locators RootSystems §6.1 uses.
- The other sampled targets (§§1.1, 1.2, 2.1, 2.2, 2.3, 3.1, 3.2, 3.4, 4.1–4.4) are untouched by this diff; the previous reports' readings of Rap00, Stem08, KZ25 and Milne17 carry forward.

### Ownership and overlaps

- The overlaps listing reports no open pull request changing this roadmap, no dropped id cited here and no id that only an open revision defines; the citations listing finds every cross-roadmap citation and Lean name.
- The only object this change touches whose ownership could be shared, the component decomposition, now has one owner (RootSystems §6.1 on main) and one consumer (§3.3 here), in both roadmaps' Scope sections.

### Adversarial table

Rows 1–38 are carried from the previous report, PRREVIEW-RootSystemsPartII~4 (itself carrying 1–33 from ~3, ~2 and ~1); the statements and Lean they cover are unchanged at this head. Rows 39–46 are computed for the changed passages.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1–38 | §§1.1–4.4, conventions, `foldedIndices`, headline carriers at the pins, connected-diagram irreducibility, base-change contract | as in PRREVIEW-RootSystemsPartII~4 | as in that report (A₂ RootForm(α₁,α₂) = −6, RootForm(α₁,α₁) = 12; A₁ ⊕ A₁ RootForm(α₁,α₂) = 0; 3-cycle factor 24 = 3·8; A₄ reversal 6 positive orbits, 4 distinct positive sums) | unchanged | none |
| 39 | §3.3 restricted root form "with no factor" | A₁ ⊕ A₁, K = {1} | P: RootForm(α₁,α₁) = 2² + (−2)² + 0 + 0 = 8. P_K on ℝα₁ with coroots ±α₁∨: 4 + 4 = 8. Rescaling by the root-count ratio 4/2 would give 16; A₂ one component gives the same values −6 and 12 as P | equal, no factor | none |
| 40 | §3.3 coroot statement and perfectness of E_K × E′_K | A₁ ⊕ A₁; A₂ | α₂∨ vanishes on E_{1} = ℝα₁ (entry a₁₂ = 0), so pairing E_{1} with all of E∨ has a kernel; K-block (2) is nonsingular. A₂: (α₁+α₂)∨ = α₁∨ + α₂∨ lies in the single coroot component; K-block is the full matrix, det 3 | as stated | none |
| 41 | §3.3 induced permutation = index permutation on simple indices | A₁ ⊕ A₂ reversal (1)(2 3); A₁ ⊕ A₁ swap (1 2) | reversal: components {1}, {2,3} both mapped to themselves, induced permutation identity while index permutation is not; restricts to reversal on {2,3} and identity on {1}. Swap: {1} ↦ {2}, ℝα₁ ↦ ℝα₂, square = identity. Any based automorphism of A₁ ⊕ A₂ fixes both components since blocks have sizes 2 and 6 | as stated | none |
| 42 | §3.3 component-fixing power restricts to a based automorphism | D₄ ⊕ D₄ with σ(x₁,x₂) = (t x₂, x₁), t = triality | σ²(x₁,x₂) = (t x₁, t x₂): restriction to component 1 is t, order 3; σ³(x₁,x₂) = (t² x₂, t x₁) ≠ id, σ² ≠ id, σ⁶ = id, so ord σ = 6 | as stated | none |
| 43 | §3.3 flipped pairing has the same component graph | B₂ (a₁₂ = −2, a₂₁ = −1); A₁ ⊕ A₁ | transposed entries −1, −2: both nonzero, one edge either way. A₁ ⊕ A₁: entries 0, 0 both ways, no edge. Symmetry of "aᵢⱼ ≠ 0" is `pairing_eq_zero_iff` over ℝ (`NeZero 2`, domain, torsion-free) | same graph | none |
| 44 | contract: `toInvariantForm` on the root form, anisotropy from crystallographic | hypotheses at the pin | `[Fintype ι] [CommRing R] [P.IsAnisotropic]`; instance needs `[CharZero R] [P.IsCrystallographic]`; README states Fintype, anisotropic, characteristic zero, crystallographic | exact | none |
| 45 | line 57: RootSystems §6.1 supplies the five listed facts | text of §6.1 on main, lines 1039–1053 | direct sum ✓; each root in exactly one component ✓; restricted pairings irreducible ✓; transport by any root-pairing equivalence ✓; orthogonality under every positive-definite invariant form ✓; same hypotheses (finite reduced crystallographic spanning real, base) | matches | none |
| 46 | line 53: Tau Ceti base-change path | `git ls-tree 2fd255d9 TauCeti/LinearAlgebra/RootSystem/BaseChange/` | `Basic.lean`, `Pi.lean`; six cited names at `Pi.lean` lines 127, 193, 202, 210, 238, 264 | path correct | none |

### Remark on untouched text (no change requested)

RootSystems' downstream list (its line 1164) still says this roadmap consumes its §2.1 and §§5.1–5.2; this README's line 57 says it consumes neither. That is a statement in RootSystems' text, not an edge missing here.

## Not verifiable

- none. Milne17 was read in the cache; RootSystems, ReductiveGroups and ReductiveGroupsPartII on main; both libraries at the pins.

## Source issues

- none
