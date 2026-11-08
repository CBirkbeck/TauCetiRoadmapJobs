<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7471#issuecomment-6700783894 -->
Review (claude) of 0700d4c

Verdict: needs_changes

1. **F01** (P3) §7.2 cites invertible-order suppliers for a characteristic-`p` step

   Location: `packages/ModularCharactersAndBlocksPartII/design/README.md` lines 975–981 ("Frobenius
   reciprocity and the semisimplicity of the restriction of a simple module to a normal subgroup
   (InductionRestriction Layer 5) … *Needs:* … InductionRestriction Layers 2 and 5; Tau Ceti
   `TauCeti.clifford_restrict_character`"); `design/plan.json` target 7.2 prerequisites.

   Claim: the route's inputs for the fifth statement (every `θ ∈ Irr(b)` and every `φ ∈ IBr(b)`
   lies under a member of `B`) are supplied as cited.

   Witness: the step from martinez line 1773 (a Brauer character over `φ` is a constituent of
   `φ^G`) is a statement about simple `k[G]`-modules in characteristic `p`. The cited declaration
   `TauCeti.clifford_restrict_character` (`TauCeti/RepresentationTheory/Induction/Clifford/Decomposition.lean`
   line 305) carries `hG : IsUnit (Nat.card G : k)`, InductionRestriction Layer 5 is stated "over a
   splitting field with `IsUnit (Nat.card G : k)` (regime 3)" and Layer 2's reciprocity "additionally
   require[s] `IsUnit (Nat.card G : k)`" (main, README lines 607–616 and 268–270); all fail when `p`
   divides `|G|`. The pin has the needed statements without that hypothesis:
   `FDRep.clifford_restrict_iso` (`Induction/Clifford/Equivalence.lean` line 227: `[Field k]
   [IsAlgClosed k]`, `Res_N W ≅ V.cliffordSum e`, no characteristic or invertibility hypothesis)
   and Mathlib's `Rep.indResAdjunction` (`Mathlib/RepresentationTheory/Induced.lean` line 155).

   Repair: in the route write "Frobenius reciprocity at the module level (Mathlib
   `Rep.indResAdjunction`) and the semisimplicity of the restriction of a simple module to a normal
   subgroup over any algebraically closed field (Tau Ceti `FDRep.clifford_restrict_iso`)"; in the
   `*Needs:*` replace `TauCeti.clifford_restrict_character` by `FDRep.clifford_restrict_iso` and add
   Mathlib `Rep.indResAdjunction`, keeping InductionRestriction Layer 2 for the induced character and
   Layer 5 for the ordinary Clifford statements; mirror in plan 7.2 (`tauceti:FDRep.clifford_restrict_iso`,
   `mathlib:Rep.indResAdjunction`). Add `FDRep.clifford_restrict_iso` and `Rep.indResAdjunction` to
   "Already in the libraries" and the Mathlib/Tau Ceti contracts. Tested on the instance: for
   `S₃`, `N = C₃`, `p = 2`, `φ = λ ∈ IBr(C₃)` and `ψ` the two-dimensional simple `𝔽₂[S₃]`-module,
   `Res ψ = λ ⊕ λ̄` (semisimple, `clifford_restrict_iso` with `e = 1`), and
   `Hom_G(Ind λ, ψ) ≅ Hom_N(λ, Res ψ) ≠ 0` (the adjunction) makes `ψ` a quotient of `Ind λ`, of
   dimension `2`, so `ψ = Ind λ`: the fifth statement's modular half holds there with the pinned
   inputs and needs no invertibility of `6`.

2. **F02** (P3) plan and README prerequisites drift in two targets

   Location: `design/plan.json` target 1.2 prerequisites (`target:1.1`) against
   `design/README.md` line 373 ("*Needs:* LocalFiniteGroupTheory L3 (Glauberman's lemma); Mathlib
   `ConjClasses`, `FixedPoints.subgroup`"); plan target 4.1 prerequisites
   (`mathlib:FixedPoints.subgroup`, `mathlib:QuotientGroup.mk`) against README lines 651–652
   ("Mathlib `MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)`, `IsSolvable`").

   Claim: the plan's prerequisites are the README's `*Needs:*` lines.

   Witness: 1.2's plan lists `target:1.1` which the README omits (the statement uses only Mathlib's
   `FixedPoints.subgroup` and classes, so the README is the correct one); 4.1's README names the
   quotient-action instance of `Mathlib/GroupTheory/GroupAction/OfQuotient.lean` line 62, the plan
   names `QuotientGroup.mk`, which the README never mentions. Every other target's `*Needs:*` and
   prerequisites agree (scripted comparison of all 35 targets, ranges expanded by hand).

   Repair: in plan 1.2 delete `target:1.1`; in plan 4.1 replace `mathlib:QuotientGroup.mk` by
   `mathlib:MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)` (keep `mathlib:FixedPoints.subgroup`,
   which the instance mentions). Tested: after the change the comparison script reports no
   difference for 1.2 and 4.1.

Two P3 findings below, each a repair for the fix round to apply; no P1 or P2. All four findings
of round 2 are repaired. The one declared supplier gap `gap:clifford-multiplicity-dvd-index`
(InductionRestriction Layer 7) is precise, minimal and declared in both `plan.json` and the
README; once R01 and R02 are applied the design is acceptable conditional on that gap.
Elaboration: not available (this lane does not elaborate; the design stage carries no
`Suggested.lean`).

## Repairs of round 2, finding by finding

- **F01 (P3, §7.4 uses `h` without listing §6.3) — repaired.** README line 1019: "*Needs:*
  §§6.2, 6.3, 7.1, 7.2; base §§0.2, 1.2, 2.1, 7.1, 8.2"; plan 7.4 prerequisites contain
  `target:6.3`. The same pattern was repaired in §8.3 (line 1142, "*Needs:* §§6.3, 7.2, 7.6,
  8.2") and §9.2 (line 1216, "*Needs:* §§6.3, 6.4; base `brauer_first_main`"), with plan 8.3 and
  9.2 each carrying `target:6.3`. No other target uses `h`, `d(χ)` or `Irr₀` without reaching
  §6.3 (grep of every `*Needs:*` line: §§6.4, 7.4, 8.2, 8.3, 8.4, 9.1, 9.2 list §6.3).
- **F02 (P3, `p'`-part with no `p`) — repaired.** README lines 547–551: "for `π` the set of
  primes dividing `|A|`, the `π`-part of `a g` (the power of `a g` whose order is the largest
  divisor of the order of `a g` built from primes in `π`) has order `|A|`, because `(a g)^{|A|}`
  lies in `Γ` and so has order prime to `|A|`"; the `SL(2,3)` Check (lines 560–562) computes the
  `3`-part `(a·(−1))⁴ = a` and the `2`-part `−1 ∈ Q₈`. §4.3's unbound `p` is now
  "`p = |S : S₁|` … (glauberman line 562)" (line 690), which is the source's choice (glauberman
  lines 562–564: `p = |A/A₁|`, `A = B × E`, `E ⊆ A₁`).
- **F03 (P3, garbled §7.2 route) — repaired, differently and correctly.** README lines 964–979
  give one clause per statement; the fourth uses orthogonality of the idempotent sums of two
  distinct orbits instead of primitivity (correct: `e_B ≤ f₁` and `e_B ≤ f₂` with `f₁ f₂ = 0`
  force `e_B = 0`), and base §0.2 is added to the `*Needs:*` and to plan 7.2. The route for the
  fifth is the one R01 refines.
- **F04 (P3, §1.2 narrower than its supplier) — repaired.** README line 364: "Let `S` be coprime
  to `Γ`, with `S` or `Γ` solvable"; lines 368–370 say the hypothesis is the one under which
  LocalFiniteGroupTheory L3 supplies Glauberman's lemma; plan 1.2 hypothesis
  `IsSolvable S ∨ IsSolvable Γ`; the L3 contract (lines 278–282) states the same hypothesis; a
  new Check with nonsolvable `S = A₅` on `𝔽₇⁵` (lines 383–389) is computed below and holds. The
  heading changed to "Fixed classes under a coprime action"; no roadmap cites the old heading
  (`roadmaps grep` for it over main and the 466 open heads: no match outside this package).

## Verified sound

**Principles.** Every statement is for arbitrary finite `Γ`, solvable (or cyclic) `S`,
arbitrary `p` and an arbitrary splitting `p`-modular system; no route-specific shortcut. The base
is extended, not re-planned: its §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3, 7.1–7.2,
8.1–8.2 are imported by number and all exist at its head #1775 (headings at `scratch/base.md`
lines 246, 287, 308, 329, 367, 394, 413, 463, 503, 542, 554, 580, 603, 661, 688, 719, 758, 780,
821, 835); `existsUnique_blockIdempotent_map_residue` (base §1.3, line 342), `IsDefectGroup`,
`isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (base §6.2, lines
690–699), `brauer_first_main` (base §7.1, line 767) and the covering of Martínez Definition 7.3
and Theorem 7.7 (base §8.2, line 841) are stated where cited. Layers 6–9 own heights, covering
through central characters, Fong–Reynolds, blocks with a normal defect group and the two
predicates, none of which the base states. Single direction of supply (gate below). Own words with
locators throughout; no copied passage; no algorithm; no Lean file at this stage; no sorry'd data
or `set_option` to check.

**Gate output** (candidate README, `merge-order/ORDER.txt`, the content checkout):

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after ModularCharactersAndBlocks (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2354 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Resolver: no cross-roadmap citation and no Lean name found nowhere
(it reports that names outside TauCetiRoadmap were not checked on this host; I opened each at the
pins by hand, below). `plan.json` parses; `sources.toml` parses and records every cited work with
`cited_for`; the five paywalled texts are `uncertified`, cited by locator only, as settled.

**Suppliers resolved at their heads.** LocalFiniteGroupTheory #1634: L1 (`scratch/lfgt.md`
line 131) with `exists_conj_eq_of_isComplement'` (line 147, "`N` or `G ⧸ N` solvable"), L3
(line 186, † = `Group.IsSolvable A ∨ Group.IsSolvable G`) with Glauberman's lemma (line 193) and
`exists_mem_fixedPoints_mul_of_forall_mem` (line 198). CharacterTheory on main: §2.1 (README
line 349, sum of squares), §3.5 (line 497, `primitiveCentralIdempotent`, `characterTable`,
`sum_characterTable_mul_conj`), §3.6 (line 521), §4.3 (line 741, central characters,
`finrank_dvd_card`), §4.4 (line 760, `fieldOfValues_eq_map_fixedField_stabilizer` at 790).
InductionRestriction on main: Layers 1, 2, 5, 7 (lines 241, 268, 607, 721); Layer 7 is
"projective representations, factor sets, and the Schur multiplier" and a grep of lines 721–864
for "divid" finds no degree divisibility, as the gap contract says. FiniteGroupInvariants §6.2 at
#1708 (line 793, "Galois orbits and Brauer's permutation lemma") is named under "Not owned" only
and appears in no `*Needs:*` line. `scratch/overlaps.md`: no open pull request changes this
roadmap, no cited id dropped, none defined only by an open revision.

**Ownership against open work.** `roadmaps grep` over main and the 466 open heads for
"Glauberman correspondence", "Fong.Reynolds", "Alperin.McKay", "theorem on heights": no match;
"Gallagher": only the zero-one law of #1421; "height zero": only unrelated heights (#792, #849,
#923, #929, #999, #1000, #1005); "canonical extension": only connections and automorphic bundles;
"Brauer's permutation lemma": FiniteGroupInvariants #1708 only (the Galois version, cited as not
owned); "defect class": the base #1775 and unrelated uses. GlaubermanZStar #1778 cites
ModularCharactersAndBlocks M1–M8 and LocalFiniteGroupTheory L1 only (no "height", "Part II",
"invariant character" or "canonical extension"); OddOrderTheorem #1777 cites LocalFiniteGroupTheory
L3 for coprime action and no character correspondence. Every open pull request the brief names
came with its files, so nothing was left unchecked. This roadmap is the single owner of its
objects.

**Library declarations opened at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the revs
of `lake-manifest.json`). Mathlib: `arrowAction` (`Algebra/Group/Action/Basic.lean` 103),
`FixedPoints.subgroup` and `FixedPoints.mem_subgroup` (`GroupTheory/GroupAction/Defs.lean` 203,
208), the instance `MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)`
(`GroupTheory/GroupAction/OfQuotient.lean` 62), `MulDistribMulAction.toMulAut`
(`Algebra/Group/Action/End.lean` 229), `Subgroup.normalizerMonoidHom`
(`GroupTheory/Subgroup/Centralizer.lean` 186), `Subgroup.exists_right_complement'_of_coprime`
(`GroupTheory/SchurZassenhaus.lean` 277; the file's only conjugacy statement is `exists_smul_eq` at
103 for the abelian `QuotientDiff` case, as the contract says), `SemidirectProduct.inl_aut` (138,
`inl (φ g n) = inr g * inl n * inr g⁻¹` as quoted), `range_inl_eq_ker_rightHom` (175),
`Representation.isIntegral_character` (`RepresentationTheory/Character.lean` 102, `[Finite G]`),
`ZMod.chineseRemainder` (`Data/ZMod/Basic.lean` 889), `IsPrimitiveRoot.autToPow`
(`RingTheory/RootsOfUnity/PrimitiveRoots.lean` 791), `padicValRat`
(`NumberTheory/Padics/PadicVal/Basic.lean` 126), `Rep.indResAdjunction`
(`RepresentationTheory/Induced.lean` 155). Tau Ceti: `irreducibleCharacters`
(`CharacterTable/Table.lean` 114), `mem_irreducibleCharacters_iff` (123),
`card_irreducibleCharacters` (181, under `[Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]`
at 155, as the contract says), `characterTable` (337), `characterPairing` (`Pairing.lean` 48),
`virtualCharacters` (`VirtualCharacter.lean` 127), `Representation.nonempty_equiv_of_character_eq`
(`CharacterTable/Determined.lean` 49), `conjNormalFDRep` (`Induction/Conjugate.lean` 683),
`conjNormalFDRep_ρ` (836), `char_conjFDRep` (485), `inertia` (`Induction/Inertia.lean` 94),
`mem_inertia_iff` (100), `le_inertia` (111), `FDRep.cliffordCorrespondence`
(`Clifford/Classes.lean` 125), `FDRep.clifford_restrict_dvd_finrank` (`Clifford/Dimension.lean`
113: `dim V ∣ dim W`, `[G : inertia V] ∣ dim W`, `[G : inertia V] ∣ [G : N]`, and
`[G : inertia V] ∣ dim W / (e · dim V)`; no `dim W / dim V ∣ [G : N]`, so the gap is not at the
pin), `clifford_restrict_inertia_eq_top_of_coprime` (142), `clifford_restrict_character`
(`Clifford/Decomposition.lean` 305, with `hG`), `FDRep.clifford_restrict_iso`
(`Clifford/Equivalence.lean` 227, no `hG`), `IsProjectiveInertiaExtension`
(`Clifford/Obstruction.lean` 87), `exists_isProjectiveInertiaExtension` (162),
`cliffordObstruction_eq_zero_iff` (named at 33, 52), `tensorRep` (`TensorFactorization.lean` 108,
factor set `β⁻¹`), `tensorRepEquiv` (329), `tmulIntertwining_bijective`
(`ProjectiveCorrespondence.lean` 149), `isIrreducible_tensorRep_iff` (223),
`cyclotomicIrreducibleCharacterAction` and `_apply` (`Cyclotomic/Action.lean` 172, 201),
`FDRep.characterField` (`FieldOfValues.lean` 44), `Representation.centralCharacter`
(`CentralCharacter.lean` 89), `centralCharacter_classSumCenter_mul_character_one` (162),
`isIntegral_centralCharacter_classSumCenter` (180), `Representation.finrank_dvd_card`
(`Degree.lean` 117), `primitiveCentralIdempotent` (`CentralIdempotent.lean` 301), `classSum`
(`ClassSum/Basic.lean` 31), `classSumCenter` (`ClassSum/Basis.lean` 76),
`SemidirectProduct.range_monoidHomSubgroup` (`TauCeti/GroupTheory/SemidirectProduct.lean` 33).
No cited name is missing at the pins. Duplication by object: grep of both pins'
`RepresentationTheory` trees for "Glauberman", "Gallagher", "Osima", "defectGroup", "Fong",
"canonical extension", "invariant irreducible": nothing; "height" hits only crystals, Specht
modules and Coxeter heights; "Alperin" hits `PGroupInvariants.lean` and `Unipotent/PowerOrder.lean`
(not McKay); no `Block` directory at the pin; the only degree-index divisibilities are
`Dimension.lean` 113–119; the projective-representation files
(`RepresentationTheory/ProjectiveRepresentation/*`) state no degree divisibility.

**Sources: the seeded sample, read at the locators.**
- 1.1: glauberman lines 92–96 (the conjugate `η^a(g) = η(g^{a⁻¹})`, relatively prime operator
  group); hartley-turull line 302 (`S`, `G` finite of coprime orders, `χ ∈ Irr_S(G)`). Supported.
- 2.4: glauberman lines 240–243, Theorem 2 (c), citing Gallagher; stated for the canonical
  extension in the coprime setting; the general form is isaacs Corollary 6.17 (uncertified) and the
  route through the pinned tensor factorisation is independent of the source. Supported.
- 3.3: glauberman lines 364–374, Corollary 4, proof: `η|_{GB}` is the canonical extension to
  `G⟨a⟩`, then Theorem 3; the README's route is the same. Supported.
- 4.3: glauberman lines 542–543, Theorem 4 (b), (c); proof lines 555–600 (`p = |A/A₁|`,
  `A = B × E`, `E ⊆ A₁` at 562–564; two series with different first terms through
  `J = A₁ ∩ B₁` at 589–593). Supported.
- 4.6: glauberman lines 636–643, Theorem 5 (a)–(d); proof 647–656 ((b) reduced to prime order,
  (d) from Theorem 4 (a)). Supported.
- 5.1: glauberman line 644, Theorem 5 (e), proof 657–668 (induction on the series, then the
  central-character integrality `[GA : C_{GA}(a)] η(a)/η(1)`). Supported.
- 5.2: geck lines 29–30 (the statement `θ*(1) ∣ θ(1)`), 34–36 (completion in general);
  hartley-turull lines 84–86, Theorem A (conditional on Condition 6.10), line 91 (reduction to
  `|S|` prime). Supported.
- 6.1: martinez lines 351–373 (`ω_χ`, `λ_χ = ω_χ(𝒞⁺)*`, `λ_B`), 414 (Proposition 2.3, Osima),
  512–515 (Proposition 2.5), 566 (Corollary 2.7), 696–699 (defect class), 759–761 (`p`-regular).
  Supported.
- 6.2: martinez line 728, Theorem 3.4, with `d(B)` from 719–721; proof 783–831 is the README's
  route step by step; mnst lines 51–55. Supported.
- 7.3: martinez lines 1928–1930, Theorem 8.5 (i). The OCR drops the bars, so the statement reads
  either "for any `D ∈ δ(B)` there is `P ∈ δ(B̄)` with `P ⊆ DN/N`" or "for any `D̄ ∈ δ(B̄)`
  there is `P ∈ δ(B)` with `D̄ ⊆ PN/N`"; by conjugacy of defect groups on each side the two are
  equivalent to the README's "some defect group of `B̄` is contained in `DN/N`". Supported.
- 7.4: martinez line 1823, Theorem 7.12 (i) bijection `Bl(G_b | b) → Bl(G | b)` (lines
  1827–1830); reynolds lines 133–145, Theorem 1 (a)–(d), with line 130 for heights; reynolds
  line 149, Theorem 2; sambale line 509, Theorem 1.19 (bijection preserving defect groups,
  `k_i(B)` and decomposition matrices). Supported.
- 7.6: martinez line 1985, Theorem 8.8; line 2295, Theorem 9.6; sambale line 499, Theorem 1.18
  (bijection with the `N_G(P)`-classes of blocks of `C_G(P)P` with defect group `P` and
  `|N_G(P,b) : C_G(P)P| ≢ 0 (mod p)`). Supported.
- 8.1: martinez line 2011, Theorem 8.10, proof deferred to navarro-1998 Theorem 5.9. Supported.
- 8.4: reynolds line 542, Theorem 9 ("as an immediate corollary" of Theorem 8, line 531, whose
  proof at 534–540 uses the projective-degree step, line 538); martinez line 2328, Theorem 9.8,
  proof 2330–2349. Supported.
- 9.2: ruhstorfer lines 16–18 (the conjecture), 20 (Theorem A); martinez line 2360,
  Conjecture 9.9. Supported.
Also read: glauberman 100–106 (Theorem 1), 173–177 (Lemma 1), 234–264 (Theorem 2 and the note
naming the canonical extension), 266–286 (Lemma 2 and its proof, the `β h` decomposition at
274–280), 287–298 (Lemma 3), 299–307 (Theorem 3), 355–361 (Brauer's theorem), 375–390
(Corollary 5), 454–466 (Corollary 6), 481–526 (Lemma 4, the definition, Lemma 5), 601–629
(Corollaries 7–9); martinez 1638–1660 (Definition 7.3, Problems 7.4–7.5, Proposition 7.6),
1755–1819 (Corollary 7.8, Propositions 7.9, 7.11), 1976–1980 (Lemma 8.6), 2018–2035 and
2125–2131 (Theorem 8.11, Corollary 8.12), 2161–2170, 2222–2224, 2264–2296 (Lecture 9); reynolds
58–61 (height), 509–523 (Theorem 7); kessar-malle 22–26; mnst 70–73; ruhstorfer 33–34;
spath-vallejo 118–130. All agree with the README. No locator in the plan is flagged unverified.

**Adversarial table.** One row per sampled target, headline, repaired passage, and the gap;
values computed by hand.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `arrowAction` convention and Checks | `C₇ ⋊ C₃`, `s : r ↦ r²`, `χ(r) = ζ₇`; `Q₈ ⋊ C₃`; `S = 1` | `s⁻¹ • r = r⁴` (`2·4 ≡ 1`), `(s·χ)(r) = ζ₇⁴`, wrong model `ζ₇²`; `inl_aut` with `g = s⁻¹`: `inr s⁻¹ · inl g · inr s = inl (s⁻¹ • g)`, so `char_conjFDRep` gives `χ(s⁻¹ • g)`; `Q₈`: three nontrivial linear characters (kernels `⟨i⟩, ⟨j⟩, ⟨k⟩`) permuted cyclically, `Irr_S = {1, χ₂}`, `C = {±1}`; `S = 1`: identity | holds | none |
| §1.2 fixed classes, `S` or `Γ` solvable (repaired) | `Q₈ ⋊ C₃`; `⟨t⟩` on `S₃`; `C₂` swapping `C₂ × C₂`; `A₅` on `𝔽₇⁵`; `A₅` on `𝔽₅⁵`; `S = 1` | `2 = 2`; non-coprime `3 ≠ 2`; coset `{(1,0),(0,1)}` has no fixed point; `A₅` (order `60`) coprime to `7⁵`, `Γ` abelian so the hypothesis is met with `S` nonsolvable; `C` = constants, `7 = 7`; coset `{Σ v_i = c}` contains `(3c,…,3c)` since `5·3c = 15c ≡ c (mod 7)`; over `𝔽₅`: `5 ∣ 60`, `5x = 0 ≠ 1`, no fixed point; `S = 1`: identity | holds; Glauberman's lemma applied to `Γ` on a class and to `H` on `gH` needs exactly "`S` or `Γ` (hence `H`) solvable" | none |
| §1.3 permutation lemma | `C₃` inversion; `Q₈`, order `3`; inner of `S₃`; `Γ = 1` | `1 = 1`; `2 = 2`; `3 = 3`; `1 = 1`; `P X = X Q` with `X` invertible by column orthogonality gives `tr P = tr Q` | holds | none |
| §2.1 normalised extension | `Q₈`, `A = C₂` by `i`; `Γ = 1`, `A = C₂`, `V = ℚ`; `A = 1`; uniqueness | implementing operators `±√−1·ρ(i)`, `det = (√−1)²·det ρ(i) = −1`, no extension of determinant `1`; `Γ = 1`: trivial vs sign, determinants `1`, `−1`; two extensions differ by a homomorphism `h : A → F^×` with `h^r = h^n = 1`, `gcd(r,n) = 1 ⇒ h = 1`; final rescaling `μ = δ^{−j'}` with `j' r ≡ 1 (mod n)` gives `μ^r δ = δ^{1−j'r} = 1`, no roots needed | holds over every field | none |
| §2.2 canonical extension (headline) | `SL(2,3)`, `χ₂`; `S₃`, `χ = 1`; trivial action | order-`3` element: eigenvalues `ω, ω²`, trace `−1`, `det 1`; `det(χ̂λ) = λ² ≠ 1` on `C₃`; `o(μ) = lcm(o(μ|_Γ), o(μ|_S))`, coprime to `|S|` iff `μ|_S = 1`; `S₃`: `1`, not `sgn` (`det = −1`); trivial action: `χ × 1_S` | holds; matches hartley-turull line 304 | none |
| §2.3 values | `SL(2,3)`; `ℚ(ζ₄) ∩ ℚ(ζ₃)`; `4, 8` | `χ̂ = 2, −2, 0, −1, 1`; `(χ̂ω)(a) = −ω ∉ ℤ`; `ℚ`; `ℚ(i)`; `χ̂(s) ∈ ℚ(ζ_{|Γ|}) ∩ ℚ(ζ_{|S|}) = ℚ`, integral, so in `ℤ` | holds | none |
| §2.4 Gallagher (headline) | `SL(2,3)` over `χ₂`; `N = G`; `N = 1`; `Q₈`, `N = Z`, `θ` faithful; `S₃`, `N = C₃`, `θ = λ` | `3 = 3` (degrees `1,1,1,2,2,2,3`; the three `2`'s restrict to `χ₂`, the `3` to the nontrivial linear characters); `{θ}`; identity; `−1 ∈ [Q₈,Q₈]` so no extension, `1 ≠ 4`; `λ` not invariant, so no `χ̂` with `χ̂|_N = λ` exists and the hypothesis excludes the instance | holds; extension hypothesis needed and present | none |
| §3.1 cosets (repaired route) | `S₃`, `a g = (12)`; `SL(2,3)`, `a·(−1)`; `A = 1`; `D₈`, `a x`; the order claim | `(12)` of order `2`, `π = {2}`, `π`-part `(12)`, `⟨(12)⟩ ∩ C₃ = 1`; `a·(−1)` of order `6`, `π = {3}`, `(a·(−1))⁴ = a⁴(−1)⁴ = a` of order `3 = |A|`, `(a·(−1))³ = −1 ∈ Q₈`; `π = ∅`, part `1`; non-coprime `(ax)² = x²`, `π`-part `ax` of order `4 ≠ 2`; in general `o(ag) = |A|·m` with `m = o((ag)^{|A|})` dividing `|Γ|`, so the `π`-part has order `|A|`; `k|Γ| ≡ 1 (mod |A|)` gives `(at)^{k|Γ|} = a` for `t ∈ C`; `S₃`: `aC₃` = three transpositions, one class; `SL(2,3)`: `4 + 4 = 8`, centraliser of `a` of order `|A||C| = 6` | holds; complement conjugate by L1 with the cyclic quotient solvable | none |
| §3.2 sign | `SL(2,3)`; `C₂` trivial on `C₃`; `C₂` inverting `C₅`; `A = 1` | `χ̂(a) = −1 = ε·1`, `χ̂(−a) = 1 = ε·sgn(−1)`, `ε = −1`, same for `a²`; `ε = 1`, `χ* = χ`; `C = 1`, `χ̂(a) = 1`, `ε = 1`; `χ̂ = χ`, `ε = 1` | holds | none |
| §3.3 one element (sampled) | `SL(2,3)`, `a` of order `3`; `a = 1`; `C₃ × C₃` on `Q₈` through one factor, `a` in the kernel and `a` outside | `C_a = {±1}`, `χ̂(a) = −1`, `χ̂(−a) = −(ω + ω²) = 1`, `ε = −1`, `λ = sgn`; `C_a = Γ`, `ε = 1`, `λ = χ`; `Γ ⋊ A = SL(2,3) × C₃`, `χ̂ = η × 1` (determinant `1` on `A`); kernel element: `C_a = Q₈`, `χ̂(at) = η(t)`, `ε = 1`, `λ = χ₂`; other: `C_a = {±1}`, `ε = −1`, `λ = sgn`; `C_a = 1` forces `χ̂(a) = ±1` | holds; restriction to `Γ ⋊ ⟨a⟩` is canonical by the §2.2 API | none |
| §3.4 restriction formulas | `SL(2,3)`, `B = 1`; `χ = 1`; `3^{1+2}_+ ⋊ C₂`; `C₂` on `C₃ × C₅`; `|A|` odd | `(2 sgn + sgn)/3 = sgn`; `ε' = 1` from `χ(1) = ε'λ(1) > 0`, `Γ = C·Γ`; `(3ω − ω)/2 = ω`; `χ|_C = ψ = λ`, `Γ = C₃·C₅`; `θ₀² = 1` on `A/B` of odd order forces `θ₀ = 1` | holds | none |
| §4.1 series correspondence | `C₃` on `Q₈`; `C₆` on `Q₈ × C₅`, two series; `S = 1` | `sgn ↦ χ₂`; `C₆ ⊵ C₃ ⊵ 1`: `sgn ↦ sgn × 1 ↦ χ₂ × 1`; `C₆ ⊵ C₂ ⊵ 1`: `sgn ↦ χ₂ ↦ χ₂ × 1`; empty series: `id`; `β` normalises `A ⇒ β(C_Γ(A)) = C_Γ(A)` | holds | none |
| §4.2 `p`-group (headline) | `SL(2,3)`; `3^{1+2}_+`, `(x,y,z) ↦ (−x,−y,z)`; `S = 1` | `(x+x', y+y', z+z'+xy')` preserved, an automorphism; `C = Z`; `χ|_Z = 3ω`; `(3ω − ω)/2 = ω`, `[χ|_C, ω] = 3` odd, unique; `SL(2,3)`: `[χ₂|_C, sgn] = 2 ≡ −1 (mod 3)`; `S = 1`: quotient `0` | holds | none |
| §4.3 independence (sampled, repaired route) | `C₆ ⊵ C₃ ⊵ 1`; `C₆ ⊵ C₂ ⊵ 1`; `C₃₀ ⊵ C₁₅ ⊵ C₅ ⊵ 1`; `C₉` on `C₁₉`; trivial action; subnormal chain | `p = |S:S₁| = 2`, `P = C₂`, `E = C₃ = S₁`; `p = 3`, `P = C₃`, `E = C₂ = S₁`; `p = 2`, `E = C₁₅ = S₁`; in each `E ⊆ S₁` since `E` maps trivially to `C_p` (glauberman 562–564); same `χ₂ × 1` for both `C₆` series; `u` of order `9` in `𝔽₁₉^×`: `r^u = r` iff `19 ∣ u − 1`, so `C = 1`; `ψ_j(r^u) = ψ_j(r)` iff `19 ∣ j(u−1)` iff `j = 0`, `Irr_S = {1}`; trivial action: every cyclic step is `χ ↦ χ`; chain `1 = T₀ ⊴ ⋯ ⊴ T_r = S` with `p_i`-group factors refines to a composition series through every `T_i`, and the composite of the factor correspondences `Irr(C_Γ(T_{i+1})) → Irr(C_Γ(T_i))` is `Λ` for that series | holds | none |
| §4.4 count (headline) | `F₂₁ = C₇ ⋊ C₃`, `α : r ↦ r⁻¹, s ↦ s`; `SL(2,3)`; `3^{1+2}_+`; `C₃` on `C₇` | `α(srs⁻¹) = r⁻² = α(r)²`, an automorphism of order `2` coprime to `21`; `C = ⟨s⟩`; orbits `{1,2,4} ↔ {3,5,6}` swapped, three linear fixed: `3`; classes `{1}`, two `r`-classes swapped, two `s`-classes fixed: `3`; `|Irr(C₃)| = 3`; `2 = 2 = 2`; `3 = 3 = 3`; `1 = 1 = 1` | holds; Corollary 9 uses §1.2 with `S` solvable | none |
| §4.5 Glauberman correspondence (headline) | `SL(2,3)`; swap on `C₃ × C₃`; swap on `C₂ × C₂`; `S = 1`; uniqueness | `[χ₂|_C, sgn] = 2 ≡ −1 (mod 3)`, `[χ₂|_C, 1] = 0`; `(ψ_a × ψ_a)(r,r) = ζ₃^{2a}`, so `θ* = ψ_{2a}`, not `ψ_a`; non-coprime: `(1,1)` and `(−1,−1)` both restrict to `1` on the diagonal with multiplicity `1`, no injective assignment; `S = 1`: `π = id`; uniqueness by induction through `T ⊴ S` of prime index, the factor `π(C_Γ(T), S/T)` fixed by the unique constituent of multiplicity prime to `p` | holds | none |
| §4.6 equivariance (sampled) | swap on `C₃ × C₃`, `α` inversion, `j = 2`; `SL(2,3)`; non-faithful `S` | `α` commutes with the swap, `α(C) = C`; `(ψ_a × ψ_a) ∘ α⁻¹ = ψ_{−a} × ψ_{−a}`, `(ψ_{−a} × ψ_{−a})* = ψ_{−2a} = ψ_{2a} ∘ α⁻¹`; `(ψ_{2a} × ψ_{2a})* = ψ_{4a} = ψ_a` and `(ψ_{2a})^{(2)}(r) = ζ^{4a} = ψ_a(r)`; `ℚ(χ₂) = ℚ = ℚ(sgn)`; `[χ₂|_C, sgn] = 2 ≠ 0`; `φ(K) ⊆ K` for the kernel `K`, so `(α, φ)` descends to `S/K`; CRT `j' ≡ j (|Γ|)`, `j' ≡ 1 (|S|)` keeps `det χ̂` trivial on `S` | holds | none |
| §5.1 degree bound (sampled, headline) | `SL(2,3)`; `3^{1+2}_+`; trivial action; `θ = 1`, `C ≠ Γ`; the reduction | `[Γ ⋊ A : A × C] = |Γ|·|A|/(|A|·|C|) = |Γ:C|`, `χ̂(1) = θ(1)`, `χ̂(a) = ±θ*(1)`, so `|Γ:C| θ*(1)/θ(1)` is a rational algebraic integer; `2 ∣ 4·1`; `3 ∣ 9·1`; `θ(1) ∣ 1·θ(1)`; `|Γ:C| ∤ 1`; for `T ⊴ S` of prime index, `θ(1) ∣ |Γ:C_Γ(T)| θ₁(1)` and `θ₁(1) ∣ |C_Γ(T):C| θ*(1)` multiply to `|Γ:C|` | holds | none |
| §5.2 predicate (sampled) | `SL(2,3)`; `3^{1+2}_+`; abelian `Γ`; trivial action; variant; the reduction | `1 ∣ 2`; `1 ∣ 3`; `θ` linear, `θ* = θ|_C`, `1 ∣ 1`; `C = Γ`, `θ* = θ`; `2 ∤ 1`; prime-order case gives `θ*(1) ∣ θ₁(1)` and induction `θ₁(1) ∣ θ(1)`; `θ|_C` irreducible and `[θ|_C, θ*] ≠ 0` force `θ* = θ|_C` | holds; geck 29–36 and hartley-turull 84, 91 cited, not planned | none |
| §6.1 defect classes (sampled) | `S₃`, `p = 2`, `B₀` and `{std}`; Osima at `x = r`; `{1}` | `e_{B₀} = (1/3)(1 + r + r²)`: coefficients `1/3 ≡ 1`, `1/3 ≡ 1`, `0`; `λ_{B₀}({1}⁺) = 1`, `λ_{B₀}(𝒞_r⁺) = 2 ≡ 0`, so `{1}` is the defect class, Sylow `2`-subgroup of `C_G(1)` of order `2`; `e_{std} = 2/3 − (1/3)(r + r²)`: `2/3 ≡ 0`, `−1/3 ≡ 1`; `λ_{std}(𝒞_r⁺) = 2·(−1)/2 = −1 ≠ 0`, `C_G(r) = C₃`, Sylow `1`; Osima: `Σ_{B₀} χ(1)χ(r) = 2 = 1·Φ₁(r) = (1 + sgn)(r)`, coefficient `2/6 = 1/3`; `1` and `sgn` share `φ = 1`, so `{1}` is no union of components and `e_1` has `1/6 ∉ ℤ₂`; uniqueness of `λ_B`: exactly one `e_B ↦ 1`, and the local algebra `Z(k[G])e_B` has one `k`-point | holds | none |
| §6.2 Brauer on heights (sampled, headline) | `S₃` at `2`; `SL(2,3)` at `3`; `A₅` at `2`; route | `a = d = 1`, degrees `1, 1`; `{std}`: `2 ∣ 2`; `SL(2,3)`: central characters mod `m ∣ 3` separate `{1, ω, ω²}` (`ω ≡ 1`), `{χ₂, χ₂ω, χ₂ω²}` (`ω_{χ₂}(−1) = −1 ≢ 1`) and `{χ₃}`; `ν₃(2) = 0 = a − d`, `d = 1`; `{χ₃}`: `3 ∣ 3`; `A₅`: `B₀ = {1,3,3,5}`, `D = V₄`, `a = d = 2`, `1 ∣` all, `{χ₄}`: `4 ∣ 4`, wrong model `4 ∤ 1`; `ν(|𝒞|) = a − ν|C_G(x)| = a − d` for a defect class | holds | none |
| §6.3 heights | `SL(2,3)` at `2`; `D₈`; `S₃`, `std` | `ν₂(1,1,1,2,2,2,3) − 0 = 0,0,0,1,1,1,0`, `|Irr₀| = 4`; `0,0,0,0,1`; `ν = 1 = a`, `d(std) = 0`, no truncation since `a − d ≤ ν(χ(1)) ≤ a` | holds | none |
| §7.1 Min–Max | `S₃` at `2`, `3`; `G = 1` | `λ_{B₀}(𝒞_t⁺) = 3 ≡ 1`, `D_t = ⟨t⟩ ⊇ D_{B₀}`; `a_{B₀}(Cl r) = 1`, `D_r = 1`; `p = 3`: `λ(𝒞_t⁺) = 3 ≡ 0`, `λ(𝒞_r⁺) = 2 ≢ 0`, `D_r = C₃ = D_B`; `D_B = D_1 = 1` | holds | none |
| §7.2 first and second (repaired route) | `S₃`, `N = C₃`, `p = 2`; `N = 1`; `N = G` | `ω_std(𝒞_r⁺) = 2·(−1)/2 = −1 = ζ + ζ² = ω_λ(𝒞_r⁺)`, `ω_1 = 2 ≠ −1`; orbit idempotent `f_θ = Σ e_{θ_i}` is `G`-invariant, a combination of `G`-class sums in `N`, `ω_ξ(f_θ) = 1` iff `ξ` conjugate to `θ`; `λ_{B₁}(𝒞_r⁺) = −1 ≡ 1 = λ_{b_λ}`, `λ_{B₀}(𝒞_r⁺) = 2 ≡ 0 ≠ 1`; `N = 1`: `λ(1) = 1`; `N = G`: `B = b` | holds | none |
| §7.2 third, fourth, sixth (repaired route) | `S₃`, `N = C₃`, `p = 2`, `b_λ`, `b_1` | `e_λ + e_λ̄ = (2 − r − r²)/3 ≡ r + r² = e_{B₁}`, `(1 + r + r²)/3 ≡ e_{B₀}` (mod `2`); `(r + r²)(1 + r + r²) = 2(1 + r + r²) ≡ 0`, so `B₁` lies under `{λ, λ̄}` only; `λ_{B₁}(t⁺) = 0 = λ_{b_λ}(0)`, `λ_{B₁}(𝒞_r⁺) = 1 = λ_{b_λ}(r + r²)`, so `b_λ^G = B₁` covers `b_λ`; `b_1^G` undefined (`λ_{B₀}(t⁺) = 1 ≠ 0`, `λ_{B₁}(𝒞_r⁺) = 1 ≠ 0`), statement vacuous there | holds | none |
| §7.2 fifth (route inputs) | `S₃`, `N = C₃`, `p = 2`, `φ = λ`, `ψ` two-dimensional | `Res ψ = λ ⊕ λ̄` semisimple (`clifford_restrict_iso`, `e = 1`); `Hom_G(Ind λ, ψ) ≅ Hom_N(λ, Res ψ) ≠ 0` (`indResAdjunction`), `dim Ind λ = 2 = dim ψ`, so `ψ = Ind λ`; `clifford_restrict_character` and Layer 2 reciprocity need `6` invertible in `𝔽₂`, which fails | statement holds; cited names at the wrong generality | R01 |
| §7.3 domination (sampled) | `S₃`, `N = C₃`, `p = 2`, `3`; `N = 1`; `S₃ × S₃`, `N = S₃ × 1`, `p = 2`, `B = {std} ⊗ B₀`; the trace formula | `B₀` dominates the block of `C₂`, `DN/N = C₂ ⊇ C₂`; `p = 3`: `DN/N = 1 ⊇ 1` for both defect-zero blocks of `C₂`; `B̄ = B`; `ē_B = ε(e_{std}) e_{B₀} = 0`, no domination, and `|N : N ∩ D| = 6` is not a unit, so "image nonzero ⇒ unit" is the right implication; `Tr_D^G(a) ↦ |DN : D| · Tr_{DN/N}^{G/N}(ā)` since the fibres of `G/D → (G/N)/(DN/N)` have `|DN : D| = |N : N ∩ D|` elements and `ā` is `DN/N`-invariant | holds | none |
| §7.4 Fong–Reynolds (sampled, headline) | `S₃`, `N = C₃`, `p = 2`, `b = {λ}`; `T = G`; `S₄`, `N = V₄`, `p = 3`, `ker λ = ⟨(13)(24)⟩`; heights in general | `T = C₃`, `λ^G = std`, `h(λ) = 0 − (0 − 0) = 0 = 1 − (1 − 0) = h(std)`; identity; `T = N_{S₄}(⟨(13)(24)⟩) = D₈`, index `3`; `D₈/⟨(13)(24)⟩ ≅ V₄`, the four linear characters are `±1` on the `D₈`-class `{(12)(34), (14)(23)}`, two are `−1` and extend `λ`; the degree-`2` character of `D₈` restricts to `μ + μ'` with `μ((13)(24)) = −1`, not over `λ`; each linear extension has defect `0` at `3`, induces to a degree-`3` character of `S₄` of defect `0` (`3 ∣ 3`), heights `0 = 0`; `h(ψ^G) = ν|G:T| + ν ψ(1) − (ν|G:T| + a_T − d) = h(ψ)` and `d_{B^G} = d_B` from the same count | holds | none |
| §7.5 regular blocks, Fong | `S₃`, `N = C₃`, `p = 2`, `3` | `λ_{B₀}(𝒞_t⁺) = 3 ≡ 1 ≠ 0` not regular; `λ_{std}(𝒞_t⁺) = 0` regular `= {λ}^G`; `p = 3`: `P = C₃`, `|G : PN| = 2`, `P ∩ N = C₃` | holds | none |
| §7.6 extended first main (sampled) | `S₃` at `2`, `P = ⟨t⟩`; `S₃` at `3`, `P = C₃`; `S₄` at `2`, `P = V₄` | `P C_G(P) = P`, `N_G(P) = P`, index `1`, `b^G = B₀`; `P C_G(P) = C₃`, stabiliser `S₃`, index `2` prime to `3`, `b^G` the single block with defect group `C₃`; `C_{S₄}(V₄) = V₄`, `b^G` defined (`C_G(V₄) ≤ V₄`), stabiliser `S₄`, index `6` even, and `S₄` has one `2`-block (`C_G(O_2(G)) ≤ O_2(G)`) with defect group `D₈ ≠ V₄` | holds; sambale line 499 agrees | none |
| §8.1 vanishing (sampled) | `S₃` at `2`, `{std}`; `SL(2,3)` at `3`, `χ₃`; `B₀` | `std(t) = 0`, the `2`-part `t ∉ 1`; `χ₃ = 3, 3, −1, 0, 0, 0, 0` on orders `1, 2, 4, 3, 3, 6, 6`, zero exactly where the `3`-part is nontrivial; Sylow `D`: every `p`-part lies in a conjugate, nothing forced; every `B`-Brauer pair lies in a maximal one whose first component is a defect group (base §6.3) | holds | none |
| §8.2 canonical character | `D₈`; `C₂ × C₃` at `2`; `P = 1`; `SL(2,3)` at `2`; uniqueness and surjectivity | `θ = 1`, `ν(1) = ν|D₈:D₈| = 0`, heights `{0,1}`; three blocks `{ξ × ψ}`, `θ = 1 × ψ`, heights `0`; `P = 1`: defect zero, `θ_1 = θ`; `C_G(Q₈) = Z ≤ Q₈ ≠ G`; a `p`-regular `x` lies in `C_G(P)` (`G/C_G(P)` a `p`-group), `xP` has `x` as its only `p`-regular element, preimage of `C_Ḡ(x̄)` is `C_G(x) ⊇ P`, so `|Cl_Ḡ(x̄)| = |Cl_G(x)|` and the two dominated defect-zero blocks share `λ`; `Φ_{θ⁰}|_P = θ(1) Σ_χ ξ_χ(1) ξ_χ` vanishes off `1`, a multiple of `ρ_P` | holds | none |
| §8.3 heights with a normal defect group (repaired `*Needs:*`) | `SL(2,3)` at `2`; `A₄` at `2`; `D × H`; `(C₃ × V₄) ⋊ C₂` at `3`; the bound | `N = Q₈`, `T = G`, `|T:N| = 3`; `θ_ξ|_D = θ(1)ξ`; heights `{ν(1), ν(2)} = {0, 1}`; `V₄` abelian: `{0}`; `h(ξ × ψ) = ν(ξ(1))`; `D = C₃`, `b` with `T = N` of index `2`, `χ = θ^G` of degree `2`, `h = ν₃(2) = 0 = ν(ξ(1))`; `ν χ(1) = ν|G:T| + ν ψ(1) ≥ ν|G:T| + ν|N:D| + ν ξ(1) = (a − d) + ν ξ(1)` using `p ∤ |T:N|`; equality needs `ψ(1)/θ_ξ(1)` prime to `p`, the gap | holds | none |
| §8.4 Reynolds (sampled, headline) | `D = 1`; `D₈`; abelian `G`; `D × H`; `SL(2,3)` at `2`; `A₄` at `2`; both directions | `{χ} = Irr₀`; degree `2` has `h = 1 − 0 = 1`, `D₈` nonabelian; all heights `0`; `0` iff `D` abelian; `Q₈`: `h = 1` occurs; `V₄`: `0,0,0,0`; "only if": every `θ_ξ` under some `χ` with `h(χ) = 0 ≥ ν(ξ(1))`, `ξ(1) ∣ |D|` a `p`-power, so `ξ(1) = 1`, `|Irr(D)| = |D|` = number of classes, abelian; "if": every `ξ` linear, height formula gives `0` (this direction uses the gap) | holds in both directions from §8.3 | none |
| §9.1 predicate (headline) | `S₃` at `2`, `3`; `S₄` at `2`; `G = 1`; instances | cyclic defect groups, heights `0`; `a = d = 3`, degree `2` has `h = 1`, `D₈` nonabelian; one block of defect zero; `p`-groups, abelian groups and `D × H` have a normal defect group; kessar-malle 25 (if), mnst 70 (only if, odd `p`), ruhstorfer 33 (`p = 2`), mnst 73 (all `p`) attributed correctly | holds | none |
| §9.2 Alperin–McKay (sampled, headline, repaired `*Needs:*`) | `S₃` at `2`; `A₅` at `2`; `SL(2,3)` at `3`; normal `D` | `N(C₂) = C₂`, `|Irr₀(B₀)| = 2 = |Irr₀(b')|`; `N(V₄) = A₄`, degrees `1,1,1,3` all height `0`, `4 = 4`; `N(C₃) = ⟨a⟩ × {±1} = C₆` (four Sylow `3`-subgroups), two blocks of three linear characters each, `3 = 3` for `{1, ω, ω²}` and for `{χ₂, χ₂ω, χ₂ω²}` (`ν₃(2) = 0`); normal `D`: `N_G(D) = G`, `Br_D(e_B) = Σ_{b^G = B} e_b = e_B`, so `b' = B` | holds | none |
| Gap `χ(1)/θ(1) ∣ |G : N|` | `N = G`; `N = 1`; `S₃ ⊵ C₃`; `Q₈ ⊵ Z`; `SL(2,3) ⊵ Q₈`; non-normal `⟨t⟩ ≤ S₃` | `1 ∣ 1`; `χ(1) ∣ |G|`; `2 ∣ 2`; `2 ∣ 4`; `3 ∣ 3`, `1 ∣ 3`; `std|_{⟨t⟩} = 1 + sgn`, `2 ∤ 3`, so normality is needed and stated; consumers: §8.3 only; pin: `Dimension.lean` 113–119 has no `dim W / dim V ∣ [G : N]`; Layer 7 on main has no divisibility | precise, minimal, declared in plan and README with one slug | none |
| Conventions: action, determinant, Galois, signs, valuations, central characters | `C₇ ⋊ C₃`; `S₃` degree `2`; `C₅`, `j = 2, 3`; `SL(2,3)`; `p = 2`, `3/2`, `2/3`; `S₃`, `p = 2` | `ζ₇⁴` vs `ζ₇²`; `det = sgn`, `−1` at a transposition; `ζ₅²`, `ζ₅³`; `ε = −1`; `ν₂(3/2) = −1 ∉ O`, `ν₂(2/3) = 1 ∈ m`; `ω = 3, −3, 0`, `λ_{B₀} = 3 ≡ 1`; `h(χ) = ν χ(1) − (a − d)` is reynolds line 60 | witnesses correct | none |

**Shape and completeness.** Nine layers, each ending with `### Examples` and `### Dependencies`;
every definition (§§1.1, 2.2, 3.2, 4.1, 4.5, 5.2, 6.1, 6.3, 7.4, 7.5, 8.2, 9.1, 9.2) has API
bullets and at least three discriminating Checks with a named wrong model (plan `tests` counts
3–4 per target, 35 targets); every theorem its hypotheses in the sentence and a locator; every
target a `*Needs:*` line. Unicode mathematics, no LaTeX delimiters, no target tables, no field
lists, no process vocabulary, no pull-request numbers, no machine paths (grep), no "uncertified",
"optional" or "deferred" in the README; no backticked name presented as this roadmap's own (no
`Suggested.lean` at the design stage). Plan/README agreement: 33 of 35 targets agree exactly
(R02 covers the other two). `sources.toml`: every cited work recorded, one key per work,
`cited_for` present; sambale's Theorems 1.18 and 1.19 are at lines 499 and 509 of the cached text
(the manifest's chapter-and-theorem locator is sufficient).

**Headline theorems (for the package stage).** "How to read the build" (README lines 323–329)
names: the canonical extension (§2.2), Gallagher's correspondence (§2.4), the `p`-group
characterisation (§4.2), the Glauberman bijection with its constituent, field-of-values and degree
properties (§§4.5–5.1), the counting theorem (§4.4), Brauer's theorem on heights (§6.2),
Fong–Reynolds preservation of heights (§7.4), Reynolds' theorem (§8.4), the two predicates
(Layer 9). The coprime-strand headlines are statable at the pins on
`Γ ⋊[MulDistribMulAction.toMulAut S Γ] S`, `TauCeti.irreducibleCharacters ℂ _`,
`FixedPoints.subgroup` and `LinearMap.det`; the block-strand headlines need block idempotents
(primitive idempotents of `Subalgebra.center k (MonoidAlgebra k G)`, statable) and defect groups
through a Brauer projection with a real body on `MonoidAlgebra k G`; the package stage decides
which are stated and names the rest in the module docstring. The one-tactic probe and the
`#check @name` comparison are package-stage items and were not run (no Lean file; this lane does
not elaborate).

## Not verifiable

- `isaacs` (Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13), `isaacs-1973`,
  `navarro-1998` (Chapter 3, Theorem 5.9), `navarro-2018` (Chapter 2), `feit` (Chapter IV):
  paywalled, settled as `uncertified`, cited by locator only. Each stands beside a certified
  citation I read (glauberman, martinez, reynolds, sambale), except isaacs 3.12 and 11.29 in the
  gap contract, whose use is confirmed by reynolds line 538 and martinez line 2340.
- Elaboration: no `Suggested.lean` at the design stage; this lane does not elaborate.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0700d4cdbbb34157b8bf71c53c63f7994e56e941", "job": "REV-DESIGN-ModularCharactersAndBlocksPartII~3", "model": "fable", "worker": "chris-x17"} -->
