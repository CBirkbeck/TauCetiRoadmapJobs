# FIX-PKG-LogicAndDefinabilityInNumberTheory~8

## F01 (P2) — applied differently

The finding is correct. Regime (ii) gives only "dimension less than n", and the witness checks out. In ℂ((t))², take S′={y²=x³+x, ord x<0} and f(x,y)=(x,−y) on S′. f is discontinuous on S′. With s transcendental over the parameters' coefficient field K₀∋ζ₃, put y=s³t⁻³ and x the Hensel root with ac x=s². Then s↦−s fixes x and negates y, and s↦ζ₃s fixes y and moves x. So no finite union of definable graphs covers S′, and §1.5(b) had no true sentence to transfer.

Old → new: §2.5(b)(iii) "covered by finitely many definable graphs" → "covered by finitely many definable sets with at most M points in every fibre of a coordinate projection", Z one explicit L_O-formula, bijectivity above N₀, no dimension hypothesis; route by elimination-root bound and Zariski induction, transferred implication, Borel pieces, Fubini; new ℂ((t)) Check.

Details of the edit (packages/LogicAndDefinabilityInNumberTheory/README.md §2.5(b)):

- **Statement.** The regime (iii) clause about graph coverings is replaced by the review's wording, with M for the fibre bound. Each complement is covered by finitely many definable sets with at most M points in every fibre of a coordinate projection. Z is given by one L_O-formula. The hypothesis now says that the formulas define a bijection for residue characteristic > N₀, and the conclusion holds above some N≥N₀. Regime (iii) loses "dimension n", which is undefined in positive characteristic.
- **Route.** A new paragraph builds Z from the formulas: points with a ball B⊆X on which f(B) is open and f is strictly differentiable with invertible derivative. Z is open in every field by definition and contains the regime (ii) locus. The proof then runs an induction on Zariski closures:
  - Points that are not interior to their fibre are roots of the elimination polynomials. This gives M = the sum of their degrees in the last variable.
  - The open-fibre part projects into the zero set of a nonzero coefficient.
  - The sentence transferred is "f bijective ⟹ covering". Pieces are Borel because the equivalence between each formula and its quantifier-free form also transfers. Nullity follows by Fubini.
- **New Check.** The ℂ((t)) involution above, with M=2.
- **Citations and *Needs:*.** Added CL 2008 Theorem 2.1.1, Corollary 2.1.2, §3.1, (3.3.2) and CL exp §9.1.2. The *Needs:* line adds §1.3, and the Layer 2 Dependencies add §1.5.
- **Manifest.** The `cluckers_loeser_2008` locator adds §3.1, Theorem 3.3.1 and (3.3.2).

Why "differently": items (1), (3) and (4) of the proposed repair are applied as written. Item (2), the covering route, is replaced. The proposal used cells (Theorem 7.2.1) and continuity of centres (Theorem 3.2.1(iii)). It took the 0-cell root bound from "the polynomials of (3.3.2)". That bound has to come from the elimination form of the set being bounded. A 0-cell's point can lie inside an open fibre of W (W_x = a line split into {c(x)} and 1-cells), so W's own polynomials do not bound it. The Zariski-closure induction needs only:

- the definition of Kdim (`cluckers_loeser_2008` lines 529–534, §3.1, p.13);
- the elimination shape (lines 634–637, p.16);
- relative elimination (lines 353–374).

It needs no cells and no continuity of centres. Its two steps are elementary:

- If no nonconstant elimination polynomial vanishes at z₀, every ord/ac atom is locally constant in z, so z₀ is interior.
- If W⊆{g=0} with g=Σg_i(x)zⁱ≠0, an open nonempty fibre is infinite, so g(x,·)≡0 and x lies in {g_i=0} for some nonzero g_i.

Regime (iii) needs a bijection in κ((t)) for regime (ii), and the hypothesis gives one only in the local fields. I apply (ii) to the bijection that equals f where β holds and is empty elsewhere. The transferred sentence is the implication β ⟹ covering, which holds in every κ((t)).

Pattern search: "graph coordinate", "single-point fibre", "definable graphs", "covered by finitely" in README and Lean. The only other hit, §2.1 line 348, concerns cell presentations and is unaffected. Other consumers of regime (iii) (§2.4 last paragraph, §3.9) cite only its bound and need no change.

## Gate failure: statement-hygiene=3 (`letI` in `ax_kochen_ring`, Suggested.lean lines 40–42)

Repaired with instance binders, as Mathlib recommends for this class (Mathlib/ModelTheory/Algebra/Ring/Basic.lean, module docstring and `class CompatibleRing`, line 156). Old: `∀ (p : ℕ) (hp : p.Prime), N < p → letI : Fact p.Prime := ⟨hp⟩; letI := compatibleRingOfRing ℚ_[p]; letI := compatibleRingOfRing (LaurentSeries (ZMod p)); …`. New: `∀ (p : ℕ) [Fact p.Prime] [FirstOrder.Ring.CompatibleRing ℚ_[p]] [FirstOrder.Ring.CompatibleRing (LaurentSeries (ZMod p))], N < p → (φ.Realize ℚ_[p] ↔ φ.Realize (LaurentSeries (ZMod p)))`.

The new statement is equivalent to the old one. `FirstOrder.Language.ring` has `Relations := fun _ => Empty` (same file, line 58), and the five `funMap_*` fields fix every function symbol. So every `CompatibleRing R` structure equals `compatibleRingOfRing R`. I proved this in a scratch file (`ext`, case split on `ringFunc`, `Empty.elim` on relations; it elaborated with no error). A second scratch `example` derives the former `letI` form from the new theorem, so the binders are not vacuous. Docstring, README §1.5 (headline sentence and *Needs:*), the Mathlib supplier contract and the Layer 1 Dependencies now name `FirstOrder.Ring.CompatibleRing`. The supplier contract also says why the binder form concerns the usual ring structures.

## Checks

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean`, run from the content checkout, exits 0 in 6 s. It prints exactly twelve `declaration uses sorry` warnings (lines 40, 50, 66, 73, 89, 95, 101, 109, 127, 135, 169, 185) and nothing else. No `TauCeti.*` module needed building.
- **Signatures.** I put a scratch copy with `#check @name` for all 18 declarations through elaboration (exit 0 apart from the scratch `end` name), then compared each type with its README statement. The only changed type is `ax_kochen_ring`: `∀ φ, ∃ N, ∀ (p : ℕ) [Fact (Nat.Prime p)] [CompatibleRing ℚ_[p]] [CompatibleRing (LaurentSeries (ZMod p))], N < p → (ℚ_[p] ⊨ φ ↔ LaurentSeries (ZMod p) ⊨ φ)`. That matches §1.5(a) for O=ℤ and a coefficient-free sentence. The other 17 types are identical to the elaborated signatures taken before this round. The file has no `variable` block, so no binder is lost.
- **Gate.** I ran the package gate without build on a scratch copy laid out as `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/`. It reports `statement-hygiene=0`, and set_option, latex, prnum, sorry-data, imports, readme-ids-missing, round-labels, long-fences, depcheck and source-material are all 0. Its only hit, `stray-files=1`, is my copy of `sources.toml` in that scratch layout, not a package defect.
- **Dependency check**, run as the brief prescribes: `depcheck: 236 roadmaps, 2143 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name missing (main 5fc1aa8, 438 open heads).
- **Sources.** No new text was needed. Every passage used is in the cache: `cluckers_loeser_2008` lines 353–374, 529–534, 558–573, 586–601, 634–637; `cluckers_loeser_exp` lines 1580–1620 and 1750–1772. No `needs-references.toml` was written.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §2.5(b)(iii) old graph covering | Review witness in ℂ((t))² | S′ ⊆ X∖Z for every admissible Z; s↦−s gives (x,y)↦(x,−y), so not a graph over x; s↦ζ₃s gives ac x: s²↦ζ₃²s² with y fixed, so not a graph over y | False in ℂ((t)); replaced |
| §2.5(b)(iii) new covering, same witness | Elimination polynomials y²−x³−x (deg_y 2) and x (deg_y 0) | M=2; B=S′ with ≤2 points per x-fibre; A=∅; in the swapped order deg_x gives M=3+1=4 ≥ 3 points per y-fibre | Holds; added as Check |
| Zariski induction, line W={x=0}⊆κ((t))² | QE polynomial x, deg_z 0 | M=0; W₀=κ((t)) is open, so B=∅; A=W, π(A)={0}⊆{g₀=x=0}; level 1: M′=1, B′={0}, A′=∅ | Covered by {0}×κ((t)), ≤1 point over each z |
| Zariski induction, W={z=x²}∪({0}×κ((t))) | Polynomials z−x², x | M=1; B is the parabola minus (0,0), 1 point per x≠0; (0,0) is interior to W₀ | Holds |
| Base cases | n=0: W⊆point in the zero set of a nonzero constant; n=1: open nonempty ⊆ roots of a nonzero g is impossible | W=∅; A=∅, so W=B with ≤M points | Stated in README |
| Z of (iii) | f=x⁻¹ on F with f(0)=0; n=0 | 0∉Z because f(B)={0}∪{|y|≥r⁻¹} is not open; X∖Z={0}, M=1. n=0: Z=X, empty derivative, complements empty | Holds |
| Z contains the (ii) locus | Bianalytic f on open Z₂ | Small B⊆Z₂ gives f(B)=(f⁻¹)⁻¹(B)∩f(Z₂), open; analytic implies strictly differentiable; chain rule gives invertible Df | Z₂⊆Z, so complements shrink |
| β-implication | Formula bijective in local fields, not in ℂ((t)) (f=id if RF has a nonsquare, else constant 0) | Finite and pseudofinite RF have a nonsquare; ℂ has none, so β fails there; "β ⟹ covering" is vacuously true in ℂ((t)) and still transfers | Needed; stated |
| Borel pieces | Disjunct of (3.3.2) in K | {h=0} closed; {f,g≠0} open; ord, ac locally constant there (ac(a(1+ε))=ac a when ord ε>0) | Finite union of locally closed sets |
| Fubini nullity | Q with ≤M points per fibre of coordinate i | μ(Q)=∫μ₁(Q_x)dx=∫0=0 (Haar on Kⁿ is σ-finite) | Holds |
| 𝔽₂((t)) Check s(a²+tb²)=b²+ta² against new (iii) | Odd p: ∃a,b(x=a²+tb² ∧ y=b²+ta²) | Not a function for odd p (a²+tb² is not a unique decomposition), so the bijection hypothesis fails above every N₀ ≥ 2 | Check unchanged and consistent |
| `ax_kochen_ring` binder form | φ=∃x x²+1=0 at p=2,3,5; uniqueness of structures | ℚ₂ no, 𝔽₂((t)) yes, so N≥2; p=3 no/no; p=5 yes/yes (2²≡−1). Every CompatibleRing structure is canonical (scratch proof); the old form follows (scratch example) | Equivalent; retained |
| Regimes (i),(ii) "dimension n" | dim X<n | Z=∅ gives X∖Z=X of dim<n | Kept as in the source; only (iii) loses it |

## Notes for the maintainer

- **Changed names and statements.** Only the signature of `ax_kochen_ring` changed (instance binders instead of `letI`). The name is the same, and no other roadmap on main or at an open head cites it (`roadmaps grep --fixed ax_kochen_ring`: no match). No roadmap cites §2.5 of this package.
- **Ownership.** No new object was introduced. The covering lemma is a proof step inside §2.5(b)(iii), which this roadmap already owns. The objects used (Denef–Pas elimination, CL Kdim, §1.5 transfer) are this roadmap's own Layers 1–2. No new supplier, gap or merge-order edge.
- **Open roadmaps later in the merge order.** Ownership against LogicAndDefinabilityInNumberTheoryPartII and TopologicalMirrorSymmetryForHitchinSystems was not re-checked: no object changed owner.
