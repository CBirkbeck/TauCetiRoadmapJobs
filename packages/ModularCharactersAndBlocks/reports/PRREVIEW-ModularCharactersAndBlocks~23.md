# Review of ModularCharactersAndBlocks (pull request #1775 at 11fcc6f)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

:robot: Independent AI review (Claude Opus 5.5). This is a full review of `11fcc6f`, the same head the previous review read. There are ten findings: three P2 and seven P3. R05 re-raises the family-index finding. The other nine are new; most come from the seeded source sample and from the ownership search against open heads.

## R01 (P2) — The defect-zero characterization is stated over every field, but holds only over a splitting field

**Location.** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:884–886`: “Defect zero: a block has defect group `1` exactly when it is a matrix algebra over `k`, exactly when it contains an ordinary character `χ` with `|G|_p ∣ χ(1)` …”

**Claim.** §6.2 works over an arbitrary field of characteristic `p`: `IsDefectGroup` takes any `[Field k]` (`Suggested.lean:223`), and the bullet before this one says “`k` any field of characteristic `p`”. This bullet adds no hypothesis on `k`. Its sources do: Webb Theorem 9.6.1 assumes a splitting `p`-modular system with `R` complete (webb line 6800), and Webb Corollary 12.4.8 assumes `k` splits `G` (webb line 10209).

**Witness.** Take `G = C₃`, `p = 2`, `k = 𝔽₂`, and the block `e = r + r²`. Its defect group is `1`: `Br_1(e) = e ≠ 0`, and `1` is the only `2`-subgroup. But `e·𝔽₂[C₃] ≅ 𝔽₄` has dimension `2`, which is not a square, so it is not `M_n(𝔽₂)`.

**Repair.** Begin the bullet with “Over a field `k` of characteristic `p` that splits `G` (for instance the residue field of §1.1):”. Add the witness as a negative-control Check under §6.2. Tested on three blocks:
- Each of the three blocks of `𝔽₄[C₃]` is `≅ 𝔽₄ = M₁(𝔽₄)`, has defect group `1`, and holds one linear character, with `|C₃|₂ = 1 ∣ 1`.
- The block `r + r²` of `𝔽₂[S₃]` is `M₂(𝔽₂)`, with `Irr = {std}` and `2 ∣ 2`.

## R02 (P2) — The central-character description of the blocks of `O[G]` is statable at the pins but is listed as not statable

**Location.** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean:35–39`: “The agreement of the central-character relation with the partition of the ordinary irreducible characters by the block idempotents of `O[G]` (Layer 4). It needs the ordinary characters over the fraction field `K` …”

**Claim.** The docstring says this headline cannot be stated because `TauCeti.Representation.primitiveCentralIdempotent` needs an algebraically closed field. The statement needs no idempotent `e_χ`. The condition `χ ∈ Irr(B)` says that `e_B` acts as the identity on a module affording `χ` (Martínez, Theorem 2.12(i), martinez line 663–665). The irreducible representations over `K` and their characters are native: `Representation.IsIrreducible`, Mathlib `Representation.character` (`RepresentationTheory/Character.lean:56`), and `Representation.asAlgebraHom` (`RepresentationTheory/Basic.lean:119`).

**Witness.** Append the theorem below to a scratch copy of `Suggested.lean`. It elaborates with `lake env lean`: exit 0, with only the thirteen `sorry` warnings.

**Repair.** Add this theorem under `/-! ## Layer 4 … -/`:

```lean
/-- **Blocks of `O[G]` and central characters.** Two irreducible representations of `G` over the
fraction field `K` of a splitting `p`-modular system lie in one block of `O[G]` exactly when their
central characters agree modulo the maximal ideal on every class sum (Sambale, Definition 1.6,
p. 15; Martínez, Definition 2.1, p. 9, and Theorem 2.12, p. 15). -/
theorem exists_blockIdempotent_iff_centralCharacter_congr {G O : Type u} [Group G] [Finite G]
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharZero O]
    {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G))
    {V W : Type u} [AddCommGroup V] [Module (FractionRing O) V] [FiniteDimensional (FractionRing O) V]
    [AddCommGroup W] [Module (FractionRing O) W] [FiniteDimensional (FractionRing O) W]
    (ρ : Representation (FractionRing O) G V) (σ : Representation (FractionRing O) G W)
    (hρ : ρ.IsIrreducible) (hσ : σ.IsIrreducible) :
    (∃ b : Subalgebra.center O (MonoidAlgebra O G), IsBlockIdempotent b ∧
        ρ.asAlgebraHom (MonoidAlgebra.mapRingHom G (algebraMap O (FractionRing O)) b) = 1 ∧
        σ.asAlgebraHom (MonoidAlgebra.mapRingHom G (algebraMap O (FractionRing O)) b) = 1) ↔
      ∀ g : G, ∃ m ∈ IsLocalRing.maximalIdeal O, algebraMap O (FractionRing O) m =
        (Nat.card (ConjClasses.mk g).carrier : FractionRing O) *
          (ρ.character g / ρ.character 1 - σ.character g / σ.character 1) := sorry
```

Then make three edits:
- In README §4.2, name this theorem in backticks next to the sentence that characterizes the partition by central characters (`README.md:715–717`).
- Delete the third bullet of the docstring's not-statable list.
- Update the description sentence that lists “the agreement of the central-character relation with the partition by the block idempotents of `O[G]`” among the headlines that are not statable.

Tested on `S₃` at `p = 2`, over `O = ℤ₂[ζ₃]`:
- Trivial and sign: the left side holds, since both lie in `B₀`. The right side holds: `3(1 − (−1)) = 6 ∈ m`, and `2(1 − 1) = 0`.
- Trivial and standard: the left side fails, and so does the right: `3(1 − 0) = 3 ∉ m`.

On `C₃` over the same ring, trivial against faithful: `1 − ζ₃` has norm `3`, a unit, so both sides fail.

## R03 (P2) — The `p'`-core has a second owner in OddOrderTheorem

**Location.** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:1065–1077`: “Define the `p'`-core `pPrimeCore p G`, written `O_{p'}(G)`, of the finite group `G` as the supremum in `Subgroup G` of the normal subgroups `N` of order prime to `p` …”, with its API.

**Claim.** OddOrderTheorem (#1777, open) defines the same object and proves the same API, so the object has two owners. GlaubermanZStar (#1778, open) attributes `O(G) = pPrimeCore 2 ⊤` to a third roadmap, LocalFiniteGroupTheory L1. It also consumes this roadmap's kernel theorem, which is stated about this roadmap's `pPrimeCore`.

**Witness.** At #1777, `TauCetiRoadmap/OddOrderTheorem/README.md:319–331` defines the `π`-core `O_π(H)` “with `O_p(H)` and `O_{p'}(H)`”. It proves that the core is characteristic, contains every normal `π`-subgroup, and satisfies `O_π(H ⧸ O_π(H)) = 1`. At #1778, see `TauCetiRoadmap/GlaubermanZStar/README.md:45`.

**Repair.** This roadmap stays the owner, for two reasons:
- It comes earlier in the merge order: line 102, against line 401 for OddOrderTheorem.
- LocalFiniteGroupTheory cannot be a supplier.

Make these changes in §8.2:
- State the general object: the `π`-core `O_π(G)`, the supremum of the normal subgroups whose order has all its prime divisors in `π`. `pPrimeCore p G` is the case `π = {q | q ≠ p}`, and the Lean `pPrimeCore` can stay as it is, with its README entry identifying it with that case.
- Add the remaining bullets of OddOrderTheorem §1.1: `O_π(N) = O_π(G) ⊓ N` for `N ⊴ G`, and the image of `O_π` under a surjective homomorphism.
- Under *Scope and ownership*, record that §8.2 owns the `π`-cores that OddOrderTheorem §1.1 and GlaubermanZStar consume.

OddOrderTheorem §1.1 then cites §8.2 instead of defining `O_π`. Also replace the description's “no other roadmap is a supplier for it” with that ownership statement. Tested:
- `O_{{3}}(S₃) = C₃ = pPrimeCore 2 S₃`
- `O_{{2}}(S₃) = 1 = pPrimeCore 3 S₃`
- `O_{{2}}(A₄) = V₄ = pPrimeCore 3 A₄`

## R04 (P3) — The layers were renumbered from M0–M8 without a mapping, and GlaubermanZStar still cites the old ids

**Location.** The layer headings `README.md:254` (“## Layer 0: …”) through `README.md:1031` (“## Layer 8: …”), and *Downstream consumers* at `README.md:1144–1149`.

**Claim.** Earlier heads of this pull request numbered the layers M0–M8; this head numbers them Layers 0–8 and gives no old → new mapping. At its head, GlaubermanZStar cites “ModularCharactersAndBlocks M1, M2, M4, M5, M7, M8”. Its M8 also includes an ordinary-character inflation law (along `H → H ⧸ N` for `N` of odd order, preserving the pairing). Neither §8.2 nor §8.4 states that law, and neither CharacterTheory nor InductionRestriction on main mentions inflation.

**Witness.** At #1778, `TauCetiRoadmap/GlaubermanZStar/README.md:49–53, 144–155, 449, 571, 766, 804, 823`. The PR's own `4b23da3e` has headings “### M0” through “### M8” at its README lines 128–331.

**Repair.** Do one of the following:
- Add after *How to read the build*: “The former milestone numbering maps to the layers by `Mk` ↦ Layer `k` (`k = 0, …, 8`).”
- Have GlaubermanZStar repoint those citations to Layer `k` / §`k.n` before either pull request merges.

In either case, add to §8.2: for `N ⊴ G`, composition with `G → G ⧸ N` is a bijection from `Irr(G ⧸ N)` onto the `χ ∈ Irr(G)` with `N ≤ ker χ`, and it preserves `⟨ , ⟩`. List it in §8.4 and in *Downstream consumers*. Tested on `S₃` with `N = C₃`: `Irr(C₂) = {1, sgn}` maps onto `{1, sgn}`. The pairing `⟨1, sgn⟩` is `(1 − 1)/2 = 0` on `C₂` and `(1 + 2 − 3)/6 = 0` on `S₃`.

## R05 (P3) — The family index still assigns Brauer characters to this roadmap

Re-raised: H02. The earlier disposition, that the family index could not be edited, does not hold. This brief makes the files directly in `TauCetiRoadmap/RepresentationTheory/` the pull request's own, and this pull request added the sentence.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim.** The index makes this roadmap the owner of Brauer characters. The folder imports them, and their projective pairing, from GL2AutomorphicRepresentationsAndTransfer §R17.5.11. “Both” also follows three named roadmaps.

**Witness.** The folder's `README.md:93–102` imports these. At #931, `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2938` says: “Modular characters and their projective pairing are owned here.”

**Repair.** Replace the sentence with: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes these foundations, imports Brauer characters and their projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and owns the Brauer-character basis theorem, decomposition matrices, Brauer reciprocity and blocks with defect.” In the dependency bullet at `README.md:78–81`, also add SemisimpleAlgebras Layers 0–2, which §§2.2–2.3 consume. Tested: the imported objects match the supplier at its lines 2927–2938, and the owned ones match §§2.2, 2.4, 3.1 and Layers 4–7.

## R06 (P3) — §2.3 cites SemisimpleAlgebras Layer 0 for a fact that layer does not list

**Location.** `README.md:520–522`: “a nilpotent ideal lies in the radical and the radical lies in every ideal with semisimple quotient (Mathlib `Ring.jacobson_le_of_eq_bot`, SemisimpleAlgebras Layer 0)”.

**Claim.** SemisimpleAlgebras Layer 0 does not state that a nilpotent ideal lies in the radical, and the Tau Ceti pin already proves it.

**Witness.** SemisimpleAlgebras Layer 0 on main (`TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:169–183`) is headed “optional”. It lists the converse, that the radical is nilpotent. Tau Ceti has `TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul` at `TauCeti/RingTheory/Jacobson/Basic.lean:101`.

**Repair.** In §2.3 and its *Needs:* line, cite `TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul` for the nilpotent-ideal step: if `I^n = 0` and `x ∈ I`, every `y x` is nilpotent. Cite Mathlib `IsSemisimpleRing.jacobson_eq_bot` with `Ring.jacobson_le_of_eq_bot` for the second step. Add both to the supplier contracts, and keep SemisimpleAlgebras Layer 2 for the Wedderburn form. Tested on `𝔽₄ ⊗ rad 𝔽₂[C₂] = (1 + t)`: `(1 + t)² = 0`, and the quotient `𝔽₄` is semisimple, so `rad 𝔽₄[C₂] = (1 + t)`.

## R07 (P3) — The `Br_D(e_B)` bullet of §6.2 goes beyond what its only source supports

**Location.** `README.md:887–889`: “For a block `B` with defect group `D`, `Br_D(e_B)` is a block idempotent of `k[N_G(D)]` with defect group `D`, and every such block arises from exactly one `B` (Webb, proof of Theorem 12.6.4, p. 250)”.

**Claim.** §6.2 is stated over every field of characteristic `p` (`README.md:878–879`), but the cited theorem assumes splitting.

**Witness.** Webb Theorem 12.6.4 (webb line 10524–10525) assumes `k` “is a splitting field for G and all of its subgroups”. The statement is true over every field, by descent from `k̄`, but no locator supports that generality.

**Repair.** Begin the bullet with “Over a field `k` of characteristic `p` that splits `G` and all its subgroups”. §7.1, the only consumer, works in that setting. Alternatively, keep the generality and add the descent with a locator: Galois-conjugate blocks share defect groups, because `Br_D` commutes with the action on coefficients. Tested on `S₃` over `𝔽₄` with `D = ⟨(12)⟩`: `Br_D(1 + r + r²) = 1`, the block of `𝔽₄[D]`, which has defect group `D`.

## R08 (P3) — §4.1 has no source locator

**Location.** `README.md:697–700`: “Define `e_χ = χ(1)|G|⁻¹ ∑_g χ(g⁻¹) g` over `F`, map it to `K[G]`, and prove idempotence, orthogonality and completeness … (CharacterTheory §3.5).”

**Claim.** The target cites only a supplier roadmap. No source gives the formula.

**Witness.** Webb Theorem 3.6.2 (webb line 1907–1915, printed p. 42) gives the primitive central idempotents of `ℂG` by exactly this formula.

**Repair.** Add “(Webb, Theorem 3.6.2, p. 42, over `ℂ`)” after the formula. Tested on `C₂`: `χ(1)|G|⁻¹ ∑ χ(g⁻¹) g = (1 ± t)/2`, the §4.1 Check.

## R09 (P3) — The §6.1 locator does not cover transitivity, conjugation or the Mackey formula

**Location.** `README.md:838–840`: “prove transitivity, conjugation, the Mackey formula, `Tr_Q^P(a) b = Tr_Q^P(a b)` … and that `k[G]^P_Q = Tr_Q^P(k[G]^Q)` is an ideal … (Webb, Proposition 12.4.1, p. 238)”.

**Claim.** Proposition 12.4.1 covers only part of this list.

**Witness.** Proposition 12.4.1 (webb line 10047–10051) gives the module identity, the ideal and functoriality. The text before it (webb line 10044–10046) defers the rest to Lemma 11.3.1. That lemma (webb line 8191–8202, pp. 194–195) has transitivity, conjugation and the Mackey formula.

**Repair.** Change the locator to “(Webb, Lemma 11.3.1, pp. 194–195, and Proposition 12.4.1, p. 238)”. Tested: Lemma 11.3.1(2) gives `tr tr = tr` and `c_g tr = tr c_g`, and part (4) is Mackey.

## R10 (P3) — The References carry process remarks, and Serre is never cited

**Location.** `README.md:1167–1171`: “(cited by locator; the text was not read)”, in both the Serre and the Navarro entries.

**Claim.** The README must be timeless: the reading status of a source is process narrative, and the sources manifest already records it. Serre is listed but cited at no target.

**Witness.** A search for `Serre` in the README matches only line 1167.

**Repair.** Delete both parentheticals. Then either cite Serre at a target by locator (for example §2.4: Serre, §16.1, Theorem 33, which ModularInduction and ArithmeticGaloisDuality also cite) or delete the entry. Test: after the change, `not read` matches nothing, and every reference is cited in the body.

## Previous findings

- **R01 of the previous review (family-index ownership): not repaired.** `TauCetiRoadmap/RepresentationTheory/README.md:133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect.” Carried as R05; the folder is unchanged since that review.

## Verified sound

**Gate and build.**
- The worker's gate at this head passes every check, including the targeted build.
- Re-running the generic gate command reports only the two exceptions the last review documented, `depcheck: NOT IN ORDER` and `outside-folder: TauCetiRoadmap/RepresentationTheory/README.md`. The first comes from the default order, not the candidate order. The second names the family index, which this brief makes the pull request's own. That run stops before the build.
- The dependency check with the candidate order prints `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`. ModularCharactersAndBlocks is at line 102, right after its last supplier, GL2AutomorphicRepresentationsAndTransfer (101); ArithmeticGaloisDuality is at 62.
- `lake env lean` on `Suggested.lean` exits 0 with exactly 12 warnings, all `sorry`.

**Signatures and padding.**
- A scratch copy with `#check @name` for all 17 declarations elaborates. All 17 printed types match `signatures.md` after whitespace normalisation, so no section binder is lost.
- Every theorem carries its standing hypotheses explicitly, including `CharZero O`, the primitive-root hypothesis `hζ`, completeness, `IsAlgClosed` where the README says “algebraically closed”, and `M.IsMaximal` with `p ∈ M`.
- One-tactic padding probe on a scratch copy: each of the 12 theorems was tried with `first | (simp; done) | rfl | infer_instance | exact?`. Eleven failed with “`exact?` could not close the goal”, and `brauer_first_main` timed out. None is padding.

**Lean form.**
- One `import Mathlib` plus seven `TauCeti.*` modules, each used and present at the pin.
- No `set_option`, no `lemma`, no sorry'd data. The five definitions have real bodies on native carriers.
- Every declaration has a docstring, and the layer comments follow README order.

**Pins and library declarations.** Mathlib is pinned at `1b1ccf4b`, Tau Ceti at `2fd255d9`. All 57 library-qualified backticked names in the README resolve at the pins. I opened these:

Tau Ceti:
- `TauCeti.IsPrimitiveIdempotent` (`RingTheory/Idempotents/Primitive/Basic.lean:89`, with fields `isIdempotentElem`, `ne_zero` and `eq_zero_or_eq_zero_of_add`)
- `TauCeti.irreducibleCharacters` (`RepresentationTheory/CharacterTable/Table.lean:114`, any field)
- `TauCeti.irreducibleCharacter` (`Table.lean:201`, injective at `:217`, exhaustive at `:222`)
- `TauCeti.sum_characterTable_mul_conj` (`Table.lean:585`, value `|G|/|C| = |C_G(g)|`)
- `TauCeti.jordanHolderMultiplicity` (`RingTheory/CompositionSeries/Multiplicity.lean:217`)
- `IsAdicComplete.exists_isIdempotentElem_eq` (`RingTheory/AdicCompletion/Idempotent.lean:133`)
- `Representation.mem_ker_iff_char_eq` (`RepresentationTheory/CharacterTable/Kernel.lean:115`)
- `TauCeti.IsIndecomposableModule` (`RingTheory/KrullSchmidt/Indecomposable.lean:90`)
- `TauCeti.IsExhaustiveSimpleFamily` (`GrothendieckGroup/SimpleBasis.lean:190`) and `TauCeti.IsExhaustiveIndecomposableProjectiveFamily` (`GrothendieckGroup/ProjectiveBasis.lean:179`)
- `TauCeti.finiteProjectiveModules` (`Algebra/Category/ModuleCat/CartanMap/Basic.lean:129`)
- `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary` (`RepresentationTheory/Induction/Brauer/Induction.lean:82`)
- `TauCeti.Ring.mem_jacobson_of_forall_isNilpotent_mul` (`RingTheory/Jacobson/Basic.lean:101`)

Mathlib:
- `MonoidAlgebra.ofCoeff` (`Algebra/MonoidAlgebra/Defs.lean:67`)
- `littleWedderburn` (`RingTheory/LittleWedderburn.lean:169`)
- `Ring.jacobson_le_of_eq_bot` (`RingTheory/Jacobson/Radical.lean:167`)
- `IsSemisimpleRing.jacobson_eq_bot` (`RingTheory/Jacobson/Semiprimary.lean:39`)
- `IsArtinianRing.isNilpotent_jacobson` (`RingTheory/Artinian/Ring.lean:55`)
- the DVR instance on `adicCompletionIntegers` (`NumberTheory/NumberField/Completion/FinitePlace.lean:74`)
- `Representation.asAlgebraHom` (`RepresentationTheory/Basic.lean:119`)
- `Representation.character` (`RepresentationTheory/Character.lean:56`)

Neither pin defines a `p`-core or `π`-core.

**Cross-roadmap citations resolved (14).** All exist where they are cited:

| Supplier | Section | Location |
| --- | --- | --- |
| GL2AutomorphicRepresentationsAndTransfer | §R17.5.11 | #931, README:2927–2941 |
| GL2AutomorphicRepresentationsAndTransfer | §R17.5.12 | #931, README:2942 |
| ArithmeticGaloisDuality | §R02.4.4, target *Surjectivity of the decomposition map* | #858, README:3505 and :3635 |
| CharacterTheory | §3.5, §4.3, §4.5 | main, README:497, :741, :817 |
| QuiverRepresentations | Layer 3; Cartan orientation `Cᵢⱼ = [Pᵢ:Sⱼ]` | main, README:505; :106–107 |
| GrothendieckEulerForms | Layers 2 and 4, pairing §4.2 | main, README:352, :602, :633 |
| ModularInduction | Layers 0, 1 (`modRepK0.baseChange`), 3 | main, README:174, :202 (:228), :257 |
| InductionRestriction | Layer 6 | main, README:661 |
| SemisimpleAlgebras | Layers 0–2 | main, README:169–232 |

ModularInduction excludes Brauer characters, the decomposition map and blocks (its README:37–40), which matches this roadmap's ownership.

**Ownership.** I ran `roadmaps grep` over main and the 439 open heads for defect groups, block idempotents, the Brauer homomorphism, the first main theorem, generalized decomposition numbers, decomposition matrices, Brauer reciprocity and the `p'`-core.
- The block-theory objects have no other owner.
- Brauer characters are imported from GL2AutomorphicRepresentationsAndTransfer, as the folder says (R05 concerns only the index).
- The `p'`-core has other owners (R03).
- The overlap report shows no dropped id, no revision-only id, and no other pull request changing this folder.
- The description states the rebase order for the family-index conflict with #1146.

**Seeded source sample (15 targets, plus the flagged unverified locators).** Printed pages follow the PDF page markers: Webb PDF − 7, Martínez PDF − 8, Sambale PDF − 0, Craven PDF − 5.

| Target | Locators checked (source line) | Result |
| --- | --- | --- |
| 0.1 | Webb L9.3.4 p.146 (webb 6147); Martínez p.3 (martinez 165–167) | supports |
| 0.2 | Webb P12.1.1–12.1.2 p.227 (webb 9585, 9596), C12.1.3 p.228 (9608); Martínez T2.11 p.15 (648) | supports |
| 1.1 | Webb §9.4 p.148 (webb 6228); L10.1.1 p.170 (7143) | supports (source issue below) |
| 1.2 | Webb T9.4.8 p.153 (webb 6434); Martínez T1.7, L1.8 p.4 (189, 196) | supports |
| 1.3 | Webb P9.4.3, P9.4.5 pp.149–151 (webb 6276, 6334) | supports |
| 2.3 | Webb T9.2.7 p.144 (webb 6054), remark (6057–6060), Exercises 4, 8(a) pp.165–166 (6974, 7004) | supports (source issue below) |
| 4.1 | none | R08 |
| 4.2 | Martínez D2.1 p.9 (365), T2.2 p.10 (375), T2.11–2.12 p.15 (648, 663); Sambale D1.6 p.15 (sambale 367) | supports |
| 4.3 | Sambale D1.2 p.14 (sambale 335) | supports |
| 6.1 | Webb P12.4.1 p.238 (10047), §12.5 p.243, L12.5.3 p.245 (10341), C12.5.4 p.246 (10365), L11.6.8(2) p.215 (9094); Martínez T4.1 p.23 (894) | R09 |
| 6.2 | Webb T12.5.2 p.244 (10292), C12.5.5 p.246 (10384), C12.3.2 p.235 (9906), T12.4.5 p.241 (10173), C12.4.7 p.242 (10199), T9.6.1 p.161 (6800); Martínez D3.2 p.17 (703), T4.3 p.24 (948), C3.9 p.21 (869), C2.9 p.15 (630); Sambale D1.4, P1.5 p.14 (350, 353) | R01, R07 |
| 7.1 | Sambale D1.10, P1.11, T1.12 p.16 (424, 438, 442); Martínez p.25 (969–981), T4.5, C4.6 p.26 (1004, 1055), T4.10 p.27 (1085); Webb T12.6.4 p.250 (10524) | supports |
| 7.2 | Sambale T1.13, T1.14 p.16 (445, 465); Martínez C2.4 p.11 (451) | supports |
| 8.1 | Martínez T1.14 p.6 (316), C8.2, P8.4 p.51 (1895, 1907), T8.5 p.52 (1928); Sambale T1.23 p.18 (542) | supports |
| 8.2 | Martínez T8.5(iii) p.52 (1933), D7.3, Pb7.4 p.44 (1638, 1642), T7.7 p.45 (1710); Sambale T1.24 p.18 (547) | supports |

Outside the sample, I also checked:
- Craven D2.6 p.22, L2.7 and D2.8 p.23, L2.9 and D2.10 p.24, T2.11–2.12 p.25 (craven 814–897).
- Webb T9.5.4 p.159, C9.5.6 p.160, P10.2.1 p.174, T10.2.2 p.176, C10.2.4 and its remark p.178, C10.3.3 p.183.

All match.

**Adversarial table.** Notation: `r = (123)`, `t = (12)`, `α² + α + 1 = 0` in `𝔽₄`, `e₀ = 1 + r + r²`, `e₁ = r + r²`.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| H01 | `complete_blockIdempotents_unique` | `𝔽₃[C₂]`, `(e₊,e₋)` vs `(e₋,e₊)`; `G = 1` | `(2+2t)² = 2+2t`, `(2+2t)(2−2t) = 0`; bijection = swap; `{1}` vs `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; `ℤ₂[C₂]`; `𝔽₂[[T]][C₂]` | `(1+r+r²)/3 ↦ e₀`, `(2−r−r²)/3 ↦ e₁`, squares `3e₀/9 = e₀/3`; only `1 ↦ 1`; `O[C₂]` local, only `1 ↦ 1` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` | `S₃` at 2, 3; `C_p`; `G = 1`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `1 = 1`; `2 ≠ 3` without splitting | Pass | none |
| H04 | `span_decompositionRows_eq_top` | `S₃` at 3; `C₂` at 2; `C₂×C₂` at 3 | rows `(1,0),(0,1),(1,1)`, minor `det = 1`; `(1),(1)` span `ℤ`; `D = I₄` | Pass | none |
| H05 | `cartanMatrix_eq_transpose_mul_decomposition` | `S₃` at 3, 2; `C₄/ℤ₂[i]`; control `C₄/ℤ₂` | `[[2,1],[1,2]] = [[2,1],[1,2]]`; `diag(2,1)`; `4 = 4`; `1+1+4 = 6 ≠ 4` without `hζ` | Pass | none |
| H06 | `brauerProjection_mul` | `S₃`, `p = 2`, `P = ⟨t⟩`: `x = y = e₁`; `x = r, y = r²`; `x = e₁, y = r`; over `ℚ` | `0 = 0·0`; `1 ≠ 0`; `Br(1 + r²) = 1 ≠ 0`; `2 ≠ 0` | Pass; both invariance hypotheses and char `p` needed | none |
| H07 | `isDefectGroup_conj` | `𝔽₂[S₃]`: `e₀`, `e₁` | `Br_⟨t⟩(e₀) = 1`; maxima `⟨(12)⟩, ⟨(13)⟩, ⟨(23)⟩`, conjugate; `e₁`: only `1` | Pass | none |
| H08 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `𝔽₂[S₃]` `e₀`; `𝔽₂[C₃]` `e₀`; `G = 1` | `aug = 1`, defect groups = 3 Sylows; defect `1` = Sylow `1`; `1 = 1` | Pass | none |
| H09 | `brauer_first_main` | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1`; `S₃`, `p = 3`, `D = C₃` | `N = D`, `1 ↦ e₀`, `Br_D(e₀)·1 = 1 ≠ 0`; identity on `{e₁}`; identity on `{1}` | Pass | none |
| H10 | `sum_sameBlock_mul_conj_eq_zero` | `S₃`, `p = 2`, `(g,h) = (1,t), (t,r)`; `p = 3`, `(1,r)`; control `g = h = t` | `1 − 1 = 0`, `2·0 = 0`; `1·1 + (−1)·1 = 0`; `1 + 1 − 2 = 0`; control `2 ≠ 0` | Pass | none |
| H11 | `brauer_third_main_local` | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1` | `Br_P(e₀) = 1`, `aug 1 = 1`; `e₀e₁ = 0`, `aug e₁ = 0` | Pass | none |
| H12 | `mem_pPrimeCore_iff_forall_principalBlock` | `S₃` at 2, 3; `C_p`; `G = 1` | `ker 1 ∩ ker sgn = C₃ = O_{2'}`; `std` faithful, `1 = O_{3'}`; `1 = 1`; `1 = 1` | Pass | none |
| D01 | `IsBlockIdempotent` | `𝔽₂[C₂]`; `𝔽₃[C₂]` | `1` yes, `ε² = 0 ≠ ε`, `0` excluded by `ne_zero`; `1 = e₊ + e₋` not primitive | Pass | none |
| D02 | `SameBlock` | `S₃`, `M ∋ 2`; `M ∋ 3`; without class size | `−6 ∈ M`, `−3 ∉ M`; `−3, −3 ∈ M`; `−3/2` not integral | Pass | none |
| D03 | `brauerProjection` | `S₃`, `P = ⟨t⟩` | `e₀ ↦ 1`, `e₁ ↦ 0`; `Br(r·r²) = 1 ≠ 0 = Br(r)Br(r²)` | Pass | none |
| D04 | `IsDefectGroup` | `C₃`, `p = 2`, `e₀`; wrong model without `IsPGroup` | defect `1`; wrong model gives `C₃` (`Br_{C₃}(e₀) = e₀ ≠ 0`) | Pass | none |
| D05 | `pPrimeCore` | `S₃`, `A₄`; wrong model `O_p` | `C₃, 1`; `V₄, 1`; `O_p`: `1, C₃` | Pass | ownership, R03 |
| S0.1 | sections | `S₃` at 2; `C₆`; class sizes, `g = t` | `3 + 3`, `3 = 2 + 1`; `g³g⁴ = g`; `3 = 3·1` | Pass | none |
| S0.2 | blocks of `𝔽₂[S₃]`, `𝔽₄[C₃]` | sum, product; scalar extension | `e₀ + e₁ = 1`, `e₀e₁ = 0`; `e_α + e_{α²} = r + r²` | Pass | none |
| S1.1 | splitting system | `e = 3` at `p = 2, 3`; `e = 1`, `p = 5` | unramified, `k = 𝔽₄`; ramified, `k = 𝔽₃`, `e' = 1`; `μ(ℚ) = 2`, `μ(ℚ₅) = 4` | Pass | none |
| S1.2 | lattice independence | `C₂`, `p = 2`; `G = 1` | `O[C₂]`, `O(1+t) ⊕ O(1−t)` both class `2`; `O`, `mO` class `1` | Pass | none |
| S1.3 | lifting | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(1+r+r²)² = 3(1+r+r²)`; `(1±t)/2 ∉ ℤ₂[C₂]` | Pass | none |
| S2.3 | residue splitting | `C₃` over `𝔽₄`, `𝔽₂`, `𝔽₄(T)`, `𝔽₂(T)` | dims `1,1,1`; `1,2`; `k³`; `1,2`; route `d² = d ⇒ d = 1` | Pass | none |
| S4.1 | `e_χ` | `C₂/ℚ₂`; `C₃` | `e₊e₋ = (1 − t²)/4 = 0`; `∑_j ζ^{−j} = 0`, so `∑ e_j = 1` | values pass | R08 |
| S4.2 | partitions | `S₃`, `p = 2`, transposition class | `ω = 3, −3, 0`: `6 ∈ (2)`, `3 ∉ (2)` | Pass | none |
| S4.3 | principal block | `𝔽₂[S₃]`; `𝔽₄[C₃]` | `aug e₀ = 1`, `aug e₁ = 0`; `aug e_α = 1 + α² + α = 0` | Pass | none |
| S6.1 | traces | `S₃`, `𝔽₂`, `P = ⟨t⟩` | `Tr_1^P(r) = r + r²`; `Tr_1^P(1) = 0`; `Tr_P^P = id` | values pass | R09 |
| S6.2 | defect bullets | `C₃/𝔽₂` `e₁`; `C₃/𝔽₄` | defect `1`, but `𝔽₄` is not `M_n(𝔽₂)`; three `M₁(𝔽₄)` | Fails without splitting | R01, R07 |
| S7.1 | block induction | `S₅`, `p = 3`, `D = ⟨(123)⟩`, `s = (45)` | `Br_D(e_{B₁}) = (1+s)/2`, `Br_D(e_{B₂}) = (1−s)/2`; on `χ_{(4,1)}` (`χ(s) = 2`) the eigenvalues `1,1,1,−1` give projections of ranks `3` and `1`, both `≠ 0` | Pass | none |
| S7.2 | second main, block form | `S₃`, `p = 2` | `d^t = (1,−1,0)`; `B₀`: `2 = 2·1²`; defect zero: `4 = 1·2²`; total `6` | Pass | none |
| S8.1 | domination | `S₃`, `p = 3`, `N = C₃` | `1 ↦ e₊ + e₋`, two blocks | Pass | none |
| S8.2 | `p'`-subgroups, covering | `S₃`, `p = 2`, `N = C₃` | `e_N = 1 + r + r²`; `e_α + e_{α²} = r + r²` | Pass | R03 (ownership) |
| F02 | R02 statement | `S₃/ℤ₂[ζ₃]`: (1, sgn), (1, std); `C₃`: (1, faithful) | `T ↔ T` (`6 ∈ m`, `0`); `F ↔ F` (`3 ∉ m`); `F ↔ F` (`N(1−ζ₃) = 3`, a unit) | statable and consistent | R02 |
| F03 | `π`-core repair | `S₃`, `A₄` | `O_{{3}}(S₃) = C₃`, `O_{{2}}(S₃) = 1`, `O_{{2}}(A₄) = V₄`; equal to `pPrimeCore` | Pass | R03 |
| F04 | inflation law | `S₃`, `N = C₃` | `Irr(C₂) = {1, sgn} ↦ {1, sgn}`; `⟨1,sgn⟩ = 0` on both groups | Pass | R04 |
| F06 | radical base change | `𝔽₂[C₂] ⊆ 𝔽₄[C₂]` | `(1+t)² = 0`; quotient `𝔽₄`; `rad = (1+t)` | Pass | R06 |

**Headlines.** The README's end theorems (`README.md:12–22`):
- Stated: the count; integral surjectivity; reciprocity; the `O[G]`/`k[G]` block bijection; conjugacy of defect groups; Sylow defect groups of the principal block; the first main theorem; block-section orthogonality; the local third main theorem; the kernel theorem.
- Also stated, with the five definitions: uniqueness of the block decomposition and multiplicativity of the Brauer map.
- Rightly named not statable (they need Brauer characters, of `G` or of centralizers): the Brauer-character basis; generalized decomposition numbers, their orthogonality and the second main theorem.
- Wrongly named not statable: the central-character description of the blocks of `O[G]` (R02).

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, the kernel theorem: settled as uncertified and cited by locator. The statement was checked mathematically (rows H12, S8.2), not against the text.
- Serre (`serre`), Part III, §§15–18: settled as uncertified, and cited by no target (R10).
- The extractions of Sambale Theorem 1.14 (sambale line 470) and Martínez Corollary 2.4 (martinez line 454) lose the complex-conjugation bar. The README's conjugate form was confirmed by computation (`C₃`: `3` with the bar, `0` without), not against the rendered page.
- Ownership against open pull requests covers the 439 heads in the service's index of 2026-11-11T01:54:58Z.

## Source issues

- **Error** in webb at §9.4, printed p. 148 (webb line 6229–6232): the source says that a primitive `m`-th root of unity in `F`, with `m` the exponent, gives one in `k`; it should say that only the `p′`-part of `m` survives, since `−1` reduces to `1` in characteristic `2`; affects nothing.
- **Misprint** in webb at the remark after Theorem 9.2.7, printed p. 144 (webb line 6057–6060): the source says `𝔽_p(ζ)`, with `ζ` a primitive `m`-th root of unity and `m` the exponent, is a splitting field; it should take a primitive root of order the `p′`-part of `m`, since none of order `m` exists when `p ∣ m`; affects nothing.
- **Gap** in webb at Corollary 9.5.6, printed p. 160 (webb line 6712–6713): the source states `C = DᵀD` for every splitting `p`-modular system, while Theorem 9.5.4, which it rests on, assumes `R` complete; it should assume completeness or pass to the completion; affects nothing.
