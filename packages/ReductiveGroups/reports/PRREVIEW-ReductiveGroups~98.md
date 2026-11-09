# Review of ReductiveGroups (pull request #1676 at 69572c3)

**Verdict:** needs changes

The push gate fails (`dropped=16`), so this head cannot be accepted. There is one P1, two P2 and four P3 findings. The headline statements in `Suggested.lean` are true at their stated hypotheses (table below), and the seeded source sample checks out.

## R01 (P1) — GroupSchemesOverABase is cited as a supplier: the gate fails, it is not on main, and the two roadmaps cite each other

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md` lines 66–71, 777–787, 1156–1161, 1184–1186, 1207–1210, 1237–1239, 1572–1587, 1600–1607, 1630–1631, 3616–3618, 3646–3651, 3666–3668 and 3741–3743. Line 1158 reads: "…a monomorphism exactly when it is a closed immersion (Milne, Theorem 5.34, p. 107) is the affine case of GroupSchemesOverABase §4.5 … Consume §4.5".

**Claim.** Layers 3, 4 and 9D hand to GroupSchemesOverABase targets they owned on main and consume it in their *Needs:* lines:
- Milne 5.34 (monomorphism ⇔ closed immersion);
- the character-group comparison `X*(D(M)) = M` (Milne 12.8–12.9);
- the anti-equivalence for groups of multiplicative type over every field (Milne 12.23);
- the whole multiplicative-type theory over an affine base.

ReductiveGroups is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. GroupSchemesOverABase is an open new-roadmap pull request. It is absent from the merge order and is on the project's never-cite list. Once these citations are removed, the four items above are owned by no roadmap.

**Witness.** The gate at this head gives `dropped=16` and FAIL; I re-ran it with the same result. All 16 hits are these lines. In return, GroupSchemesOverABase at its head consumes "From ReductiveGroups. Layer 3 … Layer 6 … Layer 7 … §8.1 … §8.2 … 9B … Layer 9D" (its README line 234), so the two roadmaps cite each other.

**Repair.**
1. Delete the paragraph at lines 66–71, the subsection *From TauCetiRoadmap.GroupSchemesOverABase* (777–787), and every other mention of that roadmap.
2. Restore the targets as owned here, at the locators already in the text, which I verified against the 2017 edition:
   - Layer 3: "Prove that a homomorphism of affine group schemes of finite type over a field is a monomorphism exactly when it is a closed immersion (Milne, Theorem 5.34, p. 107)".
   - Layer 4: "Develop its character-group comparison and exactness in both directions … (Milne, Theorems 12.8–12.9, p. 233)", and "extend the anti-equivalence to groups of multiplicative type, torsion included, over every field (Milne, Theorem 12.23, p. 240)", with the split-torus criterion deduced from it.
   - Layer 9D: "Extend the field-level subgroup/quotient and multiplicative-type comparisons of Layers 3–4 to these bases in this lane".
3. Drop "Depends on #1522" from the description.

GroupSchemesOverABase already cites this roadmap as its supplier and needs no change. Re-run the gate: `dropped` must be 0.

## R02 (P2) — §§9B.1–9B.3 and the elementary-subgroup item restate ChevalleyGroups C4 and C6 (on main) without naming them

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md`:
- 3329–3338 (§9B.1): "Construct the open immersion U⁻×T×U⁺→G … Prove that the opens n_wΩ cover G";
- 3422–3434: "Derive GE_G(k)=G(k) over every field … prove it maps E_G(A) onto E_(G_D)(A) … SL₂(ℚ)→PGL₂(ℚ)…";
- 3356–3368 and 3385–3398 (§§9B.2–9B.3).

**Claim.** ChevalleyGroups, a roadmap on main that consumes Layer 9 here, already owns each of these objects for the same group scheme, the Kostant toral closure:
- the integral big cell `U⁻ × T_D × U ≅ Ω_D` over ℤ, with its inverse and base change;
- the cover of `G_D` by the Weyl translates of `Ω_D`;
- the points over every field as `E(k)T_D(k)`;
- the elementary-subgroup comparison map and the torus cokernel `ℚˣ/ℚˣ²`.

The README never mentions ChevalleyGroups, so after this merge two roadmaps own these objects.

**Witness.** ChevalleyGroups `README.md` line 72: "C4 … proves the integral big cell and its point consequences". Lines 392–427 give the big cell, "covered by the translates of the big cell", and "the points over k are E(k)". Lines 628–655 (C6) give the elementary map and "cokernel is ℚˣ / ℚˣ²".

**Repair.** Citing ChevalleyGroups as a supplier would make the two roadmaps cite each other, because its C2 consumes the 9B constructor. Keep ownership here instead. In *Scope and ownership*, name ChevalleyGroups C4 and C6 and add one clause each: §9B.1 and *Elementary generators and all ring points* are stated for an arbitrary reduced root datum (central tori and root-free data included) and for all rings, local rings included; ChevalleyGroups C4/C6 are their instances for a semisimple Chevalley datum over fields and consume them. Add ChevalleyGroups to *Downstream consumers*. Name the companion change to ChevalleyGroups C4/C6 in the description.

## R03 (P2) — §3A.5e claims to be the single owner of the complex Lie group `G(ℂ)`, which LieGroups Layer 7 (on main) also owns for affine reductive `G`

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md`:
- lines 31–38: "…the complex Lie-group structure on `G(ℂ)` for every group scheme `G` of finite type over `ℂ`, affine or not, with its tangent dictionary in the affine case (3A.5e) … Layer 3A.5 is the single owner of these objects";
- line 1436: "This complex Lie-group dictionary is owned here".

**Claim.** On main, §3A.5 consumed ComplexComparisonPartII; this head makes §3A.5e the owner. LieGroups Layer 7 on main already owns the same object for smooth connected affine reductive `G`: the complex Lie-group structure on `G(ℂ)` and the identification of its Lie algebra with Layer 2's `Lie(G)` through a faithful `G → GL(V)`. That is the construction §3A.5e prescribes in the affine case ("prove this for GLₙ and restrict along Layer 1's closed embedding"). Neither roadmap names the other, so the "single owner" sentence is false on main.

**Witness.** LieGroups `README.md` line 970: "Own here the **lower analytic dictionary** for such a G … give the complex points `G(ℂ)` … the subspace topology and complex atlas … identify its tangent Lie algebra with ReductiveGroups Layer 2's `Lie(G)`".

**Repair.** LieGroups Layer 7 consumes Layers 0–4, 6 and 7C here, so §3A.5e may keep ownership. In *Scope and ownership*, name LieGroups Layer 7's lower analytic dictionary as the affine reductive case of §3A.5e and as a consumer of it. State the comparison that makes the two atlases agree: by §3A.5b a closed immersion `G → GL(V)` induces a closed embedding of points, so the chart topology is the subspace topology. Add LieGroups Layer 7 to *Downstream consumers*, and name the companion change to LieGroups in the description.

## R04 (P3) — padding in `Suggested.lean`: the SL coordinate presentation and braid nonsplitting are not headline theorems

**Location.** `TauCetiRoadmap/ReductiveGroups/Suggested.lean`:
- lines 289–305: `determinantRelation`, `exists_coordinatePresentation`;
- lines 466–471: `permutation_nonsplit`.

The module docstring itself calls the first "the SL coordinate presentation of the worked examples".

**Claim.** `exists_coordinatePresentation` is a worked-example presentation, not a deep result. The pinned `SpecialLinear.coordinateHopfAlgebra` is already the quotient of `O(GLₙ)` by `(det − 1)`, and three pinned facts reduce the statement to removing a redundant localization. `determinantRelation` exists only to state it. `permutation_nonsplit` is an elementary consequence of the pinned `ArtinGroup.exponentSum` and `BraidGroup.permHom`; the README gives its complete proof in four lines (4176–4182).

**Witness.** At the Tau Ceti pin, `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean` has:
- `coordinateMap_ker` (line 149): the kernel is `span{det − 1}`;
- `det_map_genericMatrix_coordinateMap` (line 159);
- `adjoin_range_map_genericMatrix` (line 167): the entries generate.

**Repair.** Delete `determinantRelation`, `exists_coordinatePresentation` and `permutation_nonsplit` from `Suggested.lean`, and the namespace `SpecialLinearAcceptance`. Keep both statements in the README as prose targets, and remove the backticked Lean names at README lines 4176 and 4428–4432. Update the module docstring's list of stated theorems.

## R05 (P3) — two headline locators point to statements without proof: Nagata's theorem and Brieskorn's presentation

**Location.**
- Nagata: `Suggested.lean` lines 163–166 and README lines 1823–1825, "(Nagata; Milne, Proposition 12.54 and Remark 12.56, pp. 248–249)".
- Brieskorn: `Suggested.lean` lines 499–500 and README lines 4218–4219, 4365, 4502–4503, "Brieskorn, *Sur les groupes de tresses*, Séminaire Bourbaki exposé 401, Proposition 1, p. 25".

**Claim.** Milne's Prop 12.54 is only the commutative case, and Remark 12.56 states Nagata's theorem without proof, deferring to Demazure–Gabriel and Kohls. The Bourbaki exposé is a survey: its Proposition 1 is introduced as proved in its reference [11].

**Witness.** milne-iag (2017 edition) line 10307: Prop 12.54 is "a commutative algebraic group is linearly reductive iff of multiplicative type". Line 10330: Remark 12.56 cites DG IV §3, 3.6 and Kohls 2011. brieskorn line 97: "Dans [11] on a prouvé". Line 536: [11] is *Invent. Math.* 12 (1971), 57–61.

**Repair.**
- Nagata: keep Remark 12.56, p. 249, as the statement locator. Drop Prop 12.54, or label it "commutative case". Add the primary source the remark cites (Demazure–Gabriel, *Groupes algébriques*, IV, §3, 3.6, or Nagata 1961), recorded as uncertified if paywalled.
- Brieskorn: add E. Brieskorn, *Die Fundamentalgruppe des Raumes der regulären Orbits einer endlichen komplexen Spiegelungsgruppe*, Invent. Math. 12 (1971), 57–61, at its theorem, as the primary locator. Keep the exposé as a pointer.

## R06 (P3) — §11B's three `Suggested.lean` definitions have no API list and no Checks

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md` lines 4187–4250 (§11B, prose only) define `corootReflectionGroup`, `RegularCoroots` and `RegularOrbits`, which are declared at `Suggested.lean` lines 479–494.

**Claim.** Each definition needs API bullets and at least three discriminating Checks. §11B has neither; its examples are inline prose ("Rank 1 is ℂ* with sign quotient…"), and the Layer 11 Checks are on `𝔰𝔩₂`/`𝔤𝔩₂`, not on the coordinate model these definitions use.

**Witness.** There is no `**API.**` or `**Checks.**` heading between README line 4187 and the start of §11C at line 4252.

**Repair.** Add API bullets: the coreflections preserve `RegularCoroots`; the group is finite and acts freely there; the orbit map is a finite covering. Add Checks, all of which I computed:
- for the pairing `±2`, `±1` on `ℂ`: `RegularCoroots = ℂ∖{0}`, the group is `{±1}`, the orbit space is `≅ ℂ*` by `z ↦ z²`, and `π₁ = ℤ = Artin(A₁)`;
- for empty `ι`: `RegularCoroots = ℂ^κ`, the group is trivial and `π₁ = 1`;
- for `A₁ × A₁` on `ℂ²`: the complement is `(ℂ*)²`, the group is `(ℤ/2)²` and `π₁ = ℤ²`, the Artin group with `m₁₂ = 2`;
- a control: taking hyperplanes in the root space instead of the coroot space makes the action ill-typed for a non-symmetric pairing such as `B₂`.

## R07 (P3) — coordination: five conflicting open pull requests with no stated order, Lang's theorem left with two owners on main, and false claims in the description

**Location.** The pull-request description, and README lines 49–50: "ReductiveGroupsPartII RG2.3.7 states Lang's theorem again under its own name; it is a consumer of Layer 7a".

**Claim.**
1. #1332, #1797, #1807, #1808 and #1854 each change this roadmap, and all five heads conflict with this one in `README.md`/`Suggested.lean`. The description states no order.
2. On main, Layer 7a consumed Lang's theorem from ReductiveGroupsPartII (an upward edge). Moving it down into Layer 7a is correct, but ReductiveGroupsPartII on main still declares itself the single owner and states it in its `Suggested.lean`. No open pull request changes that.
3. The description says "Existing roadmap bytes are preserved", but this head rewrites `README.md` and deletes seven companion `.lean` files. It also lists GroupSchemesOverABase as a dependency.

**Witness.** The overlap check of the open pull requests lists the five conflicts. ReductiveGroupsPartII `README.md` line 62: "the single owner in Tau Ceti of Lang's theorem". ReductiveGroupsPartII `Suggested.lean` line 212: `Lang.lang_surjective`. `git diff --name-status origin/main...HEAD` shows seven deleted `*Targets.lean` files.

**Repair.** In the description:
- state which of the five pull requests this one rebases on or precedes;
- name the companion change that makes ReductiveGroupsPartII RG2.3.7 and `Lang.lang_surjective` cite Layer 7a (and LieGroups and ChevalleyGroups for R02–R03);
- remove the "bytes preserved" sentence and the #1522 dependency.

## Verified sound

**The gate and the build.**
- My gate re-run gives `dropped=16` and every other check 0, FAIL; the build entry was not printed. Separately, `lake env lean Suggested.lean` exits 0 in 14 s, with 12 `sorry` warnings only (lines 137, 154, 167, 187, 209, 230, 253, 273, 295, 459, 468, 505).
- The dependency check gives `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`: no UPWARD or CYCLE line. GroupSchemesOverABase is invisible to it, being outside the merge order; R01 catches it.
- `#check @name` on all 25 declarations in one scratch file exits 0. Each elaborated type matches its README statement. No binder is lost: nothing uses section variables.
- One-tactic probe (`first | rfl | trivial | infer_instance | simp | decide` on a scratch copy): none of the 12 `sorry`s closes.
- No changes outside the folder. Pins equal main (Tau Ceti 2fd255d, Mathlib 1b1ccf4).

**Seeded sample.**
- §1.1, against jantzen-1985 (printed page = PDF page − 5):
  - §2.8, the comodule map: lines 1100–1165, pp. 36–39 ✓;
  - §2.10(1)–(2), fixed points tested at the universal point: lines 1216–1223, p. 41 ✓;
  - §3.3 induction with `f(gh)=h⁻¹f(g)`: lines 1507–1536, pp. 52–53 ✓;
  - §3.9(b) enough injectives for flat `G`, proof by `I ⊗ k[G]`: lines 1688–1703, p. 60 ✓;
  - §4.2, derived functors, flat `G`: line 1923, p. 69 ✓;
  - 4.7(a) `Hⁿ(G, N⊗k[G]) = 0` for n > 0: line 2001, p. 73 ✓;
  - 4.14–4.16 Hochschild complex `M⊗k[G]^⊗n`: lines 2102–2159, pp. 77–79a ✓.
- §8.1: conrad-rgs Def 5.1.1, line 5651, p. 136 ✓. Roots constant in M, root spaces free of rank 1, coroots constant in M∨, base non-empty; the README states all three conditions.
- §8.2: conrad-rgs Def 6.1.1 and Remark 6.1.2, lines 7725–7751, p. 186 ✓. The README's `Spec(k×k)` mixed-Borel Check is exactly Remark 6.1.2.
- Nothing in the README is flagged unverified.

**Headline locators, against the 2017 edition.** I read the 2017 edition from the author's page (`iAG2017.pdf`, fetched into a scratch copy of the manifest under the key milne-iag). The board manifest still records the 2015 v2.00 notes under that key, and their numbering differs. Checked:
- 5.14 l.4449 p.102; 5.18 l.4492 p.103; 5.21 l.4534 p.104; 5.25 l.4571 p.105; 5.34 l.4643 p.107;
- 1.22 p.12; 1.34 p.16; 1.39 l.1134 p.18; 5.58 p.114; 8.39 p.158; 9.18 p.170;
- 12.8–12.9 p.233; 12.12 p.234; 12.23 l.9961 p.240;
- 17.10 l.14547 p.354; 17.95 p.382; 17.96–17.97 l.15752–15767 p.383;
- 21.11 p.428; 21.37 p.435; 21.45 l.18041 p.438; Example 21.47 l.18098 p.439; Prop 21.75 l.18457 p.448;
- 22.42 l.19713 p.477; 22.43 l.19732 p.478.

All match the README and docstrings, apart from R05.

Other sources checked:
- conrad-feng: Def H.1.1 / Example H.1.2, lines 10356–10381, p. 238; Prop 12.3.1, line 5345, p. 127.
- mcninch: §3.1, line 236, p. 6; (3.2.1), line 280, p. 7.
- brieskorn: Prop 1, line 98, volume p. 25.
- conrad-adelic: Prop 3.1, line 168, p. 4.
- sga1, Exposé XII: Prop 2.1 p. 242, Prop 3.1 p. 244, Prop 3.2 p. 245.
- conrad-rgs: Def 3.1.1 p. 81, Thm 3.3.4 p. 98, Thm 5.1.13 p. 143, Thm 6.1.16 p. 196.

**Library declarations opened at the pin** (Tau Ceti unless noted):
- `HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`, minimal ideal with torus quotient);
- `IsBorel` (`Borel/Basic.lean:196`, geometric) and `IsBorelOverAlgClosed` (`:148`);
- `IsParabolic` (`Parabolic/Basic.lean:248`, smooth over `k̄` and containing a Borel) and `IsParabolicOverAlgClosed` (`:82`);
- `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:71`, smooth, geometrically connected, trivial geometric unipotent radical);
- `linearlyReductiveCommHopfAlgProperty` (`LinearlyReductive.lean:61`);
- `torusCommHopfAlgProperty` (`Torus/Basic.lean:105`, split after `k̄`);
- `geometricallyConnectedCommHopfAlgProperty` (`Connected/CommHopfAlgCat.lean:59`);
- `unipotentRadicalDefiningIdeal` (`Unipotent/Radical/Construction.lean:69`, the k-radical);
- `HopfIdeal.IsNormal` (`HopfIdeal/Normal/Basic.lean:67`);
- `isIso_fppfHomogeneousQuotientToCoinvariantsPoints` (`Fppf/Quotient/Homogeneous/Coinvariants.lean:148`; it needs faithful flatness and finite presentation, so the Layer 3 headline is not a restatement);
- the pinned `exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:149`, with the extra containment hypotheses the docstring describes);
- `SpecialLinear.coordinateHopfAlgebra` (`SpecialLinear/Basic.lean:121`);
- `ArtinGroup.exponentSum` (`GroupTheory/Coxeter/Artin.lean:226`);
- `BraidGroup.permHom` (`Braid/Basic.lean:358`);
- `exists_fixed_inv_mul_of_surjective_commutatorMap` (`GroupTheory/FixedSubgroup/Lang.lean:76`);
- `smooth_of_grpObj_of_charZero` (`AlgebraicGeometry/Group/Cartier.lean`);
- `normTwoShell_nonneg_induction`, `norm_rootLattice_eq_two_iff`, `kostantElementarySubgroup`, `rootPairingBaseChange`, `coxeterMatrixOfBase`;
- in Mathlib: `fundamentalGroupToMulOpposite`, `ContDiffAt.to_localInverse`, `weylGroupCorootRep`.

**Cross-roadmap citations resolved.**
- Suppliers, all on main: SchemeAndStackFoundations; ModularCurves §0E; RootSystems §§5.1–5.2; LieGroups Layers 2, 7 and 8, with no layer cycle; LieHighestWeight Layers 3–4 and 7; SmoothBundlesConnections B1.0, B1.1 and B1.4; GroebnerGeometry G5; ReflectionInvariantTheory; AlgebraicTopology; DGFloer Layer 1.2; AlgebraicVectorBundles; IntegralLattices.
- Cited only as consumers: ComplexComparisonPartII, FormalConnectionsOpers, IntegralHeckeAndGaloisDeterminants, AdelicAlgebraicGroups.
- GeometricTopology (on main) consumes §11A's half-twist convention, which agrees with this head.
- SchubertGeometry's "Layer 8's Borel scheme" is covered by the README's old → new numbering table.
- Ownership against the open pull requests listed in the brief: Brieskorn/Salvetti appear only in ReductiveGroups' own versions; ClassicalGroupsPartII only declares gaps on this roadmap.

**Adversarial pass.** Every row is computed; "✓" means both sides agree.

| Statement | Instances tried | Values computed (statement side / independent side) | Result |
|---|---|---|---|
| `isIso_coinvariantsQuotient_of_isNormal` | `μ_p ⊂ μ_{p²}`; N=G; N=1; non-normal B⊂GL₂ | coinvariants `k[t^p] ≅ k[s]/(s^p−1)`, O free of rank p / quotient `μ_p` ✓; k / point ✓; O(G) / G ✓; `k[GL₂]^B = k` but `GL₂/B = ℙ¹` is not affine, so normality is needed | true; hypothesis needed |
| `linearlyReductive_iff_reductive_identityComponent` | constant S₃, O₂, 𝔾_a in char 0; ℤ/p in char p | S₃: LR yes / G°=1 reductive yes; O₂: yes / SO₂≅𝔾_m yes; 𝔾_a: no / no; ℤ/p: `k[u]/(u^p)` indecomposable, so LR fails while G°=1 is reductive (CharZero needed) | true |
| `linearlyReductive_iff_torus` | 𝔾_m, SL₂, 𝔾_a, μ_p, constant ℤ/ℓ, trivial | yes/yes; no (R_p has no complement)/no; no/no; μ_p: LR yes, torus no (smoothness excludes); ℤ/ℓ: LR yes, torus no (connectedness excludes); trivial: yes / rank 0 yes | true |
| `exists_levi_complement` | Borel of GL₂ over ℚ; 𝔾_a; reductive G; Greenberg SL₂(W₂) | `O(B)^U = k[a^±,d^±] → O(B)/(b)` bijective ✓; J = augmentation ideal, k→k ✓; J=0 ✓; char p has no complement (mcninch line 280) | true; CharZero needed |
| `exists_conjugate_eq_of_isMaximalTorus` | GL₂×μ_p over k̄; constant S₃; SL₂ over ℝ; V₄ ⊂ PGL₂ | tori `T×1` conjugate by GL₂(k̄) ✓; only the trivial torus, g=1 ✓; diagonal vs SO₂ not ℝ-conjugate (needs IsAlgClosed); V₄ maximal diagonalizable of dim 0, but a torus has dim 1 (predicate is "torus", not "diagonalizable") | true |
| `exists_titsSystem_of_isBorel` | GL₂/𝔽₂; SL₂/𝔽₃; G=T=𝔾_m; T⊄B; constant ℤ/3 | `6 = 2+4`, B∩N=1, W of order 2 ✓; `24 = 6+18`, B∩N = T(𝔽₃) of order 2 ✓; one cell, S=∅ ✓; B∩N = scalars·⟨[[−1,1],[0,1]]⟩, not normal for a/d ≠ ±1; ℤ/3 is excluded by reductive ⇒ connected | true |
| `exists_levi_complement_of_isParabolic` | P=G; B⊂GL₂ over 𝔽₂; line-stabilizer P⊂GL₃; imperfect k | radical trivial, J=0 ✓; `k[a^±,d^±]`, J=(b), any characteristic ✓; U of dim 2, L=GL₁×GL₂ ✓; P=P_G(λ), L=Z_G(λ) (conrad-feng line 10375) ✓ | true |
| `lang_surjective` | 𝔾_a, 𝔾_m, SL₂ over 𝔽₂; constant C₂; K transcendental | `θ²−θ=1`, `θ⁻¹θ²=θ`, `u(θ)⁻¹u(θ²)=u(1)` ✓; C₂: Lang map trivial, misses 1 (connectedness needed); `T^q−T−a` has a root in K ✓ | true |
| `plane_braid`, `halfTwist`(`_injective`), `halfTwistLoop` | n=0,1,2; t=0,½,1; orientation | n=0,1: π₁=1=B_n ✓; n=2: `Conf₂≃ℂ×ℂ*`, ℤ=B₂ ✓; z(½) = (½−i/2, ½+i/2), counterclockwise ✓; z(1)=(1,0) ✓; σᵢ↦σᵢ⁻¹ and word reversal make the existential independent of orientation and of `p*q=q.trans p` | true |
| `nonempty_mulEquiv_artinGroup` and the three §11B definitions | pairing ±2/±1 on ℂ; empty ι; A₁×A₁ | ℂ*/±1 ≅ ℂ*, ℤ=Artin(A₁) ✓; ℂ^κ, 1=1 ✓; (ℂ*)²/(ℤ/2)², ℤ² = Artin with m=2 ✓; coroot space = span(coroots) ⊕ ann(roots), with W trivial on the second summand | true (R06: Checks missing) |
| `permutation_nonsplit` | n=2; n=1 | ℤ→C₂ parity: a section gives 2m=0, so m=0, contradicting oddness ✓; n=1: S₁ trivial, a section exists (2≤n needed) | true (R04: padding) |
| `exists_coordinatePresentation`, `determinantRelation` | n=0,1,2 | det of the empty matrix =1, so the relation is 0 and the algebra is ℤ / O(SL₀)=ℤ ✓; x−1 gives ℤ ✓; ad−bc−1; over ℤ/4, `[[1,1],[0,1]]⁻¹` has entry 3 ✓ | true (R04: padding) |
| §1.1 invariants at the universal point | μ_p weight-one line; trivial group | 𝔽̄_p-points act trivially, yet t≠1 in `𝔽_p[t]/(t^p−1)`, so Mᴴ=0 ✓ (field points insufficient); m↦m⊗1, every point acts by the identity ✓ | true |
| §1.1 Hochschild complex / injectives | ℤ[t^±], weight 1; trivial group; cofree ℤ | d⁰(1)=1⊗(t−1); d¹(t−1) = t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1 = 0 ✓; differentials 0, id, 0 ✓; the map 2ℤ→ℤ sending 2↦1 does not extend, so ℤ is acyclic but not injective ✓ | true |
| §1.1 induction | C₂⊂S₃ trivial coefficients; the unit map ℤ→ℤ[t^±] | rank 3; indicator of C₂(123) ↦ indicator of (132)C₂ ✓; weight-one line gives 0, trivial line gives ℤ ✓ | true |
| §8.1 split data | split torus of rank r; SL₂ vs PGL₂; SL₂ over 𝔽₂ | X=Y=ℤʳ, no roots; α=2ω vs α a generator (same A₁ diagram, different data) ✓; centre `𝔽₂[t]/((t−1)²)` of length 2 ✓ | true |
| §8.2 pinnings | x_α(t) over ℤ/4 and ℚ; Spec(k×k) | tangent E₁₂ ✓; x_α(2t) gives 2E₁₂, a different pinning over ℚ ✓; Borel signs (+,−) not constant (conrad-rgs line 7738) ✓ | true |
| Layer 3 mono ⇔ closed immersion (R01) | Frobenius of 𝔾_a; μ_p→GL₁ | kernel α_p ≠ 1, so not mono and not a closed immersion ✓; μ_p→GL₁ is mono and a closed immersion although injective on k̄-points of a trivial group ✓ | true; unowned (R01) |
| Layer 4 multiplicative type (R01) | μ_n; norm-one torus over ℝ | X*(μ_n)=ℤ/n; conjugation acts on X*(T)=ℤ by −1, non-split ✓ | true; unowned (R01) |
| §9B.1 cells (R02) | SL₂ over ℤ, ℤ/4 | Ω=D(a), lower-right entry (1+bc)/a = d ✓; nΩ=D(c) ✓; all 48 elements of SL₂(ℤ/4) have a or c a unit ✓; [[2,1],[3,2]] lies in no single chart ✓ | true; duplicate (R02) |
| Elementary subgroups (R02) | 𝔾_m over ℚ; SL₂(ℤ/4); SL₂→PGL₂ | E=1, GE=ℚˣ ✓; Weyl word = [[0,1],[3,0]] ✓; root parameters lift, diag(2,1) does not ✓ | true; duplicate (R02) |
| §9B.2 central quotients (R02) | Λ=X; SL₂→PGL₂ | D(0)=1 ✓; Λ=2ℤ, kernel μ₂ ✓ | true; duplicate (R02) |
| §3A.5e (R03) | trivial group; elliptic curve | one-point group ✓; compact connected of dimension 1, not affine ✓ | true; two owners (R03) |
| §7C rank-one identity | a=b=1 in SL₂ | x_α(1)x_{−α}(1) = [[2,1],[1,1]] = [[1,0],[½,1]]·diag(2,½)·[[1,½],[0,1]] ✓ | true |
| §7a fixed-coset lifting | J={±1} in F̄_qˣ, q odd | Lang map of J is x^{q−1}=1, missing −1; coset {a,−a} is σ-stable with no fixed point ✓ | true |

## Not verifiable

- Settled as uncertified, not read: Waterhouse; Borel; Springer.
- Paywalled, cited without a text here: Conrad–Gabber–Prasad 2nd ed. (Def 1.1.1, Prop 1.1.9); Jantzen 2003, Part II §§3.18–3.19; Howlett–Lehrer 1994; Dipper–Du 1993; Carter; Lang 1956; Steinberg 1968; Serre; Gassmann.
- The primary sources proposed in R05: Nagata 1961 / Demazure–Gabriel IV §3 3.6; Brieskorn 1971 is open on GDZ but was not fetched in this round.
- Cached but outside the seeded sample, so their locators were not checked this round: dudas-michel, riche, gros-kaneda, frenkel-kac, heden, salvetti, callegaro, birman-brendle, fox-neuwirth, fadell-neuwirth.

## Source issues

- none
