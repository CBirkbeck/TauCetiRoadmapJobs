# Review of ModularCharactersAndBlocks (pull request #1775 at 07303de)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

Full review of the folder at `07303de`. Six of the previous review's seven findings are repaired; the family-index sentence is not, and is carried as R02. The full pass found one new defect, a Check in §3.1 whose stated value is wrong (R01). Both are P3. The gate, the dependency check, the elaboration, the seeded locator sample and the padding probe are clean.

## R01 (P3) — §3.1: the non-projective control in the pairing Check has the wrong value

**Location:** `README.md:578–580`: “`C₂` at `p = 2` with `P = U = k[C₂]` … with the trivial module, which is not projective, in place of `P` it would give `1/2`, so projectivity of `P` is needed.”

**Claim:** replacing `P` by the trivial module (with `U = k[C₂]` kept) makes the formula give `1/2`, which refutes it for a non-projective `P`.

**Witness:** only `1` is `2`-regular. With `P = k` and `U = k[C₂]` the formula gives `φ_k(1) φ_U(1) / |G| = 1·2/2 = 1`, and `dim Hom_{k[C₂]}(k, k[C₂]) = 1` (the socle `k(1 + t)`). So the formula holds on this instance and it shows nothing about projectivity. The value `1/2` arises only when `U` is replaced as well.

**Repair:** end the bullet with: “with the trivial module, which is not projective, in place of both `P` and `U` it would give `1·1/2 = 1/2`, whereas `dim End(k) = 1`, so projectivity of `P` is needed.” Tested: `P = U = k` gives `1/2 ≠ 1`; `P = U = k[C₂]` gives `2·2/2 = 2 = dim End(k[C₂])`, as the first half of the bullet says.

## R02 (P3) — The family index still names this roadmap the owner of Brauer characters

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** this roadmap owns the Brauer character.

**Witness:** the folder imports the Brauer character, its projective pairing and the independence of the simple Brauer characters from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (`README.md:91–100`, `:213–222`, `:399–402`, `:428–429`), and the decomposition map over finite extensions of `ℚ_p` from ArithmeticGaloisDuality §R02.4.4 (`README.md:81–90`, `:204–211`). The index sentence is unchanged since the two previous reviews (their R01 and R05); `git log` shows no commit on the index after `4e678ad2` other than the merge of main. No repair report marks it not actionable, and the family index is this pull request's own file.

**Repair:** in the index, write: “… consumes both, takes the Brauer character and its projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and the decomposition map over finite extensions of `ℚ_p` from ArithmeticGaloisDuality §R02.4.4, and owns the Brauer-character basis theorem, the decomposition map of an arbitrary `p`-modular system, decomposition matrices, Brauer reciprocity and blocks with defect.” Tested: every sentence of the folder's Scope and ownership then agrees with the index.

## Previous findings

- **R01 (kernel theorem and block-section orthogonality statable but absent) — repaired.** `Suggested.lean:98` defines `SameBlock`, `:203` `pPrimeCore`, `:175` states `sum_sameBlock_mul_conj_eq_zero` and `:210` `mem_pPrimeCore_iff_forall_principalBlock`; the docstring (`:28–32`) now names only “the agreement of the central-character relation with the partition … by the block idempotents of `O[G]`” as not statable. The README names all four (`:625`, `:887`, `:965`, `:1002`). The file elaborates with ten `sorry` warnings.
- **R02 (decomposition map also in ArithmeticGaloisDuality §R02.4.4) — repaired.** `README.md:81–90`: “ArithmeticGaloisDuality, §R02.4.4 (*Surjectivity of the decomposition map*) … §1.2 keeps the reduction of lattices over an arbitrary `p`-modular system”; supplier contract at `:204–211`; cited in §1.2 (`:341–343`) and in §2.4 with its *Needs:* (`:502–506`, `:515`); the `C₂ × C₂`, `p = 3` Check is at `:529–531`.
- **R03 (projective/simple pairing also in GL2AutomorphicRepresentationsAndTransfer §R17.5.11) — repaired.** `README.md:95–100` and `:218–222` import the pairing, the duality and the independence; §2.2 (`:428–431`) proves only the count; §3.1 (`:554–558`) keeps the formula for arbitrary `P` and `U` “by the decomposition of `P` into projective covers”. One of the new Checks is wrong: R01 above.
- **R04 (`TauCeti.IsAdicComplete.…`) — repaired.** `README.md:44`, `:362`, `:369` read “`IsAdicComplete.exists_isIdempotentElem_eq` (root namespace …)”; `#check` elaborates at the pin.
- **R05 (family index) — not repaired.** Carried as R02.
- **R06 (block covering without statement) — repaired.** `README.md:954–963` defines covering by orbit sums and states the three-way equivalence; three covering Checks at `:988–997`.
- **R07 (relative trace without Checks) — repaired.** `README.md:765–770`: `Tr_1^P(r) = r + r²`, `Tr_1^P(1) = 0`, `Tr_P^P = id`.

## Verified sound

**Head and scope.** The worktree is clean at `07303de`. The pull request changes the folder's `README.md` (1074 lines), `Suggested.lean` (216 lines) and the family index; the brief's command for changes outside the folder and the family index prints nothing.

**Gate.** The worker's gate on this head: every counter `0`, `OK`.

**Dependency check** (the brief's command), complete output:

```text
depcheck: 235 roadmaps, 2132 edges, 0 problem(s)
```

ArithmeticGaloisDuality is line 62 of the merge order, GL2AutomorphicRepresentationsAndTransfer line 101, this roadmap line 102; OddOrderTheorem is line 401. Every other supplier is on main.

**Elaboration.** `lake env lean` on `Suggested.lean`: ten `declaration uses sorry` warnings (lines 47, 61, 77, 118, 136, 146, 158, 175, 187, 210) and nothing else. Imports: `Mathlib` and three `TauCeti.*` modules, all used. No `set_option`, no sorried data.

**Signatures.** The elaborated types of all 15 declarations were compared with the README statements. No binder is lost. `sum_sameBlock_mul_conj_eq_zero` and `mem_pPrimeCore_iff_forall_principalBlock` carry `[M.IsMaximal]` and `p ∈ M`, as §7.2 and §8.3 state; `brauer_first_main` and `brauer_third_main_local` carry `IsAlgClosed k`; the defect-group theorems hold for any field of characteristic `p`. Nothing changed.

**Padding probe.** A scratch copy with every `sorry` replaced by `first | rfl | infer_instance | simp | aesop | decide`: all ten theorems fail. The five definitions have real bodies and none restates a library definition; neither pin has a `p'`-core, a Brauer map, defect groups or a block relation (grep for `pPrimeCore`, `pCore`, `IsDefectGroup`, `brauerMap` over both pins: no hit).

**Headline inventory** (`README.md:12–20`). Stated: Brauer's count, the `O[G]`/`k[G]` block bijection, conjugacy of defect groups, Sylow defect groups of the principal block, the first main theorem, block-section orthogonality, the local third main theorem, the kernel theorem; also uniqueness of the block decomposition and multiplicativity of the Brauer map. Named as not statable, rightly: reciprocity, decomposition-map surjectivity and the Brauer-character basis (no Brauer character and no lattice reduction over a complete DVR at the pins; `TauCeti.reductionK0`, `LatticeDefect/Basic.lean:105`, takes `ℤ`-forms); generalized decomposition numbers and the second main theorem (Brauer characters of centralizers); the agreement of `SameBlock` with the blocks of `O[G]` (`TauCeti.Representation.primitiveCentralIdempotent`, `CentralIdempotent.lean:301`, needs an algebraically closed field).

**The partition defined by `SameBlock M` does not depend on `M`.** The block partition of `Irr(G)` is the set of connected components of the linking graph (`χ ~ ψ` when `∑_{g p-regular} χ(g) ψ(g⁻¹) ≠ 0`), which involves no ideal. So the two new headlines are true for every maximal `M ∋ p`, as stated.

**The seeded sample: every locator checked against the text.** Printed page = PDF page − 7 in `webb`, − 8 in `martinez`, − 5 in `craven`, = PDF page in `sambale`. Each supports the statement as written.

| Target | Locators verified (`<source> line N`) |
| --- | --- |
| §0.1 Sections | Webb Lemma 9.3.4 p. 146 (`webb` 6147: unique commuting factorisation, conjugacy of factors; nothing more, as the README says); Martínez p. 3 |
| §0.2 Block idempotents | Webb Prop 12.1.1 p. 227 (`webb` 9585), Cor 12.1.3 p. 228 (9608); Martínez Thm 2.11 p. 15 (`martinez` 648) |
| §1.2 Stable lattices | Webb Thm 9.4.8 p. 153 (`webb` 6434); Martínez Thm 1.7, Lemma 1.8 p. 4 (`martinez` 189, 196) |
| §1.3 Lifting | Webb Prop 9.4.3 p. 149 (`webb` 6276: lifting and primitivity), Prop 9.4.5 p. 151 (6334) |
| §2.1 Brauer characters | Webb Prop 10.1.3 p. 170 (`webb` 7179); Martínez Lemmas 1.1–1.2 pp. 2–3 (`martinez` 130, 150); induction formula p. 37 (1385) |
| §2.2 Basis and count | Webb Thm 10.2.2 p. 176 (`webb` 7438), Thm 9.3.6 p. 147 (6167); Martínez Prop 1.5 p. 3 (174), Thm 1.9 p. 5 (219) |
| §2.4 Decomposition map | Webb Prop 10.3.2 p. 182 (`webb` 7703), Cor 10.2.4 p. 178 (7502), Thm 9.4.11 p. 155 (6518); Martínez Def 1.6 p. 3 (178), Thm 1.7 p. 4 |
| §4.1 Ordinary idempotents | no text locator; CharacterTheory §3.5 on main and `TauCeti.Representation.primitiveCentralIdempotent` resolve |
| §4.2 Block partitions | Martínez Def 2.1 p. 9 (`martinez` 365), Thm 2.2 p. 10 (375), Thms 2.11–2.12 p. 15 (648, 663); Sambale Def 1.6 p. 15 (`sambale` 367) |
| §5.2 Orthogonality | Sambale Thm 1.14 p. 16 (`sambale` 465) |
| §6.1 Traces, Brauer map | Webb Prop 12.4.1 p. 238 (`webb` 10047), Lemma 12.5.3 p. 245 (10341), Cor 12.5.4 p. 246 (10365), Lemma 11.6.8(2) p. 215 (9091); Martínez Thm 4.1 p. 23 (`martinez` 894) |
| §6.3 Brauer pairs | Craven Def 2.6 p. 22 (`craven` 814), Lemma 2.7 p. 23 (823), Def 2.8 p. 23, Lemma 2.9 p. 24 (856), Thms 2.11–2.12 p. 25 (891, 897) |
| §7.2 Second main theorem | Sambale Thm 1.13 and Prop 1.11 p. 16 (`sambale` 445, 438), Thm 1.14 p. 16 (465: `u = v`, `b_u = b_v`, `b_u^G = B`); Martínez Cor 2.4 p. 11 (`martinez` 451: `g` regular, `x` singular, as the README restricts it) |
| §7.3 Third main theorem | Sambale Thm 1.15 p. 17 (`sambale` 478: iff, `C_G(D) ⊆ H`); Martínez Cor 5.9 p. 35 (`martinez` 1370: one direction) |
| §8.2 Normal `p'`-subgroups, covering | Martínez Thm 8.5(iii) p. 52 (`martinez` 1933), Def 7.3 and Problem 7.4 p. 44 (1638, 1642: orbit sum `= ∑ e_B` over the covering blocks), Thm 7.7 p. 45 (1710: (i)–(iii) for `χ ∈ B`, `B ⊆ Irr ∪ IBr`); Sambale Thm 1.24 p. 18 (`sambale` 547) |

The README flags no locator as unverified.

**Library declarations at the pins.** Elaborated by `#check`: `TauCeti.irreducibleCharacter` (index `Fin (Nat.card (ConjClasses G))`, needs `IsAlgClosed` and `Invertible (Nat.card G)`), `TauCeti.irreducibleCharacters` (`Table.lean:114`: characters of irreducible representations on `Fin n → k`), `TauCeti.irreducibleCharacter_mem`, `TauCeti.sum_characterTable_mul_conj` (`|G|/|C|` when `C = C'`, else `0`), `TauCeti.Representation.centralCharacter`, `IsAdicComplete.exists_isIdempotentElem_eq` (kernel `I • ⊤`), `TauCeti.pPart_conj`, `TauCeti.pFreePart_conj`, `TauCeti.eq_pPart`, `TauCeti.pPart_mul_pFreePart`, `TauCeti.orderOf_pPart`; Mathlib `IntermediateField.adjoin.finiteDimensional`, `littleWedderburn`, `Ring.jacobson_le_of_eq_bot`, `exists_isIdempotentElem_eq_of_ker_isNilpotent`, `MonoidAlgebra.ofCoeff`. Read in the pinned source (object files not built): `Representation.mem_ker_iff_char_eq` (`CharacterTable/Kernel.lean:115`, root namespace `Representation`, `g ∈ ρ.ker ↔ ρ.character g = ρ.character 1`), `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` (`Idempotents/Simple.lean:93`, root namespace), `Ideal.nonempty_linearEquiv_of_quotient_smul_top` (`Projective/Reduction.lean:73`), `TauCeti.exists_projective_quotient_smul_top_linearEquiv` (`Projective/Lift.lean:89`), `TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` (`Primitive/Decomposition.lean:223`, Artinian), `TauCeti.cartanMatrix` (`GrothendieckGroup/CartanMatrix.lean:138`), `TauCeti.projectiveSimplePairing_isPerfPair` (`:115`), `TauCeti.cartanMap` (`CartanMap/Basic.lean:414`), `TauCeti.resK0`, `TauCeti.indK0`, `TauCeti.reductionK0`, `TauCeti.pSectionIndicator` (`Induction/PElementary.lean:91`), `TauCeti.Cyclotomic.complexRoot` (`Cyclotomic/Basic.lean:536`), `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` (`Cyclotomic/SplittingField.lean:107`).

**Cross-roadmap citations resolved.**
- ArithmeticGaloisDuality §R02.4.4 at its open head: the paragraph *Surjectivity of the decomposition map* (its `README.md:3636`) states `d : modRepK0 K G → modRepK0 k G` for `K` finite over `ℚ_p` with the `|G|`-th roots of unity, independence of the lattice, compatibility with `modRepK0.ind`/`res`, `d ⊗ ℚ` surjective, and says integral surjectivity is not needed there. This is exactly what the supplier contract assumes.
- GL2AutomorphicRepresentationsAndTransfer §R17.5.11 at its open head: the Brauer character for `τ`, value at `1`, conjugacy invariance, additivity, the lattice comparison, recognition; its proof paragraph gives the Hom pairing, duality and independence, and its *Needs:* line says the projective pairing is owned there. §R17.5.12 is Fong–Swan.
- On main: SemisimpleAlgebras Layers 0–2, QuiverRepresentations Layer 3, GrothendieckEulerForms Layers 2 and 4, ModularInduction Layers 0, 1, 3, CharacterTheory §§3.5, 4.3, 4.5, InductionRestriction Layer 6. The worker's resolver lists no citation or Lean name as found nowhere, and I found none.

**Ownership by object** (`roadmaps grep` over main and the 438 open heads of the index of 2026-11-10T20:41:31Z). No other roadmap states block idempotents, the Brauer map, defect groups, Brauer pairs, block covering or the central-character relation. `pPrimeCore`: LocalFiniteGroupTheory's `Suggested.lean:50` declares a relative `pPrimeCore p H` under its own namespace (a different fully qualified name, and not a permitted supplier); OddOrderTheorem §1.1 defines the `π`-core at line 401 of the merge order, after this roadmap, so §8.2 is the earlier owner. `overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision.

**Pull-request description.** Its prose agrees with the head (ten theorems, five definitions, two suppliers not on main). The generated `depends-on` block lists only GL2AutomorphicRepresentationsAndTransfer; ArithmeticGaloisDuality is an open supplier too since this head cites §R02.4.4. The block is generated by the tools and is regenerated by the worker, so this is recorded here and not raised as a finding.

**Adversarial computations.** Notation: `r = (123)`, `t = (12)`, `ζ = ζ₃`, `α ∈ 𝔽₄` with `α² + α + 1 = 0`; in `𝔽₂[S₃]`, `e₀ = 1 + r + r²`, `e₁ = r + r²`; in `S₅` at `p = 3`, `D = ⟨(123)⟩`, `s = (45)`. All values computed this round.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| H01 | `complete_blockIdempotents_unique` | `𝔽₃[C₂]`; `𝔽₂[S₃]`; `G = 1` | `(2+2t)² = 8+8t = 2+2t`, `e₊e₋ = 0`, families differ by the swap; `{e₀, e₁}`, `2 = 2`; `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; `ℤ₂[C₂]` | `(1+r+r²)/3 ↦ e₀`, `(2−r−r²)/3 ↦ e₁` (`1/3 ≡ 1`); `1 ↦ 1`, `(1±t)/2 ∉ ℤ₂[C₂]` | Pass | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` | `S₃` at 2, 3; `G = 1`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` (not algebraically closed) | Pass | none |
| H04 | `brauerProjection_mul` | `S₃`, `p = 2`, `P = ⟨t⟩`; three controls | `Br(e₁²) = 0 = 0²`; `x = r, y = r²`: `1 ≠ 0`; over `ℚ`: `(r+r²)² = 2 + r + r²`, `2 ≠ 0`; `P = C₃`, `x = K_t`: `x² = 3e₀ = e₀ ≠ 0 = Br(x)²` | Pass | none |
| H05 | `IsDefectGroup`, `isDefectGroup_conj` | `S₃`, `p = 2` | `e₀`: `Br_{⟨t⟩} = 1 ≠ 0`, three conjugate groups of order 2; `e₁`: `Br_{⟨t⟩} = 0`, `Br_1 = e₁ ≠ 0`, defect `1`; `C₃` at 2 without the `p`-group clause: `Br_{C₃}(e₀) = e₀ ≠ 0` | Pass | none |
| H06 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `𝔽₂[S₃]` | `aug e₀ = 3 = 1`: 3 Sylows = 3 defect groups; `aug e₁ = 2 = 0`: defect `1`, not Sylow | Pass | none |
| H07 | `brauer_first_main` | `S₅`, `p = 3`; `D = 1` | `ω(K_s)`: `1 ↦ 10 ≡ 1`, `sgn ↦ −10 ≡ 2`, `χ₄ ↦ 10·2/4 = 5 ≡ 2`, so `χ₄ ∈ B₂`; `Br_D(e_{B₁}) = (1+s)/2`, `(1+s)/2 · (1−s)/2 = 0`; `D = 1`: `e·e = e` | Pass | none |
| H08 | `sum_sameBlock_mul_conj_eq_zero` | `S₃`, `p = 2`, `M ∋ 2`; `p = 3`, `M ∋ 3`; controls | `B₀`, `g = r`, `h = t`: `1 − 1 = 0`; `{std}`: `(−1)·0 = 0`; `p = 3`, `g = 1`, `h = r`: `1 + 1 − 2 = 0`; same `p`-parts `g = h = t`: `2 ≠ 0`; `M ∋ 2` with `p = 3`, `g = 1`, `h = r`: `1 + 1 = 2 ≠ 0`, so `p ∈ M` is needed | Pass | none |
| H09 | `brauer_third_main_local` | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1` | `Br_P(e₀) = 1`, product `1 ≠ 0`, `aug 1 = 1`; `H = G`: `e₀ b ≠ 0 ⇔ b = e₀` | Pass | none |
| H10 | `mem_pPrimeCore_iff_forall_principalBlock`, `pPrimeCore` | `S₃` at 2, 3; `G = 1`; control | `p = 2`: `sgn`: `3(−1−1) = −6 ∈ M`, `std`: `−3 ∉ M`; `ker 1 ∩ ker sgn = C₃ = O_{2'}`; `p = 3`: `−6`, `−3`, `2(−½−1) = −3 ∈ M`, `std` faithful, `1 = O_{3'}`; `M ∋ 2` with `p = 3`: right side `C₃ ≠ 1` | Pass | none |
| H11 | `SameBlock` (§4.2 Checks) | `C₃`, `M ∋ 2`, `M ∋ 3` | `ζ − 1` of norm `3`, not in `M ∋ 2`: three classes; `(1 − ζ)² = 1 − 2ζ + ζ² = −3ζ ∈ M`: one class; without the class size `−3/2` is not integral | Pass | none |
| S01 | §0.1 sections | `S₃` at 2, 3; `C₆` | sizes `3 + 3`, classes `3 = 2 + 1`; sizes `4 + 2`; `g = g³ · g⁴`, orders `2 · 3` | Pass | none |
| S02 | §0.2 scalar extension | `𝔽₂[C₃] → 𝔽₄[C₃]` | `(1 + α²r + αr²) + (1 + αr + α²r²) = 2 + (α + α²)(r + r²) = r + r²` | Pass | none |
| S03 | §1.2 lattices | `G = 1`; `C₂`, `p = 2`; `V = 0` | `O/m`, `m/m²`: class `1`; non-split `k[C₂]` and `k ⊕ k`: class `2`; `0` | Pass | none |
| S04 | §1.3 lifting | `ℤ₂`; `ℤ₂[C₃]` | `0, 1 ↦ 0, 1` though `(2)` is not nilpotent; see H02 | Pass | none |
| S05 | §2.1 formulas | `C₃/𝔽₄`; `Ind_1^{S₃} 1` at 2 | `(1, ζ, ζ²)`, dual `(1, ζ², ζ)`; `(6, 0) = 2(1, 1) + 2(2, −1)` | Pass | none |
| S06 | §2.2 basis | `S₃`, `p = 3` | `det [[1,1],[1,−1]] = −2 ≠ 0`; independence (imported) plus count `2 = 2` gives spanning | Pass | none |
| S07 | §2.4 `D` | `S₃` at 3, 2; `C₂`; `C₂ × C₂` at 3 | `(2, 0) = (1,1) + (1,−1)`; `[[1,0],[1,0],[0,1]]`; `[[1],[1]]`; `e = 2`, `K = ℚ₃`, `−1` a non-square mod 3, so `i ∉ K` and §R02.4.4 does not apply | Pass | none |
| S08 | §3.1 reciprocity and pairing | `S₃` at 3, 2; `C₂` | `DᵀD = [[2,1],[1,2]]`, `det 3`; `diag(2,1)`; `⟨Φ_1, φ_1⟩ = (2 + 4)/6 = 1`, `⟨Φ_1, φ_std⟩ = (4 − 4)/6 = 0`; `P = U = k[C₂]`: `2 = 2`; `P = k`, `U = k[C₂]`: `1 = 1`; `P = U = k`: `1/2 ≠ 1` | Check wrong | R01 |
| S09 | §4.1 `e_χ` | `C₂/ℚ₂`; `C₃` | `e₊e₋ = (1 − t²)/4 = 0`; `∑_j e_j = 1 + (1 + ζ² + ζ) r/3 + … = 1` | Pass | none |
| S10 | §4.2 partitions | `S₃` at 2, 3 | `ω(K_t) = 3, −3, 0`: `3 ≡ −3`, `3 ≢ 0` mod 2; fibres `3` and `2` over one block | Pass | none |
| S11 | §5.2 orthogonality | `S₃` at 3, 2; `C₃` at 3 | `Q*Q = [[2,1,0],[1,2,0],[0,0,3]]`, `det Q = −2 − 1 = −3`, `9 = 3·3`; `diag(2,1,2)`; with conjugation `3 = c^r`, without `1 + ζ² + ζ = 0` | Pass | none |
| S12 | §6.1 relative trace | `S₃`, `𝔽₂`, `P = ⟨t⟩` | `Tr_1^P(r) = r + t r t = r + r²`; `Tr_1^P(1) = 2 = 0`; `Tr_P^P = id` | Pass | none |
| S13 | §6.3 Brauer pairs | `S₃`, `p = 2`, `Q = ⟨t⟩`; `Q = 1` | `Br_Q(e₀)·1 = 1`, `Br_Q(e₁) = 0`; `Br_1(e_B) f = f ⇔ f = e_B` | Pass | none |
| S14 | §7.2 second main theorem, block form | `S₃`, `p = 2`, `u = t`; `g = h = 1` | `d^u = (1, −1, 0)`, nonzero exactly on `B₀`; block sums `2` and `4`, total `6 = |C_G(1)|` | Pass | none |
| S15 | §7.3 Checks | `S₃` at 3, `P = C₃`, `H = S₃` | one block, principal on both sides | Pass | none |
| S16 | §8.2 `e_N`, covering | `S₃`, `p = 2`, `N = C₃`; `N = 1`; `N = G` | `e_N = e₀`, basis `e₀, t e₀`; orbit sums `e₀` and `e_α + e_{α²} = r + r²`; `std_N = ζ + ζ²`; orbit sum `1 = ∑_B e_B`; `B` covers `b ⇔ B = b` | Pass | none |
| S17 | §8.3 route | `S₃` at 2 | `Φ_1 = 1 + sgn` takes `2` on `C₃` and `0` on `t`; `K = C₃` has no `2`-singular element | Pass | none |
| C01 | `TauCeti.sum_characterTable_mul_conj` | `S₃`, `C = C' = [t]` | `1 + 1 + 0 = 2 = 6/3 = |C_G(t)|` | Pass | none |
| C02 | Brauer character vs trace | trivial `𝔽₂[C₃]`-module `𝔽₂²` | trace `0`, Brauer value `2` | Pass | none |
| F01 | R02 witness | index line 133 against `README.md:91–100` | “owns Brauer characters” against “imported from §R17.5.11” | Mismatch | R02 |

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`)** and **Serre, Part III (`serre`)**: settled as uncertified and cited by locator only. The kernel theorem was checked through the README's route (S17) and on instances (H10).
- **Tau Ceti declarations whose object files are not built in this checkout** (listed above as “read in the pinned source”) were checked by reading the source at the pin, not by elaboration.
- **Ownership against open pull requests** rests on `roadmaps grep` over the heads in the index of 2026-11-10T20:41:31Z; pull requests that index does not carry were not searched.

## Source issues

- **Misprint** in webb at Example 12.5.6, p. 246: the source says the principal block `e1` has Sylow defect group and then that `e1` also has defect group `1`; it should be `e2`, the defect-zero block, for the second; affects nothing.
- **Misprint** in webb at the remark after Theorem 9.2.7, p. 144: the source says `𝔽_p(ζ)`, with `ζ` a primitive root of order the exponent `m`, splits `G`; it should be the `p′`-part of `m`, since no such root exists when `p` divides `m`; affects nothing.
