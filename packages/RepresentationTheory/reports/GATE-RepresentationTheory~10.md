# GATE-RepresentationTheory~10: answers to the human review of 2026-10-18 to 2026-10-20

Every comment concerns the CharacterTheory sub-roadmap: `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md` (below, "README") and `.../CharacterTheory/Suggested.lean` ("Suggested.lean"). Every review repair is in these two files. The family index `TauCetiRoadmap/RepresentationTheory/README.md` is not touched; the family folder receives an empty `Suggested.lean` (see Build and gate). The brief's "may edit" paths are read here as the pull request's roadmap files inside `TauCetiRoadmap/RepresentationTheory/`; the edits stay within that folder. Points are numbered in order: roed-math 2026-10-18 (H01–H06), kim-em 2026-10-18 (H07), roed-math 2026-10-19 (H08), roed-math 2026-10-20 (H09–H11). H01–H08 were repaired by commits `ea1a2eec` and `56fee0a9`, before head `756d1a4`, and were re-verified at head. H09–H11 were still open at head and are repaired in commit `1e0457e6`.

## H01 (roed-math) — applied

Layer 6 item 3 (README lines 790–842) now defines `A_e` as the maximum canonical power-basis coefficient of `zeta(e)^j`, sets `B_G = |G|·A_e`, bounds the actual central preimage by `|b_k| ≤ |C|·A_e ≤ B_G`, and requires `p > 2B_G` (line 832). The S₄, p = 13 instance is recorded there: `B_G ≥ 24`, so `p > 48` is required, 13 is excluded, and the central value 8 lies in the window.

## H02 (roed-math) — applied

README lines 782–786 say that a left eigenspace is the right kernel of `M_iᵀ − λI`, never of `M_i − λI`, and the solver consumes `ClassData.centralCharacterSearch`, which transposes. Suggested.lean `leftEigenspaceBasis` is `kernelBasis (Mᵀ - a • 1)`. On the S₃ example, `(1,3,2)·M = 3·(1,3,2)` while `ker(M − 3I) = ⟨(1,1,1)⟩`; the transposed form returns `(1,3,2)`.

## H03 (roed-math) — applied

Suggested.lean now uses the native objects: `ClassFunction` is an abbreviation of `TauCeti.ClassFunction` (line 67), `characterPairing` is the native bundled form (line 89), the Burnside theorem is `TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow` (line 523), the central character is `TauCeti.Representation.centralCharacter`, and the solver is `TauCeti.ClassData.dixonCyclotomicCharacterTable?` (line 808). The "Native integration and comparison targets" section of the README lists the remaining comparison adapters.

## H04 (roed-math) — applied

The README (lines 1317–1323) declares the displacement order `(x₁,y₁,x₂,y₂)` and gives the renaming from the source's stacked `(x₁,x₂,y₁,y₂)`. With that order, `t = (1,0,1,0)` is the common horizontal translation, and the displayed matrix annihilates it.

## H05 (roed-math) — applied

README lines 1425–1438 say "the full `S₄`-orbit" for both the standard and the `E` seeds, and state that the `S₃`-orbit and the `D₄`-orbit of the respective fixed seeds are singletons.

## H06 (roed-math) — applied

README lines 1078–1085 and the `IsTISet` docstring (Suggested.lean line 1198 ff.) apply the T.I. isometry to `χᵢ − χⱼ` only when the degrees are equal. For arbitrary degrees they use `TauCeti.ClassFunction.indExtend` (`Ind(φ − φ(1)·1_H) + φ(1)·1_G`) with `characterPairing_indExtend_indExtend`. The norm-two computation is kept as a separate step.

## H07 (kim-em) — answered

The four repairs and two clarifications described in this comment are present at head and were re-verified under H01–H06 above. The "kernel evaluator" wording that remained in the README is repaired under H11.

## H08 (roed-math) — applied

Layer 6 (README lines 870–930) enumerates the actual finite output of `centralCharacterSearch`. The text says it must not construct `FinEnum (Fin r → ZMod p)` or scan the `p^r` codes (line 885). Conjugate slices come from class-power permutations `P_b(k) = d.index((d.rep k)^b)`, with the ratio `b_j` defined by `a_0·b_j ≡ a_j (mod e)` for the native primitive-exponent order, and the `e = 1` branch is stated explicitly. The result is an `r × r × φ(e)` residue array, so no tuple of permutations is materialised. Layer 6 also states soundness and bounded-completeness contracts against the native certificate, and keeps `#eval` acceptance.

## H09 (roed-math) — applied

The theorem `character_galois_pow` is deleted from Suggested.lean. It postulated `∃ σ : ℂ →+* ℂ, ∀ g, σ (χ g) = χ (g ^ k)`, which needs a transcendence-basis extension and gives no action. The Layer 4 Galois bullet (README) now consumes the action on `ℚ(ζ_e)` from pinned Tau Ceti `TauCeti/RepresentationTheory/CharacterTable/CyclotomicAction.lean`:
- `IsPrimitiveRoot.cyclotomicVirtualCharacterAction : Gal(K/ℚ) →* Multiplicative (AddAut (virtualCharacters L G))` supplies the action laws.
- `…_apply` gives the value formula `χ(g ^ j)`.
- `…_mem_irreducibleCharacters` and `cyclotomicIrreducibleCharacterAction` give the permutation of the irreducible characters.
- `ClassFunction.powMap` is the class-function form.

The field of values is the one new target, `fieldOfValues_eq_map_fixedField_stabilizer`: `ℚ(χ) = ι(K^H)` with `H` the stabilizer. Its proof route goes through descent and the Galois correspondence. Four computed Checks are attached (C₄, sign of S₃, Q₈, trivial group), and a class-function counterexample shows why `χ` must be a character. The conventions paragraph (line 66 ff.) and the Layer 6 class-power paragraph now say that `σ_b` is an automorphism of `ℚ(ζ_e)`, not of `ℂ`.

## H10 (roed-math) — applied

The Brauer bullet of Layer 4 now consumes `TauCeti/RepresentationTheory/Induction/Cyclotomic/SplittingField.lean` and does not plan it again: `TauCeti.virtualCharacters_eq_map_of_isPrimitiveRoot`, `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot`, `…_of_isCyclotomicExtension` and `…_adjoin_of_isPrimitiveRoot`. Suggested.lean imports the module and pins the last declaration with `#check`. One adapter is assigned: `ULift`/`Shrink` transport for `G : Type v`, because the pinned theorems put `K`, `L` and `G` in one universe. The compatibility of `ℚ⟮ζ⟯` with the exact ring is identified with the existing Layer 6 targets `cyclotomicFieldEmbedding` and `exists_exact_of_integral_mem_cyclotomic` instead of being stated a second time. The abstract-`K` theorem `…_of_isCyclotomicExtension` makes a separate `CyclotomicField e ℚ` versus intermediate-field comparison unnecessary.

## H11 (roed-math) — applied

Conventions, README line 90: "a definition that reduces by the kernel evaluator" → "a definition that the compiler executes, tested by `#eval`". The README adds that kernel reduction is neither required nor available, because `TauCeti.Cyclotomic.lift` uses `ZMod.inv = Nat.gcdA`, which is defined by well-founded recursion (`TauCeti/RingTheory/Cyclotomic/Lift.lean`, lines 86–89, at the pin). No other occurrence of "kernel evaluator" remains.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `fieldOfValues_eq_map_fixedField_stabilizer` | `G = C₄`, `χ(g) = i` | `e = 4`, `K = ℚ(i)`, `Gal = {1, σ}` with `j(σ) = 3`, `χ(g³) = −i ≠ i`, so `H = 1`, `K^H = ℚ(i)`, `ℚ(χ) = ℚ(i)` | holds | Check added |
| same | sign of `S₃` | `e = 6`, `K = ℚ(√−3)`, `j = 5`, `sgn(g⁵) = sgn(g)`, `H = Gal`, `K^H = ℚ = ℚ(χ)`; the wrong model "`ℚ(χ) = K`" gives `ℚ(√−3)` | holds; wrong model refuted | Check added |
| same | 2-dim character of `Q₈` | values `2, −2, 0, 0, 0`; `e = 4`, `j = 3`, `χ(g³) = χ(g)` on every class, so `H = Gal(ℚ(i)/ℚ)` and `ℚ(χ) = ℚ` | holds | Check added |
| same, degenerate | trivial group | `e = 1`, `K ≅ ℚ`, `ZMod 1` gives `j = 0`, `g⁰ = 1 = g`, `H = ⊤`, `fixedField ⊤ = ⊥`, `adjoin ℚ {1} = ⊥` | holds | Check added |
| same, with `hχ` dropped | `G = C₃`, `f(1) = 1`, `f(g) = f(g²) = i` | `j = 2`: `f(g²) = i = f(g)`, so `H = Gal`, `ι(K^H) = ℚ`, but `ℚ(f) = ℚ(i)` | false without `hχ`, so the hypothesis is needed | negative control added |
| same, dependence on `ι` and on the root | two embeddings `ℚ(i) → ℂ` | `H` is defined from `χ` and `autToPow`, and `autToPow σ` does not depend on which primitive root is used (`σ(ζᵃ) = ζ^{aj}`); the image `ι(K^H)` is the same for `ι` and `ῑ` because `K^H` is Galois-stable (`K/ℚ` is abelian) | holds | stated in proof route |
| Context of the Lean statement | elaborated type, `#check @…` in a scratch file | binders `{G : Type} [Group G] [Finite G] {K : Type} [Field K] [CharZero K] [Algebra K ℂ] [IsCyclotomicExtension {exponent G} ℚ K]`, `hχ`, `H`, `hH`; `NeZero (exponent G)` from `Monoid.neZero_exponent_of_finite` | agrees with the README | none |
| Universe of the splitting-field supplier | `G : Type v`, `v > 0` | pinned `…_adjoin_of_isPrimitiveRoot` needs `G : Type`, and `…_of_isPrimitiveRoot` needs `K L G : Type u` with `ℂ : Type` | gap is real | `ULift`/`Shrink` adapter assigned |
| H01 bound | `S₄`, `p = 13` | `A_12 ≥ 1`, `B_G ≥ 24`, `2B_G ≥ 48 > 13`; the value 8 ≤ `|C|·A_e = 8·A_12` | the old counterexample is excluded | none |
| H02 side | `S₃` transposition class | `(1,3,2)·M = (3,9,6)`; `Mᵀ − 3I` has kernel `(1,3,2)` | the transposed form is correct | none |

## Signature check

I put `#check @TauCetiRoadmap.RepresentationTheory.CharacterTheory.fieldOfValues_eq_map_fixedField_stabilizer` in a scratch file and elaborated it once against the built module. The elaborated type, reproduced in the table above, matches the README statement. It is the only declaration whose signature changed: `character_galois_pow` was removed, and nothing in the README or the other roadmaps names it (repository-wide grep).

## Pins and verification limits

- The pull-request branch's `lake-manifest.json` pins Tau Ceti `a91d3aaf`. The brief's pins and `origin/main` pin Tau Ceti `358314d`. `CyclotomicAction.lean` exists only at `358314d`, and the README cites it at that pin. The Lean statement was written so that it elaborates at both pins: the stabilizer is characterised by its value formula instead of being named through `cyclotomicIrreducibleCharacterAction`.
- `SplittingField.lean` and the `#check`ed declaration have the same signature at both pins (checked in both sources).
- The Mathlib names cited in the README were checked at the brief's Mathlib pin: `IsGalois.fixedField_fixingSubgroup` (`FieldTheory/Galois/Basic.lean:332`) and `IsPrimitiveRoot.autToPow` (`RingTheory/RootsOfUnity/PrimitiveRoots.lean:784`).
- No sources were fetched. The Isaacs (Chapter 9) and Serre (§12.4) locators are the ones the pinned Tau Ceti modules themselves cite. Because no legal copy was read, I did not cite a lemma number.
- Ownership: the Galois action and Brauer splitting are owned by pinned Tau Ceti and are consumed. The field-of-values theorem was checked with `roadmaps grep` for `field of values`/`fixedField`: no roadmap on main or at an open head states it for finite-group characters, so this roadmap owns it. Two roadmaps import it from CharacterTheory Layer 4: ClassicalArithmeticCompletion on main (supplier contract: the cyclotomic action, with the field of values as fixed field) and the open ArtinRepresentations (Layer 4: power maps, field of values). The repaired Layer 4 supplies exactly that cyclotomic form.
- Not changed, but noticed and outside the review points: Suggested.lean imports `Mathlib.NumberTheory.*` submodules and declares `cyclotomicRingEquiv` and `cyclotomicFieldEmbedding` with `sorry` bodies (sorry'd data).

## Build and gate

- `TauCetiRoadmap/RepresentationTheory/Suggested.lean` was missing, because the family folder never had one. It is now added: a single `import Mathlib`, the module docstring "Representation theory: target signatures", and the empty namespace `TauCetiRoadmap.RepresentationTheory`. The docstring says that the family `README.md` is an index that owns no mathematics. Every headline theorem of the family belongs to a member roadmap and is stated in that member's own `Suggested.lean`, so restating one here would plan it twice. The file therefore declares nothing, and there were no declarations to `#check`. The family `README.md` is unchanged.
- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Build completed successfully (8976 jobs).`
- `lake build TauCetiRoadmap.RepresentationTheory.CharacterTheory.Suggested` (from the earlier repair round of this job): `Build completed successfully (9232 jobs).` It gave 43 `declaration uses 'sorry'` warnings and no errors.
- Gate: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (family README): `depcheck: 189 roadmaps, 1159 edges, 0 problem(s)`. It reported no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the CharacterTheory README found no cross-roadmap citations and no Lean names that appear nowhere.
- Commits: `1e0457e6` "RepresentationTheory: review repairs (cyclotomic Galois action, field of values, splitting field consumed, compiler-executable wording)" and `dfed2ba9` "RepresentationTheory: review repairs (family-level Suggested.lean; the index states no headline of its own)". Neither is pushed.
