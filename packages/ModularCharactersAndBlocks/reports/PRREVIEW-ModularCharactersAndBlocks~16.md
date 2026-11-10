# Review of ModularCharactersAndBlocks (pull request #1775 at f49016c)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

Full review of the folder at `f49016c`, the head the previous review read; the folder has not changed since then. The previous R01 (family-index ownership sentence) is still unrepaired and is carried as R05. The other six findings are new and come from the full pass. R01 shows that two headlines the docstring calls not statable do elaborate at the pins. R02 and R03 are objects that an earlier open roadmap also owns. Gate, dependency check, build, the seeded locator sample and the padding probe are clean.

## R01 (P2) — The kernel theorem and block-section orthogonality are statable at the pins but absent

**Location:** `Suggested.lean:24–27`: “The ordinary block partition, block-section orthogonality and the kernel theorem … They need the partition of the complex irreducible characters into `p`-blocks through a `p`-modular system, and the core `O_{p'}(G)`, which is not at the pinned Mathlib.”

**Claim:** neither headline can be stated against the pinned libraries.

**Witness:** Two short definitions with real bodies suffice. One is `O_{p'}(G)` exactly as §8.2 defines it. The other is §4.2's central-character block relation modulo a maximal ideal `M ∋ p` of the algebraic integers. With them, the file below elaborates at the pins with two `sorry` warnings only. The README's own proof source states block-section orthogonality in this form (`axiom-section` line 17–22).

**Repair:** add to `Suggested.lean`, under `/-! ## Layer 7 … -/` and a new `/-! ## Layer 8 … -/` section (it also needs `import TauCeti.RepresentationTheory.CharacterTable.Table` and `import TauCeti.GroupTheory.OrderOfElement.PPart`, both present at the pin):

```lean
/-- The `p'`-core `O_{p'}(G)`: the supremum of the normal subgroups of order prime to `p`. -/
def pPrimeCore (p : ℕ) (G : Type*) [Group G] : Subgroup G :=
  sSup {N : Subgroup G | N.Normal ∧ (Nat.card N).Coprime p}

/-- `χ` and `ψ` lie in one `p`-block, for a maximal ideal `M` of the algebraic integers of `ℂ`
containing `p`: their central characters `ω(K_C) = |C| χ(g) / χ(1)` agree modulo `M` on every
class sum (Sambale, Definition 1.6). -/
def SameBlock {G : Type*} [Group G] (M : Ideal (integralClosure ℤ ℂ)) (χ ψ : G → ℂ) : Prop :=
  ∀ g : G, ∃ m ∈ M, ((m : integralClosure ℤ ℂ) : ℂ) =
    (Nat.card (ConjClasses.mk g).carrier : ℂ) * (χ g / χ 1 - ψ g / ψ 1)

theorem mem_pPrimeCore_iff_forall_principalBlock {G : Type} [Group G] [Finite G] {p : ℕ}
    [Fact p.Prime] (M : Ideal (integralClosure ℤ ℂ)) [M.IsMaximal]
    (hpM : (p : integralClosure ℤ ℂ) ∈ M) (g : G) :
    g ∈ pPrimeCore p G ↔
      ∀ χ ∈ TauCeti.irreducibleCharacters ℂ G, SameBlock M χ (fun _ ↦ 1) → χ g = χ 1 := sorry

theorem sum_sameBlock_mul_conj_eq_zero {G : Type} [Group G] [Finite G] {p : ℕ} [Fact p.Prime]
    (M : Ideal (integralClosure ℤ ℂ)) [M.IsMaximal] (hpM : (p : integralClosure ℤ ℂ) ∈ M)
    {ψ : G → ℂ} (hψ : ψ ∈ TauCeti.irreducibleCharacters ℂ G) {g h : G}
    (hgh : ¬ IsConj (TauCeti.pPart p g) (TauCeti.pPart p h)) :
    ∑ᶠ (χ : G → ℂ) (_ : χ ∈ TauCeti.irreducibleCharacters ℂ G ∧ SameBlock M χ ψ),
      χ g * starRingEnd ℂ (χ h) = 0 := sorry
```

Give each theorem a docstring with its locator (Navarro, Theorem 6.10; Martínez, Corollary 2.4, p. 11, with Sambale, Theorem 1.14, p. 16). Use the backticked names in the README: `pPrimeCore` in §8.2, `SameBlock` in §4.2, `sum_sameBlock_mul_conj_eq_zero` in the block-section bullet of §7.2, and `mem_pPrimeCore_iff_forall_principalBlock` in §8.3. Reduce the docstring bullet to what is still not statable: the identification of these classes with the blocks of `O[G]` (§4.2), which needs `e_χ` over a splitting `p`-modular system. The README's prose then says the same as the Lean file.

Tested at the pins: the file elaborates with exactly two `declaration uses sorry` warnings. On `S₃`, `p = 2`, the transposition class gives `3·(−1 − 1) = −6 ∈ M` for `sgn` and `3·(0 − 1) = −3 ∉ M` for `std`. So `Irr(B₀) = {1, sgn}`, the intersection of their kernels is `A₃ = O_{2'}(S₃)`, and block-section orthogonality gives `1·1 + 1·(−1) = 0` at `g = r`, `h = (12)`.

## R02 (P2) — The decomposition map is planned here and in ArithmeticGaloisDuality §R02.4.4

**Location:** `README.md:459–462`: “Define the decomposition map `d : G₀(K[G]) → modRepK0 k G` by reduction of stable lattices (§1.2) … Prove that `d` is surjective”; also §1.2 (`:304–308`). Neither passage, nor Scope and ownership, cites ArithmeticGaloisDuality.

**Claim:** this roadmap is the sole owner of the decomposition map.

**Witness:** ArithmeticGaloisDuality (pull request #858, head `59edfe2`, line 61 of the merge order, before this roadmap's line 101) keeps the decomposition map (its `README.md:477–478`). Its §R02.4.4 (`:3635–3647`) builds `d` from stable lattices, proves it independent of the lattice and compatible with `modRepK0.ind`/`res`, and proves `d ⊗ ℚ` surjective.

**Repair:** under Scope and ownership, add: “ArithmeticGaloisDuality §R02.4.4 (*Surjectivity of the decomposition map*): `d : modRepK0 K G → modRepK0 k G` for `K` finite over `ℚ_p` containing the `|G|`-th roots of unity, its independence of the lattice, its compatibility with induction and restriction, and the surjectivity of `d ⊗ ℚ`.” Add a `### From TauCetiRoadmap.ArithmeticGaloisDuality` supplier contract. Cite it in §1.2 and in the *Needs:* of §2.4, and keep here only what goes beyond it, each with one clause saying how it differs:
- the extension to an arbitrary splitting `p`-modular system (`O` complete, `K` containing the `e`-th roots, `e` the exponent);
- integral surjectivity, which §R02.4.4 says it does not plan;
- compatibility with `modRepK0.baseChange` and with a change of system.

Tested: for `G = C₂ × C₂` at `p = 3`, §1.1 gives `K = ℚ₃`, which lacks `i`. §R02.4.4's hypothesis fails there, so the general variant must be kept, with the clause. For `C₂` at `p = 2`, `K = ℚ₂`, both define the same `d` with `D = [[1],[1]]`. The dependency is downward (61 < 101).

## R03 (P2) — The projective/simple Brauer-character pairing is planned here and in GL2AutomorphicRepresentationsAndTransfer §R17.5.11

**Location:** `README.md:390–392` (§2.2): “The irreducible Brauer characters … are linearly independent and form a basis … (Webb, Theorem 10.2.2, p. 176 …)”. Also `:503–504` (§3.1): “`dim Hom_{k[G]}(P, U) = |G|⁻¹ ∑ … Φ_P(g⁻¹) φ_U(g)` … so the projective characters and the irreducible Brauer characters are dual bases”.

**Claim:** this roadmap owns the pairing and the independence.

**Witness:** GL2AutomorphicRepresentationsAndTransfer, head `ce17c6f`, `README.md:2936`, proves “the pairing is the dimension of Hom, so the two character families are dual and simple Brauer characters are independent”. Its `:2938` adds “Modular characters and their projective pairing are owned here”. It cites the same Webb Theorem 10.2.2 (`:2940`).

**Repair:**
- Add to the GL2 bullet of Scope and ownership (`:80–85`) and to its supplier contract (`:185–188`): “the pairing `⟨Φ_{P_S}, φ_T⟩ = dim Hom(P_S, T)` of projective covers with simple modules, the duality of the two families, and the linear independence of the simple Brauer characters.”
- In §2.2, import the independence and prove here only the spanning and the count.
- In §3.1, import the pairing. Keep the general formula for an arbitrary projective `P` and module `U`, with one clause saying it extends §R17.5.11, together with the lift `P̂_φ`, the vanishing of `Φ_φ` off `p`-regular elements and reciprocity.

Tested on `S₃` at `p = 2`: `⟨Φ_1, φ_1⟩ = (1·2·1 + 2·2·1)/6 = 1` and `⟨Φ_1, φ_std⟩ = (2·2 + 2·2·(−1))/6 = 0`. This is the identity §R17.5.11 proves. GL2 is line 100 of the merge order and this roadmap line 101, so the citation is downward.

## R04 (P3) — A cited Tau Ceti declaration does not exist under the name given

**Location:** `README.md:43`, `:326`, `:333`: “`TauCeti.IsAdicComplete.exists_isIdempotentElem_eq`”.

**Claim:** Tau Ceti has a declaration of that name.

**Witness:** At the pin, `TauCeti/RingTheory/AdicCompletion/Idempotent.lean:52` opens the root namespace `IsAdicComplete`, with no enclosing `TauCeti`, and line 133 declares the lemma there. `#check @TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` fails with “Unknown identifier”.

**Repair:** write `IsAdicComplete.exists_isIdempotentElem_eq` at the three places. Tested: `#check @IsAdicComplete.exists_isIdempotentElem_eq` elaborates at the pin. Its type: an `I`-adically complete `R`-algebra `S`, a ring hom with kernel `I • ⊤`, and lifting of idempotents in the range, as §1.3 uses it.

## R05 (P3) — The family index still names this roadmap the owner of Brauer characters

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:132–133`: “[ModularCharactersAndBlocks](ModularCharactersAndBlocks/README.md) consumes both and owns Brauer characters, decomposition matrices and blocks with defect.”

**Claim:** this roadmap owns the Brauer character.

**Witness:** The folder imports the Brauer character from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (`README.md:80–85`, `:185–188`, `:363–366`, `:492`). That section resolves at its head `ce17c6f` (`README.md:2927`). The index is unchanged since the previous review.

This is the previous report's R01, carried. No repair report marks it `not actionable`, and the brief makes the family index part of this pull request.

**Repair:** in the index, write “… consumes both, takes the Brauer character and its projective pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11 and the decomposition map over finite extensions of `ℚ_p` from ArithmeticGaloisDuality §R02.4.4, and owns the Brauer-character basis theorem, decomposition matrices, Brauer reciprocity and blocks with defect.” Tested: every use of the Brauer character in the folder then agrees with the index, and so does the ownership after R02 and R03.

## R06 (P3) — “Block covering” is named without a definition or a statement

**Location:** `README.md:851–852` (§8.2): “Develop block covering for the other `G`-orbits of characters of `N` (Martínez, Definition 7.3 and Theorem 7.7, pp. 44–45).”

**Claim:** this is a target.

**Witness:** No definition, API, Checks or hypotheses are given. Martínez's Theorem 7.7 (`martinez` line 1710) is a three-way equivalence that the README never states. Nothing in §8.4 or any *Needs:* line consumes it.

**Repair:** replace the sentence with a statement and Checks:
- Statement: “A block `B` of `G` covers a block `b` of a normal subgroup `N` when `e_B` is a summand of `∑_{g ∈ G/G_b} e_{b^g}` (Martínez, Definition 7.3, p. 44). Prove that `B` covers `b` exactly when some `χ ∈ Irr(B) ∪ IBr(B)` has a constituent of `χ_N` in `b`, and exactly when every constituent of every such restriction lies in a `G`-conjugate of `b` (Martínez, Theorem 7.7, p. 45).”
- Check: `S₃`, `p = 2`, `N = C₃` (three blocks `e_1, e_ζ, e_{ζ²}`, orbits `{e_1}` and `{e_ζ, e_{ζ²}}`). `B₀ = {1, sgn}` covers `e_1`, and the defect-zero block `{std}` covers `e_ζ` and `e_{ζ²}`, since `std|_N = ζ + ζ²`.
- Check: `N = 1`: every block covers the single block `1`.
- Check: `N = G`: `B` covers `b` exactly when `B = b`.

Alternatively, delete the sentence. Tested: the `S₃` values agree with §8.2's last Check (`:874`).

## R07 (P3) — The relative trace has no Checks

**Location:** `README.md:649–651` (§6.1): “For `Q ≤ P ≤ G` define `Tr_Q^P : k[G]^Q → k[G]^P`, `a ↦ ∑_{x ∈ P/Q} x a x⁻¹`”.

**Claim:** the definition is tested.

**Witness:** All four Checks of §6.1 (`:667–672`) are about `Br_P`. No Check evaluates `Tr_Q^P`, and nothing excludes the averaged model `|P : Q|⁻¹ ∑ x a x⁻¹`, which is undefined in characteristic `p`.

**Repair:** add Checks:
- `S₃`, `k = 𝔽₂`, `Q = 1`, `P = ⟨(12)⟩`: `Tr_1^P(r) = r + r²`, which is `P`-invariant.
- `Tr_1^P(1) = 2 = 0`: a trace from a proper subgroup of a `p`-group kills scalars, and averaging is impossible.
- `Tr_P^P` is the identity.

Tested: `(12) r (12) = r²`; `1 + 1 = 0` in `𝔽₂`.

## Previous findings

- R01 of the previous report (family-index ownership) — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md:133` still reads “consumes both and owns Brauer characters, decomposition matrices and blocks with defect”. Carried as R05, with its repair updated for R02 and R03.

## Verified sound

**Head and scope.** The worktree is clean at `f49016c`. `git diff --stat origin/main...HEAD` lists the folder's `README.md` (948 lines), `Suggested.lean` (164 lines) and the family index (`+15/−9`). The brief's command for changes outside the folder and the family index prints nothing.

**Gate.** The worker's gate on this head: every counter `0`, `OK`. My run without `--order` reports `depcheck=1` (“NOT IN ORDER”, because the configured default order lacks this roadmap) and `outside-folder=1` on the family index. With `--order` set to the candidate merge order, only `outside-folder=1` remains. That is not a finding: the brief names the family index as this pull request's own.

**Dependency check** (the brief's command), complete output:

```text
depcheck: 227 roadmaps, 2061 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `Suggested.lean` exits `0`. Its output is eight `declaration uses sorry` warnings (lines 42, 56, 72, 99, 117, 127, 139, 153) and nothing else.

**Signatures.** A scratch copy with `#check @name` for all eleven declarations was elaborated once. Every binder is kept, and each type matches its README statement:
- `IsBlockIdempotent`: any `CommRing R`.
- `complete_blockIdempotents_unique`: a field `k`, finite index types.
- `existsUnique_blockIdempotent_map_residue`: `IsDomain`, `IsDiscreteValuationRing`, `IsAdicComplete (maximalIdeal O) O`.
- `card_simpleModules_eq_card_pRegularClasses`: `IsAlgClosed k`, `CharP k p`, one universe.
- `brauerProjection_mul`: `IsPGroup p P`, `CharP k p`, `P`-invariant coefficients.
- `isDefectGroup_conj` and `isDefectGroup_iff_sylow_of_augmentation_ne_zero`: any field of characteristic `p`.
- `brauer_first_main` and `brauer_third_main_local`: `IsAlgClosed k`, `P ⊔ C_G(P) ≤ H ≤ N_G(P)`.

Nothing changed.

**Padding probe.** Each of the eight theorems was tried on a scratch copy with `first | rfl | infer_instance | simp | aesop | decide`, and all eight fail. No definition restates a library one. Mathlib's `RingTheory/Idempotents.lean` has no uniqueness of complete primitive families. Tau Ceti's `Primitive/Decomposition.lean:199` (`card_eq_card_of_isPrimitiveIdempotent`) gives only the count for Artinian rings. So `complete_blockIdempotents_unique` is not at the pins. `library-matches.md` lists no candidate that proves any of the eleven statements.

**Headline inventory** (`README.md:12–19`):
- Stated: Brauer's count, the `O[G]`/`k[G]` block bijection, conjugacy of defect groups, Sylow defect groups of the principal block, the first main theorem and the local third main theorem.
- Named as not statable, and rightly so: reciprocity, decomposition-map surjectivity, the Brauer-character basis, generalized decomposition numbers and the second main theorem. All need Brauer characters, whose definition needs the inverse of the root reduction `μ_{e'}(O) → μ_{e'}(k)` as data, and no pin provides it. `TauCeti.reductionK0` (`GroupAlgebra/LatticeDefect/Basic.lean:105`) takes `ℤ`-forms only.
- Wrongly named as not statable: the kernel theorem and block-section orthogonality (R01).

**The seeded sample: every locator checked against the text.** Printed page = PDF page − 7 in `webb`, − 8 in `martinez`, − 6 in `craven`, and = PDF page in `sambale`. Each item lists theorem, printed page and the `<source> line N` where it starts. Each supports the statement as written.

| Target | Locators verified |
| --- | --- |
| §1.2 Stable lattices | Webb Thm 9.4.8 p. 153 (`webb` 6434; same composition factors); Martínez Thm 1.7, Lemma 1.8 p. 4 (`martinez` 189, 196) |
| §2.1 Brauer characters | Webb Prop 10.1.3 p. 170 (`webb` 7179; (3) dual is `g⁻¹`, (4) tensor); Martínez Lemmas 1.1–1.2 pp. 2–3 (`martinez` 130, 150; restriction); induction formula p. 37 (`martinez` 1385) |
| §2.2 Basis and count | Webb Thm 10.2.2 p. 176 (`webb` 7438), Thm 9.3.6 p. 147 (`webb` 6167); Martínez Prop 1.5 p. 3, Thm 1.9 p. 5 (`martinez` 174, 219) |
| §2.3 Residue splitting | Webb Thm 9.2.7 p. 144 (`webb` 6054), remark p. 144 (`webb` 6031–6036), Ch. 9 Ex. 4 p. 165 (`webb` 6974: `Rad(E ⊗ A) = E ⊗ Rad A` over a splitting field), Ex. 8(a) p. 166 (`webb` 7004) |
| §2.4 Decomposition map | Webb Prop 10.3.2 p. 182 (`webb` 7703), Cor 10.2.4 p. 178 (`webb` 7502; full rank, surjectivity omitted), Thm 9.4.11 p. 155 (`webb` 6518); Martínez Def 1.6, Thm 1.7 pp. 3–4 |
| §4.1 Ordinary idempotents | no text locator; CharacterTheory §3.5 (main `README.md:497`) and `TauCeti.Representation.primitiveCentralIdempotent` (`CentralIdempotent.lean:301`) resolve |
| §4.3 Principal block | Sambale Def 1.2 p. 14 (`sambale` 335; trivial module) |
| §5.2 Orthogonality | Sambale Thm 1.14 p. 16 (`sambale` 465; summing over `B` gives `c^u_{φψ}` since `c^u` is block-diagonal) |
| §6.2 Defect groups | Webb Thm 12.5.2 p. 244 (`webb` 10292; any field of char. `p`), Cor 12.5.5 p. 246 (10384), Cor 12.3.2 p. 235 (9906), Thm 12.4.5 p. 241 (10173), Cor 12.4.7 p. 242 (10199), Thm 9.6.1 p. 161 (6800), Thm 12.6.4 p. 250 (10524); Sambale Def 1.4 p. 14 (350); Martínez Def 3.2 p. 17 (703), Thm 4.3 p. 24 (948), Cor 3.9 p. 21 (869), Cor 2.9 p. 15 (630) |
| §6.3 Brauer pairs | Craven Def 2.6 p. 22 (`craven` 814), Lemma 2.7 p. 23 (823), Def 2.8 p. 23 (847), Lemma 2.9 p. 24 (856), Def 2.10 p. 24 (873), Thms 2.11–2.12 p. 25 (891, 897) |
| §7.1 First main theorem | Sambale Def 1.10, Prop 1.11, Thm 1.12 p. 16 (`sambale` 424, 438, 442); Martínez p. 25 (`martinez` 980), Thm 4.5 and Cor 4.6 p. 26 (1004, 1055), Thm 4.10 p. 27 (1085); Webb Thm 12.6.4 p. 250 (splitting field for `G` and subgroups ⊆ `IsAlgClosed`) |
| §7.3 Third main theorem | Sambale Thm 1.15 p. 17 (`sambale` 478; iff); Martínez Cor 5.9 p. 35 (`martinez` 1370; the direction `b^G = B₀ ⇒ b = B₀`); `axiom-third` line 45 |
| §8.1 Normal `p`-subgroups | Martínez Thm 1.14 p. 6 (`martinez` 316), Cor 8.2 and Prop 8.4 p. 51 (1895, 1907), Thm 8.5 p. 52 (1928; (ii) every block dominates one); Sambale Thm 1.23 p. 18 (`sambale` 542) |
| §8.2 Normal `p'`-subgroups | Martínez Thm 8.5(iii) p. 52 (1933), Def 7.3 p. 44 (1638), Thm 7.7 p. 45 (1710); Sambale Thm 1.24 p. 18 (`sambale` 547) |
| §8.3 Kernel theorem | Navarro Thm 6.10: uncertified, see below |

Also checked outside the sample: Webb Lemma 9.3.4 p. 146, Props 9.4.3/9.4.5 pp. 149/151, Props 9.5.1 p. 157, Thm 9.5.4 p. 159, Cor 9.5.6 p. 160, Prop 10.2.1 p. 174, Cor 10.3.3 p. 183, Lemma 11.6.8(2) p. 215, Props 12.1.1–12.1.2 p. 227, Cor 12.1.3 p. 228, Prop 12.4.1 p. 238, §12.5 p. 243, Lemma 12.5.3 p. 245, Cor 12.5.4 p. 246; Martínez Thm 2.2 p. 10, Cor 2.4 p. 11, Thms 2.11–2.12 p. 15, Thm 4.1 p. 23, Prop 1.12 p. 5, Cor 1.13 p. 6. All correct. The README flags no locator as unverified.

**Library declarations opened at the pins** (Tau Ceti `TauCeti/…`):
- `GroupTheory/OrderOfElement/PPart.lean`: lines 69, 116, 129, 167, 185, 196, 205, 212, 240, 269.
- `RingTheory/Idempotents/Primitive/Basic.lean:89`: `IsPrimitiveIdempotent` is idempotent, nonzero, and has no orthogonal split.
- `Primitive/Decomposition.lean:223`.
- `RingTheory/AdicCompletion/Idempotent.lean:133` (R04).
- `Algebra/Module/Projective/Lift.lean:89` and `Reduction.lean:73` (root `Ideal`).
- `Algebra/Module/ProjectiveCover/Basic.lean:106` and `Existence.lean:195`.
- `RingTheory/Idempotents/Simple.lean:93` (root `CompleteOrthogonalIdempotents`).
- `Algebra/Category/ModuleCat/CartanMap/Basic.lean`: lines 225, 414.
- `RepresentationTheory/GrothendieckGroup/CartanMatrix.lean`: lines 77, 115, 138, 148 (entry `[P j : S i]`).
- `CategoryTheory/GrothendieckGroup/Exact.lean:179`.
- `GroupAlgebra/Restriction.lean:70`, `Induction.lean:91`, `LatticeDefect/Basic.lean:105`.
- `Induction/Brauer/Induction.lean:82`.
- `CharacterTable/Table.lean`: line 114 (`irreducibleCharacters`) and line 585 (`sum_characterTable_mul_conj`: `|G|/|C|` when `C = C'`).
- `Induction/PElementary.lean:91`, `CentralIdempotent.lean:301`, `CentralCharacter.lean:89`, `RingTheory/Cyclotomic/Basic.lean:536`, `Induction/Cyclotomic/SplittingField.lean:107`.

Mathlib, by `#check`: `exists_isIdempotentElem_eq_of_ker_isNilpotent`, `IntermediateField.adjoin.finiteDimensional`, `littleWedderburn`, `Ring.jacobson_le_of_eq_bot`, `MonoidAlgebra.coeff`/`ofCoeff`/`lift`/`mapRingHom`/`mapDomain`. All exist with the stated hypotheses.

**Cross-roadmap citations resolved.**
- On main (`4ec889e`):
  - SemisimpleAlgebras Layers 0, 1, 2 (`README.md:169, 186, 212`).
  - QuiverRepresentations Layer 3 (`:505`); §3.3 (`:598`) has the row matrix `Cᵢⱼ = [Pᵢ : Sⱼ]`, with `A₂ ↦ [[1,1],[0,1]]` the transpose of the native `[[1,0],[1,1]]`, as §3.1's Check says.
  - GrothendieckEulerForms Layer 2 (`:352`), Layer 4 (`:602`), §§4.2–4.3 (`:633, 644`).
  - ModularInduction Layers 0, 1, 3 (`:174, 202, 257`; `modRepK0.baseChange` at `:228`).
  - CharacterTheory §3.5, §4.3, §4.5 (`:497, 741, 817`).
  - InductionRestriction Layer 6 (`:661`).
- At open heads:
  - GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (`:2927`) and §R17.5.12 (`:2942`) at `ce17c6f`. §R17.5.11 supplies exactly what the Scope bullet imports.
  - GlaubermanZStar (consumer) at `581115c`, unchanged since the previous review.

**Ownership by object**, searched with `roadmaps grep` over main and 434 open heads (index of 2026-11-10T19:25:52Z):
- Decomposition map: R02.
- Projective pairing: R03.
- `O_{p'}(G)`: OddOrderTheorem §1.1 (head `b3bd1fe`, `README.md:316–331`) also defines it, as the `π`-core for `π = {p}'`. OddOrderTheorem is at line 401 of the merge order and this roadmap at 101. So §8.2 is the earlier owner: the notion stays here (moved down), and the citation belongs in OddOrderTheorem §1.1, not in this folder.
- LocalFiniteGroupTheory's `pPrimeCore` is not a permitted supplier, and the folder does not cite it.
- No other roadmap owns blocks, defect groups, Brauer pairs or the Brauer morphism. SpringerResolutionAndCharacteristicCycles' “principal block” is that of category `O`.

**Adversarial computations.** Notation: `r = (123)`, `t = (12)`, `ζ = ζ₃`, `α ∈ 𝔽₄` with `α² + α + 1 = 0`. In `S₃` at `p = 2`: `e₀ = 1 + r + r²`, `e₁ = r + r²`. In `S₅` at `p = 3`: `D = ⟨(123)⟩`, `s = (45)`. All values were computed this round.

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| H01 | `complete_blockIdempotents_unique` | `𝔽₃[C₂]`; `𝔽₂[S₃]`; `G = 1` | `(2+2t)² = 8+8t = 2+2t`, `e₊e₋ = 0`, families swap; both families `{e₀, e₁}`, sizes `2 = 2`; `{1}` | Pass | none |
| H02 | `existsUnique_blockIdempotent_map_residue` | `ℤ₂[C₃]`; `ℤ₂[C₂]`; control `ℤ_(2)[C₇]` | `(2−r−r²)/3 ↦ r+r²`, `ℤ₂[C₃] ≅ ℤ₂ × ℤ₂[ζ]` has 2 primitive idempotents; `1 ↦ 1`, `(1±t)/2 ∉ ℤ₂[C₂]`; non-complete: `x⁷−1 = (x+1)(x³+x+1)(x³+x²+1)` gives 3 blocks over `𝔽₂` vs 2 over `ℤ_(2)` | Pass (completeness needed) | none |
| H03 | `card_simpleModules_eq_card_pRegularClasses` | `S₃` at 2, 3; `G = 1`; control `C₃/𝔽₂` | `2 = 2`; `2 = 2`; `1 = 1`; `2 ≠ 3` (not alg. closed) | Pass | none |
| H04 | `brauerProjection_mul` | `S₃`, `p = 2`, `P = ⟨t⟩`, `x = y = e₁`; controls | `Br(x²) = Br(e₁) = 0 = 0²`; `x = r, y = r²`: `1 ≠ 0`; over `ℚ`: `x² = 2 + r + r²`, `2 ≠ 0`; `P = C₃` in char. 2, `x = K_t`: `x² = 3e₀ = e₀`, `e₀ ≠ 0` | Pass | none |
| H05 | `IsDefectGroup` | `S₃`, `p = 2` | `e₀`: `Br_{⟨t⟩} = 1 ≠ 0`, maximal; `P = 1` rejected (`⟨t⟩ ⊋ 1` with `Br ≠ 0`); `e₁`: `Br_{⟨t⟩} = 0`, `Br_1 = e₁ ≠ 0` → `1` | Pass | none |
| H06 | `isDefectGroup_conj` | `S₃`, `p = 2` | `e₀`: `⟨(12)⟩, ⟨(13)⟩, ⟨(23)⟩`, conjugate by `r`; `e₁`: `{1}` | Pass | none |
| H07 | `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | any `P` a `p`-group; `S₃`; control `e₁` | `aug(Br_P e₀) = aug(e₀) = 1` (off-centralizer `P`-orbits have size `≡ 0`), so every Sylow has `Br ≠ 0`: 3 Sylows = 3 defect groups; `e₁`: `aug = 0`, defect `1` ≠ Sylow | Pass | none |
| H08 | `brauer_first_main` | `S₅`, `p = 3`, `D`; `D = 1` | `f((1±s)/2) = B₁, B₂`: `((1+s)/2)² ≠ 0`, `((1−s)/2)² ≠ 0`; swapped `f`: `(1+s)/2·(1−s)/2 = 0`, so `f` is pinned; `D = 1`: `e·e = e ≠ 0` | Pass | none |
| H09 | `brauer_third_main_local` | `S₅`, `P = D`, `H = N_G(D)`; `P = 1` | `b = (1+s)/2`: product `≠ 0`, `aug = 1`; `b = (1−s)/2`: `0`, `aug = 0`; `H = G`: `e₀ b ≠ 0 ⇔ b = e₀` | Pass | none |
| H10 | kernel theorem (§8.3; R01's Lean form) | `S₃` at 2, 3; `C_p` | `p = 2`: `sgn`: `3(−1−1) = −6 ∈ M`, `std`: `−3 ∉ M`, `⋂ker{1,sgn} = A₃ = O_{2'}`; `p = 3`: `std`: `3(0−1) = −3`, `2(−½−1) = −3 ∈ M`, `⋂ = 1 = O_{3'}`; `C_p`: `ζ−1 ∈ M`, `⋂ = 1` | Pass; statable | R01 |
| H11 | block-section orthogonality (§7.2) | `S₃`, `p = 2`; control | `B₀`, `g = r`, `h = t`: `1 − 1 = 0`; `{std}`, `g = 1`, `h = t`: `2·0 = 0`; same 2-parts `g = h = t`: `1 + 1 = 2 ≠ 0` | Pass; statable | R01 |
| H12 | reciprocity `C = DᵀD` (§3.1) | `S₃` at 3, 2 | `[[2,1],[1,2]]`, `det 3`, `Φ_1(r) = 1 − 1 = 0`; `diag(2,1)`, `det 2` | Pass | none |
| H13 | second main theorem (§7.2) | `S₃`, `p = 2`, `u = t` | `d^u = (1, −1, 0)`, nonzero exactly on `B₀` | Pass | none |
| H14 | orthogonality of `d^u` (§5.2) | `S₃`, `p = 3`; `C₂`, `p = 2` | `Q*Q = diag([[2,1],[1,2]], 3)`, `det Q = −3`, `9 = 3·3`; `det Q = −2`, `4 = 2·2` | Pass | none |
| S01 | §1.2 lattices | `G = 1`; `C₂`, `p = 2`; `V = 0` | `O/m`, `m/m²`: class `1` each; `k[C₂]` (non-split) and `k ⊕ k`: class `2` each; `0` | Pass | none |
| S02 | §2.1 dual, induced | `C₃/𝔽₄`; `Ind_1^{S₃}1` | `(1, ζ, ζ²)`, dual `(1, ζ², ζ)`; `(6, 0) = 2(1,1) + 2(2,−1)` | Pass | none |
| S03 | §2.2 Checks | `S₃` at 3; `C_p`; `C₃/𝔽₂` | `det[[1,1],[1,−1]] = −2`; `1 = 1`; `2 ≠ 3` | Pass | none |
| S04 | §2.3 route and Checks | `C₃` over `𝔽₄`, `𝔽₂`, `𝔽₄(T)`, `𝔽₂(T)`; `n = [k₁:k₀]` | `3`; `1 + 1·2`; `k³`; `1 + 2`; `n = n²` forces `1` | Pass | none |
| S05 | §2.4 `D` | `S₃` at 3, 2; `C₂` | `(2,0) = (1,1) + (1,−1)`; `[[1,0],[1,0],[0,1]]`; `[[1],[1]]`, not injective | Pass | R02 (owner) |
| S06 | §4.1 `e_χ` | `C₂/ℚ₂`; `C₃` | `e₊e₋ = (1−t²)/4 = 0`; `∑_j e_j = 1 + (∑_j ζ^{−j}) r + … = 1` | Pass | none |
| S07 | §4.3 principal block | `𝔽₂[S₃]`; `𝔽₄[C₃]`; `G = 1` | `aug e₀ = 3 = 1`, `aug e₁ = 2 = 0`; `aug(1 + α^{−j}r + α^{−2j}r²) = 1, 0, 0`; `1` | Pass | none |
| S08 | §5.2 Checks | `C₃`, `u = v = r` | with conj. `3 = c^r`; without `1 + ζ² + ζ = 0` | Pass | none |
| S09 | §6.2 Checks | `C₃` at 2 (no `p`-group condition) | `Br_{C₃}(e₀) = e₀ ≠ 0` (centralizer `C₃`), so `C₃` would be maximal; with the condition, `1` | Pass | none |
| S10 | §6.3 inclusion criterion | `S₃`, `p = 2`, `Q = ⟨t⟩`; `Q = 1` | `Br_Q(e₀)·1 = 1`, `Br_Q(e₁) = 0`; `Br_1(e_B) f = f ⇔ f = e_B`; route = Craven Lemma 2.7's uniqueness | Pass | none |
| S11 | §7.1 `S₅` Check | `χ₄` with `χ₄(s) = 2` | `ω(K_s)`: `χ₄` `10·2/4 = 5 ≡ 2`, `sgn` `−10 ≡ 2`, `1` `10 ≡ 1` mod 3, so `χ₄ ∈ B₂`; `s` eigenvalues `1,1,1,−1`, ranks `3, 1`, both products `≠ 0` | Pass | none |
| S12 | §7.3 Checks | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `p = 3`, `H ∈ {C₃, S₃}` | `Br_P(e₀) = 1`, block `1` principal; single blocks principal | Pass | none |
| S13 | §8.1 | `𝔽₃[S₃] → 𝔽₃[C₂]`; `C_p`; `N = 1` | `1 ↦ e₊ + e₋` (2 blocks); `1 ↦ 1`; identity | Pass | none |
| S14 | §8.2 `O_{p'}` and `e_N` | `S₃`; `A₄`; `𝔽₂[S₃]` | `O_{2'} = C₃`, `O_{3'} = 1` (wrong model `O_p`: `1`, `C₃`); `V₄`, `1`; `e_{C₃} = e₀`, basis `e₀, t e₀` | Pass | none |
| S15 | §8.3 Checks, route | `S₃` at 2, 3; `C_p` | `C₃`; `1`; `1`; `Φ_1(k) = Φ_1(1) ≠ 0` for `k ∈ K` forces `K` `p`-regular | Pass | none |
| F01 | R02 test | `V₄` at `p = 3`; `C₂` at 2 | §1.1: `K = ℚ₃ ∌ i`, so §R02.4.4's hypothesis fails; `D = [[1],[1]]` in both | Overlap | R02 |
| F02 | R03 test | `S₃`, `p = 2` | `⟨Φ_1, φ_1⟩ = 6/6 = 1`, `⟨Φ_1, φ_std⟩ = 0/6 = 0` | Overlap | R03 |
| F03 | R04 | `#check` | `IsAdicComplete.exists_isIdempotentElem_eq` ok; `TauCeti.`-prefixed: unknown identifier | Fail | R04 |
| F04 | R06 test | `S₃`, `p = 2`, `N = C₃` | `B₀ → e_1`; `{std} → e_ζ, e_{ζ²}` (`std|_N = ζ + ζ²`) | Untested target | R06 |
| F05 | R07 test | `S₃`, `𝔽₂`, `P = ⟨t⟩` | `Tr_1^P(r) = r + r²`; `Tr_1^P(1) = 0`; `Tr_P^P = id` | No Check | R07 |
| C01 | Conventions `p`-parts | `C₆`, `p = 2` | `g³` (order 2), `g⁴` (order 3), `g³g⁴ = g⁷ = g` | Pass | none |
| C02 | Brauer character vs trace | trivial `𝔽₂[C₃]`-module `𝔽₂²` | trace `0`, Brauer value `2` | Pass | none |
| C03 | §0.1 class sizes | `S₃`, `p = 2` | `g = t`: `3 = 3·1`; `g = r`: `2 = 1·2`; classes `3 = 2 + 1` | Pass | none |
| C04 | §0.2 scalar extension | `𝔽₂[C₃] → 𝔽₄[C₃]` | `e₁' + e₂' = 2 + (α+α²)(r+r²) = r + r²` | Pass | none |
| C05 | §1.1 roots | `e = 1`, `p = 5`; `e = 3`, `p = 2, 3` | `μ(ℚ) = 2`, `μ(ℚ₅) = 4`; residue `𝔽₄`; `𝔽₃` | Pass | none |
| C06 | §1.3 lifts | `ℤ₂[C₃]` | `(1+r+r²)/3 ↦ e₀`, `(2−r−r²)/3 ↦ e₁` (`1/3 ≡ 1`, `−1 ≡ 1`) | Pass | none |
| C07 | §3.1 orientation | `A₂` | native `[[1,0],[1,1]]`; QuiverRepresentations §3.3 `[[1,1],[0,1]]` | Pass | none |
| C08 | §4.2 central characters | `S₃`, `p = 2`, `K_t` | `3, −3, 0`; `3 ≡ −3`, `3 ≢ 0` mod 2 | Pass | none |
| C09 | §5.1 `d^u` | `C₃`, `u = r`; `S₃` at 3, 2 | `ζ^j`; `(1, 1, −1)`; `(1, −1, 0)` | Pass | none |
| C10 | `TauCeti.sum_characterTable_mul_conj` | `S₃`, `C = C' = [t]` | `1 + 1 + 0 = 2 = 6/3` | Pass | none |

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`)** and **Serre, Part III (`serre`)**: settled as uncertified and cited by locator only. The kernel theorem was instead checked through the README's route (S15) and on instances (H10).
- **Ownership against open pull requests** rests on `roadmaps grep` over the heads in the index of 2026-11-10T19:25:52Z. Pull requests that index does not carry were not searched.

## Source issues

- **Misprint** in webb at Example 12.5.6, p. 246: the source says the principal block `e1` has Sylow defect group and then that `e1` also has defect group `1`; it should be `e2`, the defect-zero block, for the second; affects nothing.
- **Misprint** in webb at the remark after Theorem 9.2.7, p. 144: the source says `𝔽_p(ζ)`, with `ζ` a primitive root of order the exponent `m`, splits `G`; in characteristic `p` no such root exists when `p` divides `m`; it should be the `p′`-part of `m`; affects nothing (§2.3 states the characteristic-`p` form).
