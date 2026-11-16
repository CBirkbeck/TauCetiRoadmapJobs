# GATE-K2SymbolsBrauerPartII~3: answers to human review

One unanswered comment, making one point (H01).

## H01 (mycaule) — answered

The overlap is real but sits entirely in objects this roadmap consumes from the pins, not in anything it owns. lean-pool's `BrauerGroupNew` (Brauer group of a field, central simple algebras, Wedderburn, Skolem–Noether, the double centralizer, crossed products for a Galois 2-cocycle, Br ≅ H², Br(ℝ), Azumaya algebras) corresponds here to Mathlib `BrauerGroup`/`IsAzumaya`, Tau Ceti `TauCeti.BrauerGroup.instCommGroup`, the crossed-product files and `TauCeti.brauerCohomologyEquiv`. Its `CrossProductAlgebra.lean` defines no cyclic or symbol algebra, quaternion algebra, K₂ or Hilbert symbol. What this roadmap owns is the presented symbol algebra `SymbolAlgebra` with its splitting and matrix-corner theorems, `conicSymbol`, and the K₂ dictionaries, and none of these appear there. Suppliers are only Mathlib, Tau Ceti and roadmaps, so lean-pool is not cited.

The point did expose a gap: the README consumed "the existing Brauer carrier" without naming it. Fixed in `TauCetiRoadmap/K2SymbolsBrauerPartII/README.md`:
- **Line 56 (new first sentence).** Names Mathlib `BrauerGroup` (`Mathlib/Algebra/BrauerGroup/Defs.lean:100`) and the group law `TauCeti.BrauerGroup.instCommGroup` (`Algebra/BrauerGroup/Group.lean:174`, on `BrauerGroup.{u, u}`) as the home of the symbol-algebra and crossed-product classes.
- **Line 58.** "sends H²(F,μ_m) to Br(F)" → Br(F) is named as `TauCeti.ClassFieldTheory.Br F` = H²(G_F,(Fˢ)ˣ), the actual target of `h2MuToBr` (`NumberTheory/ClassFieldTheory/Brauer/Torsion.lean:67`). A new sentence cites `TauCeti.ClassFieldTheory.brauerGroupEquivBr` (`NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Basic.lean:55`) as the identification of the two carriers: it is `brauerExplicitH2Equiv` followed by `unitsRepH2Equiv`.
- **Line 191 (§1.4).** "export … its algebraic Brauer class through the existing `brauerCohomologyEquiv`" → "through the existing `brauerGroupEquivBr`". β_ζ lands in `Br F`. `brauerCohomologyEquiv` lands in the other H² model, `continuousCohomology 2 (ofDiscreteModule ℤ (AbsoluteGaloisGroup K) (UnitsCoeff K))`, so the §1.4 API bullet "the specified Brauer equivalence sends the exported algebraic class to β_ζ(x)" did not typecheck as written. QuadraticFormInvariants on main uses the same `brauerGroupEquivBr` bridge (its README line 1788).

`Suggested.lean` is unchanged.

## Adversarial pass on the changed sentences

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `BrauerGroup K` = finite-dimensional central simple K-algebras modulo Brauer equivalence | K = ℂ; K = ℝ | `CSA` carries `isCentral`, `isSimple`, `fin_dim` (Defs.lean:41–47); quotient at :100. Over ℂ every CSA is some M_n(ℂ), so the group is trivial; over ℝ the classes are [ℝ] and [ℍ] | holds | none |
| Group law: tensor product, identity [K], inverse [Aᵒᵖ] | ℍ over ℝ | `mul` is `CSA.tensorProduct`, `one` is `CSA.base K` (= K, Basic.lean:78), `inv` is `CSA.op` (Group.lean:174–178). [ℍ]·[ℍ] = [M₄(ℝ)] = 1 and [ℍ]⁻¹ = [ℍᵒᵖ] = [ℍ], since ℍ ≅ ℍᵒᵖ by conjugation; order 2 either way | consistent | none |
| Universe: classes in `BrauerGroup.{u, u}` | `SymbolAlgebra F m ζ a b` with F : Type u | `RingQuot` of `FreeAlgebra F (Fin 2)` lies in Type (max u 0) = Type u, so its class is formed in the universe the instance requires | holds | none |
| Symbol-algebra classes exist only under §2.2's hypotheses | m = 1; a = 0 | m = 1, ζ = 1: X = a, Y = b, commutative of dimension 1, so the algebra is F and its class is the identity. a = 0: X^m = 0 is a nonzero nilpotent, the algebra is not simple, no class; §2.2 assumes a, b units | holds (sentence says "the classes … below", which are formed only where §2.2 proves central simplicity) | none |
| `h2MuToBr : H²(F,μ_m) →+ Br F`, injective when m is invertible | m = 1; m invertible | Target `Br F` (Torsion.lean:67); injectivity is `h2MuToBr_injective (hn : IsUnit (n : F))` (:114). m = 1: source is 0, map is 0, injective | holds | target named |
| `brauerGroupEquivBr` agrees with `brauerCohomologyEquiv` after the change of model | definitions | `brauerGroupEquivBr = brauerExplicitH2Equiv.trans unitsRepH2Equiv` (CentralSimple/Basic.lean:55–56). `brauerCohomologyEquiv = brauerExplicitH2Equiv.trans explicitH2AddEquivContinuousCohomology` (Comparison.lean:274–277). So `brauerGroupEquivBr = (explicitH2AddEquivContinuousCohomology.symm.trans unitsRepH2Equiv) ∘ brauerCohomologyEquiv` | holds | new sentence |
| §1.4 bullet: the specified equivalence sends the exported class to β_ζ(x) | m = 2, ζ = −1, x = {a,b}; m = 1 | Types now match: β_ζ(x) ∈ `Br F`[m] and `brauerGroupEquivBr` lands in `Br F`. m = 2: the exported class is the quaternion class (a,b)_F; after the model change it agrees with `brauerCohomologyEquiv_quaternionClass` (Check at README line 409). m = 1: β = 0 and the class is [F] = 1 | holds | `brauerCohomologyEquiv` → `brauerGroupEquivBr` at line 191 |

## Other checks

- **Pinned names.** Every declaration named in the new text exists at the pins with the namespace written: `BrauerGroup` (top level), `TauCeti.BrauerGroup.instCommGroup`, `TauCeti.ClassFieldTheory.Br`, `TauCeti.ClassFieldTheory.h2MuToBr`, `TauCeti.ClassFieldTheory.brauerGroupEquivBr`, `TauCeti.brauerExplicitH2Equiv`.
- **Elaborated signatures.** `Suggested.lean` is unchanged, so its elaborated types are those in the provided signatures list (no lost section binders). No scratch `#check` file was run: the Lean file did not change, and the brief allows only the build and gate commands.
- **Ownership.** No new construction was added. The carriers named are pinned library declarations, so no other roadmap's ownership is affected.
- **Untrusted text.** The fetched lean-pool directory listing and `CrossProductAlgebra.lean` were read as data only. The review contains no instructions.

## Build

`lake build TauCetiRoadmap.K2SymbolsBrauerPartII.Suggested`: Build completed successfully (18252 jobs). Warnings are the five `declaration uses 'sorry'` (lines 54, 65, 83, 117, 124) and the module-system import notice.

## Gate

`gate K2SymbolsBrauerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency check

`depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`: no UPWARD or CYCLE line.

Commit: `4916d30c K2SymbolsBrauerPartII: review repairs (name the algebraic and cohomological Brauer carriers and their comparison)`, not pushed.
