# Review of OddOrderTheorem (pull request #1777 at 018ab80)

**Verdict:** needs changes

Full review of the repaired head (152 changed lines since 1028ac9, all in `README.md`; `Suggested.lean` is unchanged). The five findings of the previous review are repaired (see "Previous findings"). The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with the six `sorry` warnings only, and the one-tactic probe closes nothing. What remains is one P1 in Layer 2 §2.5, three P2s and three P3s.

## R01 (P1) — §2.5's gluing law is false as stated, and its locator (5.3) is the subcoherence theorem, which no target states

Location: `TauCetiRoadmap/OddOrderTheorem/README.md` lines 879–880: "and the gluing of coherent extensions of two families that agree on the intersection of their domains (5.3)(a), (b)."

Claim: for an arbitrary `τ`, two coherent families whose extensions agree on `ℤ[S₁] ∩ ℤ[S₂]` glue to a coherent `S₁ ∪ S₂`, and this is Peterfalvi (5.3)(a), (b).

Witness: `L = S₃ ≤ G = S₃ × C₃`, `A = L^#`. `{ε}` and `{ρ}` are coherent (`ℤ[{ε}, A] = ℤ[{ρ}, A] = 0`), and their domains meet in `0`. Take `τ(ρ − 2ε) = ρ⊗ω + λ₁ − λ₂ − λ₃ − λ₄` (norm 5, degree 0). Then `ν(ρ) − 2ν(ε)` always has a coefficient `±2`, so `{ε, ρ}` is not coherent. Source: (5.3) is subcoherence (MC-PFsection5 lines 640–644, 687–699).

The gluing argument the source does have is math-comp `bridge_coherent` (MC-PFsection5 lines 1004–1011). It needs a subcoherent ambient `S` and a bridge `χ − φ` on which `τ` agrees with `ν₁ χ − ν₂ φ`. And (5.3)(a), (b), the two theorems that supply the subcoherence hypothesis (5.2) that §2.8 and Layer 4 rely on, are stated nowhere in the README (§2.8 names only the hypothesis (5.2)).

Repair: replace the clause at lines 879–880 by: "and the gluing law: if `S` is subcoherent (5.2), `S₁, S₂ ⊆ S` are disjoint, closed under complex conjugation and coherent with extensions `ν₁, ν₂`, and some `χ ∈ S₁` and `φ ∈ ℤ[S₂]` with `(χ − φ)(1) = 0` satisfy `τ(χ − φ) = ν₁ χ − ν₂ φ`, then `S₁ ∪ S₂` is coherent (Peterfalvi §5, the gluing argument after (5.5); math-comp `bridge_coherent`)". In §2.8, next to the hypothesis (5.2), add the two theorems that supply it:

- (5.3)(a): a set `S` of irreducible characters of `L`, closed under complex conjugation and with no real member, together with an isometry `τ` from `ℤ[S, L^#]` into `ℤ[Irr G, G^#]`, is subcoherent;
- (5.3)(b): for a prime Dade configuration (§2.7), a conjugation-closed set with no real member of the characters induced from the irreducibles `χ` of `K` with `H ⊄ ker χ` (math-comp `seqIndD K L H 1`) is subcoherent for the Dade isometry, its sets `R(μ_j)` being given by the cyclic isometry of §2.6.

Then add "§2.8 (5.3)" to the *Needs:* of §4.1. Tested on the witness: `ε` and `ρ` are real, so `{ε, ρ}` is not subcoherent, and `τ(ρ − 2ε) ≠ ν(ρ) − 2ν(ε)` for every choice of `ν`, so the corrected law makes no claim there.

## R02 (P2) — §2.5 states the conjugation law and the uniqueness of coherent extensions without the hypotheses of Peterfalvi (5.9)(a)

Location: README lines 876–878: "and conjugate pairs to conjugate pairs; the uniqueness of a coherent extension on `ℤ[S, A]` and, when `|S| ≥ 2` and `S` is closed under conjugation, up to the stated sign laws on `ℤ[S]`". Also the Check at lines 894–895 ("otherwise `ν` is pinned by `τ` on `ℤ[S, A]`").

Claim: every coherent extension of every `τ` sends `χ̄` to `conj(ν χ)`, and coherent extensions are unique up to "the stated sign laws", which the README never states.

Witness: `L = G = C₃`, `S = {ω, ω̄}`, `τ(ω − ω̄) = 1 − ω` (norm 2, degree 0). Both `ν(ω) = 1, ν(ω̄) = ω` and `ν′(ω) = −ω, ν′(ω̄) = −1` are coherent, and neither sends `{ω, ω̄}` to a conjugate pair. In the source, (5.9)(a) assumes that `τ` is the Dade isometry (MC-PFsection5 lines 1506–1529).

Repair: replace "and conjugate pairs to conjugate pairs" by "and, by Peterfalvi (5.9)(a): if `τ` is the Dade isometry of a Dade datum `(L, A, H)`, `S` has at least two irreducible members and is closed under complex conjugation, then `ν(χ̄) = conj(ν χ)` for every irreducible `χ ∈ S` (math-comp `cfAut_Dade_coherent`, `cfConjC_Dade_coherent`)". Replace the uniqueness clause by "for a subcoherent `S = {χ, χ̄}`, `ν` and its dual `χ ↦ −ν(χ̄)`, `χ̄ ↦ −ν(χ)` are both coherent extensions (math-comp `dual_coherence`, MC-PFsection5 lines 539–541)", or delete it. Replace the "Sign law" Check by the `C₃` instance above as a negative control for the Dade hypothesis. Tested: for the Dade isometry of `(C₃, C₃^#, H = ⊥)`, which is the identity, `τ(ω − ω̄) = ω − ω̄`, and both coherent extensions (the identity and its dual) send `{ω, ω̄}` to conjugate pairs.

## R03 (P2) — Layer 5 relies on Peterfalvi's bridge theorems (13.18)–(13.19), which no target states

Location: README lines 1363–1364 (§5.2): "the complement `W₁` alone is excluded by the family inequalities of §4.1 (Theorem (14.4) and the type-I bridge of §13)". Line 1374 (Check): "is excluded by the bridge (13.19)". §4.4 (lines 1290–1298) states only (13.2), (13.3), (13.5)–(13.9) and (13.15).

Claim: every input that §5.2's proof route uses is a target.

Witness: MC-PFsection13 lines 1792–1805 ((13.18), `FTtypeP_bridge_facts`) and 1989–1996 ((13.19), `FTtypeI_bridge_facts`: either `(|H| − 1)/e ≤ (|U| − 1)/q` or `p ≤ e`). MC-PFsection14 applies them 3 and 4 times. No README target states either.

Repair: add to §4.4 "Prove the bridge theorems (Peterfalvi (13.18), (13.19); math-comp `FTtypeP_bridge_facts`, `FTtypeI_bridge_facts`). (13.18): for the type-II `S` of the pair, the bridge virtual characters `β_j` (`j ≠ 0`) lie in `CF(S, A₀(S))` with norm `(|U| − 1)/q + 2`; `τ(β_j) − 1 + η_{0j}` is a real virtual character `Γ`, independent of `j`, with `⟨Γ, 1⟩ = 0`; every orthogonal splitting `Γ = X + Y` with `Y ⊥ σ(Irr W)` has `‖Y‖² ≤ (|U| − 1)/q`; and `q ∣ |U| − 1`. (13.19): for a maximal `L ⊇ N_G(U)` with `H = H(L)` and `e = |L : H|`, the Dade support of `L` avoids the conjugates of `P` and of `W`, the coherent image of the family of `L` is orthogonal to `σ(Irr W)`, and either `(|H| − 1)/e ≤ (|U| − 1)/q` or `p ≤ e`."

Also state (13.17) in §4.4 under its own label (math-comp `FTtypeII_support_facts`, MC-PFsection13 lines 1661–1666, which §5.2 now cites under (14.3)–(14.5)), and make §5.2 cite "§4.4 (13.17)–(13.19)". Tested on the §5.2 Check: its alternative "`p ≤ |L : H(L)| = q`, or `(|H(L)| − 1)/q ≤ (|U| − 1)/q`" is (13.19) at `e = q`.

## R04 (P2) — §1.2 restates FiniteGroupInvariants §0.3 and uses its chief factors without citing them

Location: README lines 373–376: "and `F(G) ≠ 1` when `G ≠ 1` is solvable. For solvable `G` prove: a minimal normal subgroup of `G` is elementary abelian (Lemma 1.1) … over the chief factors `U ⧸ V` of `G`".

Claim: Layer 1 owns these statements.

Witness: FiniteGroupInvariants, at the head of its pull request (already this roadmap's supplier for §2.1), states both. §0.3 (its README lines 297–306) defines `IsMinimalNormal` (its `Suggested.lean` line 91) and says that for solvable `G` every chief factor is `(ZMod p)^k`; its §2.1 route uses exactly this. Its §0.2 defines `ChiefSeries` and `chiefFactors`. Separately, InverseGaloisAndArithmeticFundamentalGroups IG.4.3, *Fitting supplements for solvable groups*, states `Φ(G) < F(G)` for nontrivial solvable `G`.

Repair: in §1.2 replace "and `F(G) ≠ 1` when `G ≠ 1` is solvable. For solvable `G` prove: a minimal normal subgroup of `G` is elementary abelian (Lemma 1.1) and lies in `Z(F(G))` (Lemma 1.2)" by: "`F(G) ≠ 1` for solvable `G ≠ 1` is InverseGaloisAndArithmeticFundamentalGroups IG.4.3 (*Fitting supplements for solvable groups*), and a minimal normal subgroup of a solvable `G` is elementary abelian by FiniteGroupInvariants §0.3 (Lemma 1.1). For solvable `G` prove: a minimal normal subgroup lies in `Z(F(G))` (Lemma 1.2)". Write "the chief factors (FiniteGroupInvariants §0.2)" in Proposition 1.2, and add FiniteGroupInvariants §0.2–§0.3 and IG.4.3 *Fitting supplements* to the §1.2 *Needs:*, to the two supplier tables and to the Scope's list of what is left to named suppliers. Tested: the §1.2 Check on `S₄` (chief series `1 < V₄ < A₄ < S₄`, centralizers `V₄, A₄, S₄`, meet `V₄`) reads the same with FiniteGroupInvariants' `chiefFactors`. No new supplier edge is introduced: FiniteGroupInvariants and IG are already cited.

## R05 (P3) — two Layer 1 locators point at the wrong statement

Location: README line 319: "`O_p(H)` is the intersection of the Sylow `p`-subgroups of `H` (Lemma 1.22)". Line 552: "(Lemma 1.21(a)–(e), with the quotient criteria …)". Line 1513: "every locator above was checked against it".

Claim: B&G Lemma 1.22 is the intersection characterization, and §1.6 states Lemma 1.21(a)–(e).

Witness: math-comp `solvable/sylow.v` (MC-sylow) lines 546–549 label `normal_pgroup` "B & G 1.22 p.9": a normal `N` of a `p`-group `P` contains a `P`-normal subgroup of every order `p^r ≤ |N|`. 1.21(e) (MC-BGsection1 lines 1162–1165), the criterion for `H₁ ⊓ H₂ = 1`, is not stated in §1.6.

Repair:

- Line 319: drop "(Lemma 1.22)" and give the fact its route: "(every normal `p`-subgroup lies in each Sylow `p`-subgroup, Mathlib `IsPGroup.le_sylow_of_normal`, and the intersection of the Sylow `p`-subgroups is a normal `p`-subgroup)".
- §1.6: either add "and, for `H₁, H₂ ⊴ H` with `H₁ ⊓ H₂ = 1`, `H` has `p`-length at most one iff `H ⧸ H₁` and `H ⧸ H₂` do (1.21(e))", or cite "(Lemma 1.21(a)–(d))". In both cases cite the two `O_{p',p}` criteria as "Bender–Glauberman §10, p. 75, before Theorem 10.6" (MC-BGsection1 lines 1049–1051).
- References: delete "every locator above was checked against it". It is process narrative, and it was not true of these two locators.

## R06 (P3) — the Baer–Suzuki theorem has no locator

Location: README lines 624–626: "together with the **Baer–Suzuki theorem**, stated and proved here since the pins lack it: a `p`-element `x` of a finite group `G` lies in `O_p(G)` iff …".

Claim: a theorem stated as a target without a source locator.

Witness: the house rule asks for "every theorem its exact hypotheses and a locator". The proof of A.4(c) applies Baer–Suzuki at MC-BGappendixAB line 62, and math-comp states it as `Baer_Suzuki` (MC-sylow lines 570–572). Neither pinned library has it (grep for "Baer" in both trees finds nothing).

Repair: append "(math-comp `Baer_Suzuki` in `solvable/sylow.v`, applied in the proof of Theorem A.4(c), MC-BGappendixAB line 62)", or a textbook locator the author has read, and record the math-comp file in `sources.toml` if it is cited by line. Ownership is correct as it stands: LocalFiniteGroupTheory, the only other roadmap stating Baer–Suzuki, is on the project's never-cite list.

## R07 (P3) — two Layer 3 Checks misdescribe their instance

Location: README lines 1048–1050: "`C₃ ≀ C₃` … for an element `x` outside the base `C₃³`, `C_base(x)` is the diagonal `C₃`, and `⟨x, diagonal⟩ ≅ C₃²` is a maximal elementary abelian subgroup". Line 1101: "`V₄` lies in the two maximal subgroups `A₄` and `D₈`".

Claim: the stated values hold for the stated instances.

Witness: for `x = (1, 0, 0)·t`, with `t` the cyclic shift, `x³ = (1, 1, 1) ≠ 1`, so `x` has order `9` and `⟨x, diagonal⟩ = ⟨x⟩ ≅ C₉`. And `V₄ = O₂(S₄)` lies in `A₄` and in all three Sylow `D₈`, so it lies in four maximal subgroups, not two.

Repair: "for an element `x` of order `3` outside the base (for instance the cyclic shift `t`, whose centralizer is `⟨t⟩ × diagonal`, of order `9`)"; and "`V₄` lies in four maximal subgroups, `A₄` and the three `D₈`".

## Previous findings

- **R01 (P2, Schur–Zassenhaus conjugacy restated): repaired.**
  - Scope lines 33–35 now read "Hall subgroups of solvable groups beyond their existence (conjugacy, containment and the coprime-action forms)", without Schur–Zassenhaus.
  - Lines 77–79 and table row 177 import "IG.3.4, target *Conjugacy of coprime complements*".
  - §1.1 lines 331–340 identify the complements with the Hall `π'`-subgroups and cite IG.3.4 ("which assumes only that `N` or `G ⧸ N` is solvable").
  - The §4.2 Check at lines 1262–1265 cites IG.3.4.
  - IG.3.4's target at the head of InverseGaloisAndArithmeticFundamentalGroups (its README line 3305, inside `### IG.3.4` at 3034) states exactly the imported row.
- **R02 (P2, §1.4 hypotheses): repaired.** Lines 455–459 now read "for a `p`-group `P ≠ 1` of odd order, … (Theorem 1.13); for a `p`-group `P` of odd order, the exponent of `Ω₁(P)` divides `p` …", and the new Check at lines 491–494 is correct: `Ω₁(D₈) = D₈` has exponent `4`, `Ω₁(Q₈) = {±1}`, and the trivial group has exponent `1`.
- **R03 (P3, Lemma 6.5 solvability): repaired.** Lines 558–562 read "`H ⊓ G' = H ⊓ U'`, with no solvability assumed (a); and, for solvable `G`, … (b) … (c)", as in MC-BGsection6 lines 141 and 159–187. The route given for (c), Hall conjugacy in `(K H) ⊓ U`, is math-comp's (line 168). The new Check at lines 577–581 is correct (adversarial table).
- **R04 (P3, §1.8 narrower than the source, labels swapped): repaired.**
  - Lines 615–619 read "every finite group of odd order is `p`-stable for every prime `p` … (Bender–Glauberman, Theorem A.4(c); no solvability is assumed …)", which is MC-BGappendixAB lines 45–53.
  - Theorem 6.1 is deduced from it, which is MC-BGsection6 lines 37–44.
  - §1.5 (lines 517–519) locates the deduction by math-comp `p_stable_abelian_constrained` (MC-BGsection1 lines 645–647, which labels it Gorenstein 8.1.3). The Gorenstein citation the previous review suggested was not added; the math-comp locator is checkable, so no finding.
- **R05 (P3, backticked names not declared): repaired.** Lines 444 and 465 now read "Define **elementary abelian `p`-groups**" and "Define **extraspecial `p`-groups**". The gate reports `readme-ids-missing=0`.

## Verified sound

**Gate, dependency check, build.**

- My run of the gate command: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. This agrees with the worker's gate.
- `gate --depcheck … --movable`: `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. OddOrderTheorem is at line 397 of the order and InverseGaloisAndArithmeticFundamentalGroups at line 54. FiniteGroupInvariants is an open pull request adding a new folder and is not yet in the order.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- `lake env lean` on `Suggested.lean`: exit 0, with warnings `declaration uses 'sorry'` at lines 52, 55, 59, 118, 128, 144 and nothing else.

**Lean file.**

- `#check @` on all ten declarations in a scratch copy: the elaborated types equal the worker's `signatures.md` and the README statements (§0.2, §2.2–§2.4, §5.1). No section binder is lost: `[Finite G]` sits on the endpoint theorems and on `appendixC_prime_le`, and `[Fintype G] [Fintype ↥L]` on the Dade declarations.
- Padding probe: in the same scratch copy each `sorry` was replaced by `first | rfl | simp | infer_instance | decide | exact?`, and all six fail.
- The headlines named in the README (Summary and "How to read the build") are the three forms of the odd order theorem, `exists_dadeExtension`, `isDadeExtension_eq_indClassFunction` and `appendixC_prime_le`. All six are stated.
- The docstring names (8.8), (12.7), (12.17), the coherence theorems, Thompson transitivity and 10.6 as not statable, with the missing carriers (Hall subgroups, cores, Fitting subgroup, `p`-length, `SCN₃`). Those carriers are absent at both pins (grep).
- No `set_option`, no sorry'd data, no `lemma`. The imports are `Mathlib` plus two existing `TauCeti` modules.

**Library declarations opened at the pins.**

- **Mathlib:**
  - `Subgroup.card_subgroup_dvd_card` (`GroupTheory/Coset/Card.lean` 69), `Subgroup.card_dvd_of_le` (86).
  - `Subgroup.card_mul_index` (`Index.lean` 293), `Subgroup.card_map_dvd` (315), `Subgroup.finiteIndex_of_finite` (an instance, 764).
  - `Group.isSolvable_of_comm`, `…_of_isSolvable_injective`, `…_of_surjective`, `…_iff_subgroup_quotient`, `…_of_subgroup_quotient`, `IsSolvable.commutator_lt_top_of_nontrivial`, `IsSimpleGroup.comm_iff_isSolvable` (`Solvable.lean` 121, 157, 167, 177, 182, 192, 257).
  - `Subgroup.normal_of_characteristic` (an instance, `Algebra/Group/Subgroup/Basic.lean` 238).
  - `Subgroup.exists_right_complement'_of_coprime` (`SchurZassenhaus.lean` 277), `MonoidHom.ker_transferSylow_isComplement'` (`Transfer.lean` 279), `IsZGroup.coprime_commutator_index` (`ZGroup.lean` 284).
  - `IsPGroup.le_sylow_of_normal`, `IsPGroup.exists_le_sylow`, `Sylow.not_dvd_index`, `Sylow.normalizer_sup_eq_top`, `Sylow.card_eq_multiplicity`, `Sylow.characteristic_of_normal` (`Sylow.lean` 107, 196, 491, 530, 833, 873).
  - `frattini_nilpotent` (`Frattini.lean` 58), `Subgroup.IsComplement'.card_mul_card` (`Complement.lean` 656).
  - `FiniteField.algebraMap_norm_eq_pow`, `FiniteField.unitsMap_norm_surjective` (`GaloisField.lean` 224, 236), `mem_rootsOfUnity` (`RootsOfUnity/Basic.lean` 63).
- **Tau Ceti:**
  - `TauCeti.exists_index_eq_notMem_of_exponent_dvd` (`GroupTheory/ExponentPrime.lean` 136).
  - `TauCeti.IsTISubgroup` (`TrivialIntersection.lean` 115, elementwise malnormality), `TauCeti.IsTISet` (194: `subset`, `conj_mem`, `disjoint_conj`, so `N_G(D) = N` for nonempty `D`, as §3.4 says), `TauCeti.IsFrobeniusComplement` (326: `ne_bot`, `ne_top`, `isTISubgroup`).
  - `TauCeti.frobeniusKernel` (`FrobeniusKernel.lean` 145); `TauCeti.frobeniusKernelSubgroup`, `coe_frobeniusKernelSubgroup`, `frobeniusKernelSubgroup_normal`, `frobeniusKernel_isComplement'` (`FrobeniusGroup/Basic.lean` 238, 243, 248, 261).
  - `TauCeti.characterPairing_ind_ind`, `…_of_isTISet`, `TauCeti.isometry_ind_of_isTISet` (`Induction/TrivialIntersection.lean` 129, 144, 161); `TauCeti.ClassFunction.indExtend`, `characterPairing_indExtend_indExtend` (`Induction/ExceptionalCharacter.lean` 115, 270); `Subgroup.indClassFunction`, `Subgroup.indClassFunction_apply` (`Induction/ClassFunction.lean` 456, 463).
  - `TauCeti.ClassFunction` and `TauCeti.ClassFunction.powMap` (`CharacterTable/ClassFunction.lean` 53, 148); `TauCeti.ClassFunction.characterPairing`, `characterPairing_apply` (`Pairing.lean` 58, 79).
  - `TauCeti.virtualCharacters`, `TauCeti.conj_apply_of_mem_virtualCharacters`, `TauCeti.exists_eq_irreducibleCharacter_or_neg`, `TauCeti.mem_irreducibleCharacters_of_characterPairing_self_eq_one` (`VirtualCharacter.lean` 132, 270, 490, 528).
  - `TauCeti.irreducibleCharacters`, `TauCeti.irreducibleCharacter` (`Table.lean` 119, 206); `TauCeti.Representation.finrank_dvd_card` (`Degree.lean` 119); `TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow` (`Solvable.lean` 219).
- **Absent at both pins:** Baer–Suzuki, Hall subgroups, `π`-cores, the Fitting subgroup, `p`-stability, `p`-length and the Puig subgroup (grep for each object).

**Cross-roadmap citations resolved this round.**

- InverseGaloisAndArithmeticFundamentalGroups, at its open head: `### IG.3.4` (line 3034) contains *Conjugacy of coprime complements* (3305); `### IG.4.3` (3913) contains *The Fitting subgroup* (4229) and *Fitting supplements for solvable groups* (4268).
- FiniteGroupInvariants, at its open head: §0.2 (274), §0.3 (297), §2.1 (625); `IsHallFor` and `exists_isHallFor_of_isSolvable` in its `Suggested.lean` (197, 202).
- FiniteGroupExtensionSplitting, on main: §2.4 (491) and §3.1 (619), with `exists_isComplement'_of_coprime_index` and `exists_isComplement'_iff_sylow` in its `Suggested.lean` (103, 139).
- RepresentationTheory/CharacterTheory, on main: §4.2 (724), §4.3 (741), §4.4 (760), §4.6 (833).
- RepresentationTheory/InductionRestriction, on main: Layers 2–6 (268, 460, 503, 607, 661).
- GlaubermanZStar, at its open head, cites OddOrderTheorem F2 §2.3–§2.4 (its lines 61, 171, 571) and is not cited here, so there is no cycle.
- The three `resolve` leads: `IsMinimalOddSimple.proper_solvable` is the structure field at `Suggested.lean` line 48, and the two `TauCetiRoadmap.RepresentationTheory.…` strings are supplier headings naming roadmap folders.
- `overlaps.md`: no open pull request changes this roadmap or drops a cited id.

**Ownership.**

- Method: `roadmaps grep` over main and the 469 open pull requests for `p`-stability, Puig, focal subgroup, extraspecial, critical subgroup, Thompson transitivity, `O_{p',p}`, Hall conjugacy, the Dade isometry, `p`-length, the Fitting subgroup, Schur–Zassenhaus, Baer–Suzuki and `p`-cores. I also read FiniteGroupInvariants and GlaubermanZStar in the brief's checkouts, and InverseGaloisAndArithmeticFundamentalGroups and ModularCharactersAndBlocks with `roadmaps show`.
- Outside this roadmap, these objects occur in:
  - LocalFiniteGroupTheory (never-cite list, so not an owner this roadmap may cite);
  - FiniteGroupInvariants (Hall existence, cited; minimal normal subgroups and chief series, see R04);
  - InverseGaloisAndArithmeticFundamentalGroups (Fitting subgroup and Schur–Zassenhaus conjugacy, both cited);
  - CFSGBasicProperties on main (extraspecial subgroups of specific sporadic groups only);
  - ModularCharactersAndBlocks (uses `O_p(G)` without defining it).
- The Dade objects, coherence, the cyclic isometry, the prime sets and the five types are owned here alone.
- The pull-request description still names LocalFiniteGroupTheory as a prerequisite, but the README cites it nowhere (`dropped=0`), and the depends-on block names FiniteGroupInvariants and InverseGaloisAndArithmeticFundamentalGroups. The description, not the folder, is out of date.

**Sources: the seeded sample.** Every locator was checked against the math-comp transcription; the two books are uncertified.

- **0.1:** no book locator. The reduction is MC-BGsection7 lines 78–99 (`minSimpleOdd_ind`), and the Mathlib lemmas are above.
- **0.3:** MC-BGsection7 lines 143–170 (`mFT_norm_proper`, `cent_mFT_trivial`, `mFT_cent_proper`, `mFT_cent1_proper`) and 181–239 (maximal groups "as defined at the start of B & G, section 7", `mmax_exists`, `mmax_sol`, `mmax_normal`).
- **1.1:** MC-BGsection1 lines 291–301 (1.5(a)–(e) mapped to the `hall.v` lemmas; the hypotheses the README lists are those of `coprime_Hall_exists`/`_subset`/`_trans`/`coprime_quotient_cent`). The Lemma 1.22 mislabel is R05.
- **1.6:** MC-BGsection1 lines 20–21 (`p`-length one is `O_{p',p,p'}(G) = G`), 1049–1051, and 1058–1165 (1.21(a)–(e); (e) is R05); MC-BGsection6 lines 130–187 (6.5) and 198–258 (6.6: (a), (b) without solvability, (c), (d) with).
- **2.2:** MC-PF2 lines 90–98 ((2.2) clause for clause against `DadeDatum`), 148 (uniqueness of the signalizer), 172–175 ((2.3)), 190–230 ((2.4)(a)–(c)).
- **2.5:** MC-PFsection5 lines 459–486 ((5.1), additive form), 488–499 ((5.2)), 640–644 and 687–699 ((5.3), R01), 1004–1011 (`bridge_coherent`), 539–541 (`dual_coherence`), 1506–1529 and 1575–1578 ((5.9)(a), R02).
- **2.6:** MC-PFsection3 lines 28–31 and 76–77 ((3.1): cyclic, odd, `normedTI V G W`), 1277 ((3.5)), 1385–1389 ((3.2)(a)–(c)), 1501–1507 ((3.2)(d), (e)), 1510–1514 ((3.7)), 1603–1607 ((3.8)), 1754–1824 ((3.9)(a)–(c)).
- **2.8:** MC-PFsection5 lines 882, 937, 1127, 1230, 1375, 1519, 1586 ((5.4)–(5.9)); MC-PFsection6 lines 48, 83, 119–126 ((6.3): `M ≤ H₁ ≤ H ≤ K` normal in `L`, `H/M` nilpotent, `S(H₁)` coherent, `|H : H₁| > 4|L : K|² + 1`, giving `S(M)`), 572 ((6.8)).
- **3.1:** MC-BGsection10 lines 18–31 and 58–69 (`α`, `β` as no Sylow narrow, `σ`, the cores), MC-BGsection5 lines 20–36 and 51 (narrow, Theorem 5.3), MC-BGsection12 lines 44–46 (`τ₁, τ₂, τ₃`), MC-BGsection14 lines 22–61 and 86–104 (`σ`-decomposition, `ℓ_σ`, `M_σ[x]`, `κ`, `R[x]` sharply transitive when `ℓ_σ = 1`, Theorem 14.4). The C₃ ≀ C₃ Check is R07.
- **3.3:** MC-BGsection10 lines 141–148 (remarks on p. 70: `β ⊆ α ⊆ σ`), 168–179 (remark before 10.1), 393–466 (10.2(a1)–(e)), 519–536 (10.4), 631–632 (10.6: every proper subgroup has `p`-length one); MC-BGsection12 lines 48–50 (`sigma_complement`).
- **3.4:** MC-BGsection16 lines 110–162 (`of_typeF`, `of_typeI`, `of_typeP`, `of_typeII`–`of_typeV`, matched clause by clause against the README table), MC-PFsection8 lines 105, 213–214, 336–337 (Definitions (8.1), (8.3), (8.4), (8.6), (8.7)), 429–449 ((8.8) and `typeP_pair`), 471–475 ((8.9)); MC-BGsection15 lines 301, 322–324 (15.2: `M_F ≠ 1`, `M_F ≤ M_σ ≤ M'`, `M' < M`).
- **4.2:** MC-PFsection12 lines 1282–1283 ((12.7), internal to `M`).
- **4.3:** MC-PFsection12 lines 1305–1306 ((12.17)); MC-PFsection7 lines 660–663 ((7.10): there exists `i` with the displayed bound) and 826 ((7.11)); MC-PFsection8 line 928 ((8.17)).
- **4.4:** MC-PFsection13 lines 196–203 ((13.2)(a)–(e)), 271, 312 ((13.3)), 441–822 ((13.5)–(13.9)), 1491–1493 ((13.15)).
- **6.1:** MC-PFsection14 lines 1215, 1220, 1259 (`FTtype2_exclusion`, `no_minSimple_odd_group`, `Feit_Thompson`).
- **New text:** MC-BGappendixAB lines 45–74 (A.4(c) and the two-generator induction hypothesis: `odd #|⟨x, y⟩|`, `p.-group E`, `⟨x, y⟩ ≤ N(E)`, `x, y` `p`-elements centralizing `[E, x]`, `[E, y]`; conclusion `p.-group (G / C(E))`; Baer–Suzuki applied in `N(P)/C(P)`); MC-BGsection2 lines 584–591 (2.5) and 988–1002 (2.6(a), (b)); MC-BGappC lines 41–48 and 225–232 ((A), (B); `q.-abelem Q` used only through "abelian, order prime to `p`").

**Adversarial table.** One row per statement checked, with the values computed.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 odd order to sections | `C₃ ≤ C₆`; `S₃ ⧸ A₃`; `C₇ ⋊ C₃` | `6` even, `3` odd; `|S₃/A₃| = 2`; subgroup orders `1, 3, 7, 21` | correct | none |
| `IsMinimalOddSimple`, endpoint forms | trivial, `C₃`, `C₇ ⋊ C₃`, `A₅`, infinite `G` | not `Nontrivial`; commutative; `C₇ ⊴`; `60` even; `Nat.card = 0` even | equals `IsMinSimpleOddGroup` (MC-BGsection7 61–66) | none |
| §0.3 | `S₃`; `A₅`; `C₇ ⋊ C₃` | `C((12)) = ⟨(12)⟩ ≠ C(1) = S₃`; `A₄, D₁₀, S₃` self-normalizing; `N(C₇) = G` | correct | none |
| §1.1 complements = Hall `π'` (new) | `A₃ ⊴ S₃`; `C₇ ⊴ C₇ ⋊ C₃`; `C₂ ⊴ C₂²`; `V₄ ⊴ S₄` | 3 complements = `n₂ = 3`; 7 = `n₃ = 7`; `⟨b⟩, ⟨ab⟩` not conjugate, `gcd(2, 2) = 2`; `gcd(4, 6) = 2` | correct | none |
| §1.1 `O_p = ∩ Sylow` locator | MC-sylow 546–549 | 1.22 is `normal_pgroup` | wrong locator | R05 |
| §1.2 Lemma 1.1 vs FiniteGroupInvariants §0.3 | its §0.3 text and §2.1 route | "for solvable `G` every chief factor is `(ZMod p)^k`" | restated | R04 |
| §1.2 Checks | `S₄`, `C₆`, `A₅`, `A₄`, `S₃` | `F(S₄) = V₄`; chief centralizers `V₄ ∩ A₄ ∩ S₄ = V₄`; `F(C₆) = C₆`; `F(A₅) = 1`; `F(S₃) = A₃` | correct | none |
| §1.4 4.3, 1.13 (repaired) | `D₈`, `Q₈`, `P = 1` | `Ω₁(D₈) = D₈`, exp `4`; `Ω₁(Q₈) = {±1}`, exp `2`; exp `1 ≠ p` | hypotheses now exclude them | none |
| §1.4 2.5, 2.6 | `Heis₂₇`, `C₄ ≤ SL₂(3)`; `C₇ ⋊ C₃`; `S₃ ≤ GL₂(ℂ)` | `h = 4 = 3 + 1`; degrees `1, 1, 1, 3, 3`; `S₃` even | matches MC-BGsection2 584–591, 988–1002 | none |
| §1.6 6.5 (repaired) | `S₄`, `K = V₄`, `U = Stab(4)`, `H = ⟨(123)⟩` | `H ⊓ A₄ = H = H ⊓ A₃`; `|N(H)| = 24/4 = 6 = |U|`; `C_K(H) = 1`; `H^g ≤ U ⇒ g ∈ U` | correct | none |
| §1.6 6.6 | `S₄`, `p = 3` | `V₄·C₃ = A₄ = O_{3',3}`; `V₄·S₃ = S₄` | correct | none |
| §1.6 1.21 | MC-BGsection1 1162–1165 | (e): `H₁ ⊓ H₂ = 1` criterion, not stated | locator overclaims | R05 |
| §1.8 A.4(c) (new) | odd-order `G`, `p = 2` | only `P = A = 1`, image `1 ∈ O₂` | matches MC-BGappendixAB 53 (no solvability) | none |
| §1.8 two-generator lemma (new) | `x = (12)`, `y = (13)` on `V₄`; transvections in `SL₂(3)`; same-axis transvections | `[V₄, x] = ⟨(12)(34)⟩`, `⟨x, y⟩ ≅ S₃`, `|S₃| = 6` even, quotient `S₃`; `|SL₂(3)| = 24` even; `⟨x, y⟩ ≅ C₃` | oddness needed; lemma consistent | none |
| §1.8 Baer–Suzuki (new) | `S₃`, `p = 2, 3` | `⟨(12), (23)⟩ = S₃`, `(12) ∉ O₂ = 1`; `⟨x, x^g⟩ = A₃ = O₃` | correct | R06 (locator) |
| §1.8 route | `a ∈ A`, `g ∈ N(P)` | `[P, a^g, a^g] = [P, a, a]^g = 1` | matches MC-BGappendixAB 60–74 | none |
| §2.2 `DadeDatum` | `C₃ × S₃`; `S₄` control | 9-element support; `gcd(2, 2) = 2`, two complements | matches MC-PF2 94–98 | none |
| §2.3–§2.4, `IsDadeExtension`, comparison | `C₃ × S₃`; `S₃ ⊇ ⟨(12)⟩`; `L = G`; `A = ∅` | `3/6 = 9/18` vs `Ind`: `27/18`; `1/2 = 3/6`; `T = id`; `CF(L, ∅) = 0` | correct | none |
| §2.5 gluing | `{ε}`, `{ρ} ⊆ Irr S₃`, `G = S₃ × C₃` | `ℤ[{ε}, A] = 0`; `‖ρ − 2ε‖² = 5`; `ν(ρ) − 2ν(ε)` has a coefficient `±2` | false; (5.3) is subcoherence | R01 |
| §2.5 conjugate pairs | `C₃`, `τ(ω − ω̄) = 1 − ω` | `ν(ω) = 1, ν(ω̄) = ω`; `ν′ = (−ω, −1)`; `‖1 − ω‖² = 2` | false without (5.9)(a) hypotheses | R02 |
| §2.6 (3.1)–(3.5) | `W = C₃ × C₅`; `−σ`; `W₁ = 1` | `|V| = 15 − 3 − 5 + 1 = 8 = 2·4`; `‖a_ij‖² = 4`; `σ1 = 1` excludes `−σ`; `V = ∅` | correct | none |
| §2.8 (6.3) | `|L : K| = 3, 1` | thresholds `4·9 + 1 = 37`, `5`; `43 > 37`; `37 > 37` false | matches MC-PFsection6 119–126 | none |
| §3.1 prime sets | `C₃³`, `C₃² × C₅`, `S₄ ⊇ S₃`, `C₇ ⋊ C₃`, `C₅ × (C₇ ⋊ C₃)` | `α = β = {3}`; `α = ∅`; `N(⟨(12)⟩) = ⟨(12), (34)⟩ ⊄ S₃`, so `2 ∉ σ`; `3 ∈ τ₁ ∖ κ`; `3 ∈ κ` | correct | none |
| §3.1 `C₃ ≀ C₃` Check | `x = (1,0,0)t`; `x = t` | `x³ = (1,1,1)`, order `9`, `⟨x, diag⟩ ≅ C₉`; `|C(t)| = 81/9 = 9 = |⟨t⟩ × diag|` | false for order-9 `x` | R07 |
| §3.2 uniqueness Check | `V₄ ≤ S₄` | in `A₄` and three `D₈`: `4` maximal subgroups | count wrong | R07 |
| §3.3 10.2, 10.6 | `S₄`, `M = S₃`, `A₄`; `𝔽₃⁶ ⋊ (C₇ ⋊ C₃)` | `M_σ = A₃ = M'`; `σ(A₄) = ∅`, `M_σ = 1 ≠ V₄`; 3-length `2` | matches MC-BGsection10 393–466, 631 | none |
| §3.4 types, Frobenius-type data | `C₇² ⋊ C₃²` | `2³ = 8 ≡ 1 (mod 7)`: `e₁` fixed-point-free; `e₂` fixes a factor; `H(M) = C₇²` | matches MC-BGsection16 110–162 | none |
| §3.4 (8.8), 15.2 | MC-PFsection8 433–438; MC-BGsection15 322–324 | clauses b1–b4; `M_F ≠ 1 ≤ M_σ ≤ M' < M` | correct | none |
| §4.2 (12.7), complement Check | `C₇ ⋊ C₃`; `H(M)` normal Hall | `E = C₃`, kernel `C₇`; complements conjugate by IG.3.4 | correct | none |
| §4.3 (7.10) | `e = 3`, `h = 7` | `2·(0/21 + 2/63) = 4/63`; "exists `i`" | matches MC-PFsection7 661–663 | none |
| §4.4 (13.2), (13.15) | `(5, 3)`, `(7, 3)` | `124/4 = 31`, `5 ≢ 1 (3)`; `342/6 = 57`, `57/3 = 19` | correct | none |
| §5.2 inputs | MC-PFsection14 uses of §13 | `FTtypeII_support_facts` ×6, `FTtypeI_bridge_facts` ×4, `FTtypeP_bridge_facts` ×3 | (13.18)–(13.19) unowned | R03 |
| §5.4, §5.5 arithmetic | `(7, 3)`, `(5, 3)` | `19 ≡ 5 (mod 7)`; `31 ≡ 1 (mod 5)`, `(mod 15)`; `16² = 256 > 15·14 + 1 = 211` | correct | none |
| `appendixC_prime_le` | `(3, 2)`, `(5, 3)`, `(3, 5)`, `p = 2` | `gcd(4, 2) = 2`; `gcd(31, 4) = 1`, `5 ≤ 3` false; `121`, `3 ≤ 5`; vacuous | hypotheses as the source's proof uses them | none |
| headline endpoint theorems | `C₇ ⋊ C₃`, `A₅`, one-tactic probe | solvable; `60` even; probe fails on all six | not padding | none |

## Not verifiable

- Peterfalvi 2000 and Bender–Glauberman 1994: no legal copy; both are settled as `uncertified`. Every locator was checked against the math-comp transcription (lines above), and theorem numbers are taken from its comments.
- Feit–Thompson 1963 (`FT63`): an image-only scan, and OCR is not available on this worker. Definition 9.1 (§2.2) was not read.
- Isaacs, *Character Theory*, Lemma 7.7 (§2.4): not in the cache. The math-comp supplement `Dade_Ind` (MC-PF2 line 418) is cited with it.
- math-comp `solvable/sylow.v` (R05, R06): not in the roadmap's manifest. I fetched it through the sources service into a scratch copy of the manifest (key `MC-sylow`, tag `mathcomp-2.2.0`, same host and licence class as the recorded `MC-BG*` files). The worker may record it if the author cites it by line.

## Source issues

- **Error** in BenderGlauberman1994 at Theorem 10.1(e), §10 (p. 70 ff.; page of (e) not read): the formalization records part (e) as incorrectly stated and leaves it unproved (MC-BGsection10 lines 233–234); it should be corrected or withdrawn; affects nothing.
- **Gap** in BenderGlauberman1994 at Theorem 15.2, pp. 118–119: the proof shows `F(M) = C_{M_σ}(Q̄)`, whereas the statement claims `F(M) = C_M(Q̄)`; it should add that `K` acts regularly on `Q̄`, from the orders of `K`, `K*`, `Q̄` (MC-BGsection15 lines 311–316); affects the proof.
- **Gap** in BenderGlauberman1994 at Lemma 12.18, §12 (page not read): the proof cites 12.2(a) for inequality (12.5) and omits Lemma 10.3 for the rank inequalities (12.5)–(12.6); it should cite Lemma 10.3 (MC-BGsection12 lines 2509–2513); affects the proof.
- **Gap** in Peterfalvi2000 at (13.8), §13 (page not read): the proof infers orthogonality to `η₀₁` as if the virtual characters `ζ^τ₁`, `μ_j^τ₁` were characters; it should use the decomposition (13.3)(c) for every `μ_k` (MC-PFsection13 lines 719–730); affects the proof.
