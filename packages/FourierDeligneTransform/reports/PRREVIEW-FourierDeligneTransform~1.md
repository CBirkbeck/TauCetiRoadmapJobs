# Review of FourierDeligneTransform (pull request #2132 at ac17818)

**Verdict:** needs changes

Two findings, both P3 and both a supplier pointer inside a proof route; no statement, Check or
convention was found false. The gate passes (`gate.md`: every check 0, build OK) and the dependency
check shows no UPWARD or CYCLE line.

## R01 (P3) — §2.7 cites EtaleCohomologyFoundations §F.2.7 for a reduction it does not state

**Location.** `TauCetiRoadmap/FourierDeligneTransform/README.md:320` (route of the Euler–Poincaré
formula): "For a finite local `Λ` with residue field `𝔽`, `RΓ_c(U, F) ⊗^L_Λ 𝔽 ≅ RΓ_c(U, F ⊗ 𝔽)`
(EtaleCohomologyFoundations §F.2.7)", and the `*Needs:*` line at README:321, which lists §F.2.7 and
neither §0.8 nor gap:projection-formula-qcqs.

**Claim.** §F.2.7 supplies the derived reduction of `RΓ_c` along `Λ → 𝔽`.

**Witness.** EtaleCohomologyFoundations §F.2.7 on main (README:759–767) states
`Rf!(K ⊗ᴸ f*L) ≅ Rf!K ⊗ᴸ L` only for `L ∈ Dᵇ_ctf(S, Λ)`. For `Λ = ℤ/49`, `𝔽 = ℤ/7` (the roadmap's own
§2.7 and §3.7 Checks), `Tor_i^{ℤ/49}(ℤ/7, ℤ/7) = ℤ/7` for every `i ≥ 0`, so `L = 𝔽` is not ctf and
§F.2.7 does not apply.

**Repair.** In the route replace "(EtaleCohomologyFoundations §F.2.7)" by the supplier that does
state it: EtaleCohomologyFoundations §0.8 (compatibility of `Rf_!` with coefficient transformations
under Tor bounds; `F` is `Λ`-flat), the citation §3.7 already uses for the same fact, or
gap:projection-formula-qcqs with `A = 𝔽`, `B = F` of finite Tor amplitude. In the `*Needs:*` line of
README:321 put §0.8 (or the gap) in place of §F.2.7. Tested on the refuting instance: `Λ = ℤ/49`,
`ψ(1) = 18`, `F = ℒ_ψ(x²)` on `𝔸¹_{𝔽̄_3}`: `RΓ_c = (ℤ/49)[−1]`, its derived reduction is `(ℤ/7)[−1]`,
equal to `RΓ_c` of `ℒ_{ψ mod 7}(x²)` (rank `1 = d − 1`); the hypothesis "B of finite Tor amplitude"
holds and "A ctf" is not needed.

## R02 (P3) — §5.5 derives the vanishing on `A × s'` from §3.3, which does not give it

**Location.** `TauCetiRoadmap/FourierDeligneTransform/README.md:583`: "the vanishing statements are
the local acyclicity of §3.3, once for `D × A' → A'` and once with the roles of `A` and `A'`
exchanged", and the `*Needs:*` line at README:584 (no EtaleCohomologyFoundations §F.2.3 or §F.3).

**Claim.** §3.3 gives the vanishing of the vanishing cycles of `pr^*ā_!K ⊗ ℒ_ψ(x x')[1]` on
`A × s'` (first clause of the fourth bullet, README:579).

**Witness.** §3.3 is acyclicity relative to `ℒ_ψ(x x')` extended by zero; tensor stability
(EtaleCohomologyFoundations §F.2.3) reaches only lisse factors. For `K = j_!Λ[1]`, `j : 𝔾_m → A`,
the point `(0, s')` has `pr^*K` not lisse. LAU87 line 996 uses the acyclicity of `A → Spec k`
relative to `K` instead.

**Repair.** Rewrite the clause as: "the vanishing on `A × s'` is the universal local acyclicity of
`A → Spec k` relative to `K` (EtaleCohomologyFoundations §F.3, generic local acyclicity, whose dense
open of the integral base `Spec k` is the whole point), base-changed to `A'` and tensored with the
lisse `ℒ_ψ(x x')` (§F.2.3); the vanishing on `U × ∞'` is §3.3 with the roles of `A` and `A'`
exchanged, tensored with the lisse `F`". Add EtaleCohomologyFoundations §§F.2.3 and F.3 to the
`*Needs:*` line of README:584 and to the Layer 5 Dependencies (README:617). Tested on the refuting
instance: for `K = j_!Λ[1]` the pair `(A → Spec k, j_!Λ)` is universally locally acyclic over the
point, so `(pr', pr^*j_!Λ ⊗ ℒ_ψ(x x'))` is, and the vanishing cycles at `(0, s')` vanish; the
bullet's statement is unchanged.

## Verified sound

**Gate and build.** `gate.md` at ac17818: all 28 counters 0, build OK. `lake env lean` on
`TauCetiRoadmap/FourierDeligneTransform/Suggested.lean`: exit 0, no warning (the file has a module
docstring, an empty namespace and no declaration, so there is no `sorry`, no sorry'd data, no
`set_option`, the single `import Mathlib`). `metadata.toml` is one line (`topic = "math.AG"`). The
outside-folder diff is empty.

**Dependency check** (output): `depcheck: 227 roadmaps, 2061 edges, 0 problem(s)`. The merge order
lists FourierDeligneTransform at line 69, after its last open supplier
LefschetzPencilsAndVanishingCycles (68); the suppliers EtaleCohomologyFoundations (42),
InverseGaloisAndArithmeticFundamentalGroups (54), ArithmeticGaloisRepresentations (58) precede it;
EnhancedDerivedSheaves, SchemeAndStackFoundations, ReductiveGroupsPartII, AdicEtaleGeometry and
RamificationOfCompleteDiscretelyValuedFields are on main. Every roadmap named only under Scope or
Downstream consumers (DeligneWeightsAndPurity 72, AutomorphicLFunctionsAndLocalFactors 94,
EtaleDualityAndPerverseSheaves 107, CongruenceSpectralGap 156, CharacterSumsOverFiniteFields 158,
SheafConvolutionOnAbelianVarieties 319) is later and appears in no `*Needs:*` line.

**Headline theorems and statability.** The headlines are the eleven items of the module docstring
(`FT_! = FT_*`; inversion and the equivalence; duality; functoriality/convolution/Plancherel; the
trace identity and Frobenius exchange; `t`-exactness and the equivalence of hearts; the exchange of
types; Fourier sheaves and the autoequivalence; the Kummer transform; the local monodromy formulas;
the local Fourier transforms). None is statable at the pins: a search of the pinned Mathlib and Tau
Ceti for perverse `t`-structures, lower-shriek on étale sheaves, constructible étale complexes,
nearby/vanishing cycles, Artin–Schreier sheaves and Lang torsors of group schemes returns no file.
What the docstring says the pins do have was confirmed: `AlgebraicGeometry.Scheme.smallEtaleTopology`
(`Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`), `Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`),
`EllAdicCohomology` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76`), Tau Ceti torsors on a
site (`TauCeti/CategoryTheory/Sites/NonabelianCohomology/Torsor.lean`). No padding probe applies (no
declaration). The Layer 0 identities are function-level algebra and are rightly left as README
targets.

**Library declarations opened at the pins (55, all elaborate by `#check` in one scratch file,
Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the pins of `lake-manifest.json` and of README:39, 51).**
Mathlib (17): `AddChar.IsPrimitive` (`NumberTheory/LegendreSymbol/AddCharacter.lean:60`),
`AddChar.IsPrimitive.of_ne_one` (:83), `AddChar.sum_eq_zero_of_ne_one` (:240, `[IsDomain R']` as the
README says), `FiniteField.trace_to_zmod_nondegenerate` (`FieldTheory/Finite/Trace.lean:37`),
`FiniteField.algebraMap_trace_eq_sum_pow` (:49), `FiniteField.norm_surjective`
(`FieldTheory/Finite/GaloisField.lean:234`), `ZMod.dft` (`Analysis/Fourier/ZMod.lean:87`),
`ZMod.dft_dft` (:176, `𝓕 (𝓕 Φ) = fun j ↦ N • Φ (−j)`), `ZMod.stdAddChar`
(`Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83`), `IsKrasner.of_completeSpace`
(`Analysis/Normed/Field/Krasner.lean:117`), `gaussSum` (`NumberTheory/GaussSum.lean:72`),
`mul_gaussSum_inv_eq_gaussSum` (:178), `gaussSum_mul_gaussSum_eq_card` (:200, needs `χ ≠ 1` and `ψ`
primitive; its hypothesis-free statement is `g(χ,ψ) g(χ⁻¹,ψ⁻¹) = card`, which with :178 gives the
README's `χ(−1) q`), `continuousCohomology` (`RepresentationTheory/Homological/ContCohomology/Basic.lean:131`),
`ContinuousCohomology.zeroIso` (`…/LowDegree.lean:87`), `CategoryTheory.Triangulated.TStructure`
(`CategoryTheory/Triangulated/TStructure/Basic.lean:54`), `CategoryTheory.GrpObj`
(`CategoryTheory/Monoidal/Grp.lean:43`); also `MonoidHom.commutatorMap` (`GroupTheory/FixedPointFree.lean:33`,
`g / φ g`, the README's `t ↦ t / F(t)`). Tau Ceti (37): the `FiniteLocallyFreeSheaf` family
(`VectorBundle/FiniteLocallyFree.lean:108`, `Dual/Basic.lean`, `Dual/Bidual.lean:69` `evalIso`,
`Dual/Pullback.lean:46` `pullbackDualIso`), `relativeSpec` (`RelativeSpec/Functor.lean:219`),
`totalSpaceScheme` (`VectorBundle/TotalSpace.lean:99`), `totalSpaceHomEquiv` (:130),
`totalSpaceSchemeBaseChangeIso` (:229), `addGrpObjTotalSpaceScheme` (`TotalSpace/Group.lean:81`),
`isAddMonHom_totalSpaceScheme_map` (:168), `totalSpaceDualHomEquiv` (`TotalSpace/InternalHom.lean:152`),
`totalSpaceSchemeBiprodIso` (`TotalSpace/Biproduct.lean:128`), `totalSpaceFreeIso`
(`TotalSpace/AffineSpace.lean:91`), the eight Frobenius names (`Frobenius/Basic.lean:98`,
`Relative.lean:84, 219`, `Iterate.lean:148, 159`, `Twist.lean:83`, `FiniteField.lean:44, 136`),
`Submodule.sum_addChar_dotProduct` (`InformationTheory/Coding/CharacterSum.lean:56`, primitive `ψ`
into a domain, as the README says), `Submodule.sum_sum_addChar_dotProduct_smul` (:75),
`AddChar.sum_apply_dotProduct` (:96), `MonoidHom.commutatorMap_prod_range`
(`GroupTheory/FixedSubgroup/Lang.lean:39`), `TauCeti.additiveHilbert90`
(`FieldTheory/GaloisCohomology/AdditiveHilbert90.lean:214`, `IsZero (continuousCohomology 1 …)` on
`ForcedDiscrete (SeparableClosure K)`), `DiscreteShortExact` (`…/ContCohomology/ShortExact.lean:165`),
`longExact_exact₁`/`₃` (`…/HomologySequence.lean:259, 279`; neither has the `LocallyCompactSpace`
hypothesis that `longExact_exact₂` has, so the README's use of the first and third only is exact),
`H1EquivOfSmulEqSelf` (`…/LowDegree.lean:1057`), `explicitH1AddEquivContinuousCohomology`
(`…/CohomologyComparison.lean:145`), `TauCeti.Place` (`FieldTheory/FunctionField/Place/Basic.lean:103`),
`Place.exists_reduced_artinSchreier_representative` (`Place/ArtinSchreier.lean:118`, perfect residue
field, conclusion "integral or negative order prime to `p`"), `ord_reduced_artinSchreier_representative_eq`
and `ne_pow_sub_self_of_exists_reduced_artinSchreier_pole` (`RingTheory/Valuation/Discrete/PowerSubSelf.lean:198, 181`).
No Layer 0 target restates one of these: the pinned orthogonality statements all assume a domain
target, the roadmap's assume a nondegenerate character into any commutative ring, and the Check with
`ℤ/7 × ℤ/7` separates them.

**Cross-roadmap citations resolved (28 sections).** On main: EtaleCohomologyFoundations §§G.1–G.3
(README:57, 105, 139), 0.7 (:439), 0.8 (:565), 0.9 (:1120), 0.11 (:1157), F.0.1–F.0.4 (:175–248),
F.1 (:457), F.2.1–F.2.7 (:504–759), F.3 (:676, including its quadratic-Kummer Check that §2.6
quotes), F.3a (:776), F.4.0–F.4.6 (:850–1089), F.5 (:1179), F.6 (:1200), F.8 (:1265), F.10.1–F.10.3
and F.10.2b (:907, 940, 1295, 1108), with all 18 backticked `VanishingCycles.*`,
`ClassicalAlgebraic.*` and `PerfectComplex.*` names present in that README; EnhancedDerivedSheaves
§§0.1–0.4 (:429–492); SchemeAndStackFoundations §§2.9, 2.11 (:3719, 3795); ReductiveGroupsPartII
§RG2.3.7 with *lang-theorem*, `Lang.lang_surjective` and *lang_not_connected* (:5201–5220);
AdicEtaleGeometry §A1.0.5 (a) (:2142; with `t = π`, `I = 𝔪` the pair `(R, π𝔪)` is henselian and the
completion is the `𝔪`-adic one, so the instance of §2.7 is covered); RamificationOfCompleteDiscretelyValuedFields
§§3a.1, 4a.1, 4a.2, 4a.3 (:421, 908, 1079, 1185). At open heads: InverseGaloisAndArithmeticFundamentalGroups
§IG.0.T2, §IG.0.T3 and the target *Euler characteristic of `ℓ`-torsion local systems on affine
curves* inside §IG.5.8 (same hypotheses, `s ≥ 1`, Swan conductors on completions, as README:106
restates); ArithmeticGaloisRepresentations §3.1 and §3.7 *Artin–Schreier characters* (single break
`m`, `Sw = m`, twisting `V` of breaks `< m`); LefschetzPencilsAndVanishingCycles §§0.3–0.8 and §1.1
(Grothendieck's arithmetic monodromy theorem with exactly the residue-field hypothesis README:110
states). Consumers read at their heads: EtaleDualityAndPerverseSheaves §§2.7, 2.10, 5.2
(`curveEulerPoincareSwan`); CharacterSumsOverFiniteFields §3.6 and CongruenceSpectralGap §4.2b use
the same normalisation (`ψ(Tr x)`, `χ(N x)`; over `𝔽_3` the trace at `x = 1` is `ψ(1)`), which is the
roadmap's Conventions witness. `scratch/citations.md` lists no unresolved cross-roadmap citation;
its 21 "Lean names found nowhere" are the supplier roadmap's own target names, all present in
EtaleCohomologyFoundations as above.

**Declared gaps (4).** Each `What EtaleCohomologyFoundations must provide (gap:…)` sentence carries
the same slug as the brief's list and is not already on main: §F.0.3 has Tate twists only (no
torsor–character sheaf; §F.0.2's `lisseMonodromyEquiv` needs a connected base); §F.2.7 is Noetherian
and ctf only; §F.6 states `f^!Λ ≅ Λ(d)[2d]` for constant coefficients only; §F.8 states the absolute
affine vanishing only. The relative exactness theorems are stated by EtaleDualityAndPerverseSheaves
§2.7, which is later in the merge order and so cannot be consumed; the README records this under
Downstream consumers, and the request moves the notion down to the earlier owner.

**Ownership against open pull requests** (checked with `roadmaps grep` over the open heads and
main for the Fourier–Deligne transform, Artin–Schreier and Kummer sheaves, Lang torsors/isogenies and
character sheaves): no other roadmap defines `FT_ψ`, kernel transforms, `ℒ_ψ`, `ℒ_χ` or the Lang
torsor of a commutative group as a target. AutomorphicLFunctionsAndLocalFactors §AL.3.10 and
FunctionFieldArithmetic use Lang isogenies of Picard schemes for their own local systems and are
later in the order; CongruenceSpectralGap §4.2b consumes the additive-character sheaf as a contract.
The two objects that also occur in a later open roadmap (the curve case of the classification of
simple perverse sheaves, EtaleDualityAndPerverseSheaves §2.10; the affine-curve Euler–Poincaré
formula, its §5.2) are owned here as the earlier roadmap in the merge order, with the difference
stated in one clause in Scope. `scratch/overlaps.md`: no other pull request changes this roadmap, no
cited id is dropped.

**Sources: the seeded sample and every locator read (LAU87, KL85, BRY86, KATZ01, ESDE, WII).**
All locators below were opened and match in number, line range and hypotheses; statements the
README marks "this roadmap's own" were checked by computation, not against a source.

- §0.1: KL85 lines 442–446 (finite local `Λ`, residue characteristic `ℓ ≠ p`, nontrivial `ψ`);
  LAU87 (0.2) lines 148–149 (every character of `𝔽_q` is `ψ_q(a ·)`).
- §0.2: LAU87 lines 383–391 (the function transform and Théorème (1.2.1.2)), lines 401–471 for
  (1.2.2.1)–(1.2.2.8).
- §1.1: LAU87 (1.2.2.9) lines 472–474; BRY86 Définition 9.1 line 3394 and Proposition 9.4 1) lines
  3449–3450, 3460; LAU87 lines 459–461 (Künneth).
- §1.3: LAU87 lines 172–182. §1.4: LAU87 (1.1.1.1)–(1.1.1.4) lines 249–262, (1.2.1.2) lines 389–391.
- §2.2: LAU87 lines 306–312 (`L(x) = x⁻¹ Frob(x)`, push-out along `χ⁻¹`), (1.1.3.1)–(1.1.3.3),
  (1.1.3.6) lines 313–339; KATZ01 lines 418–440 (Lang map `x − x^q`, trace `ψ(Tr)`; the same sheaf,
  as `id − F = [−1] ∘ (F − id)`).
- §2.4: LAU87 (1.1.3.4) lines 330–331. §2.6: LAU87 (1.1.3.7) lines 349–367, (1.4.3.1) lines 651–655.
- §2.7: LAU87 (2.1.1) lines 684–688 (`k{π} ⊂ R ⊂ k[[π]]`), (2.2.1.2) lines 868–875; KATZ01 lines
  441–460 (`χ_c = rank − Swan`, `h¹_c = (deg f − 1)·rank`, forget-supports isomorphism).
- §3.3: KL85 (2.4.1) lines 447–449 with its standing hypotheses at 442–446, the route at 450–554
  (Zariski-local, variable by variable, translation to `∞ × 𝔾_m`, Artin–Schreier cover, radicial
  followed by smooth), (2.4.2) lines 514–521, (2.4.4) lines 567–568; LAU87 (1.3.1.1)–(1.3.1.2) lines
  521–529. The README's finite `Λ` with nondegenerate `ψ` reduces to KL85's local case factor by
  factor (`p` is a unit, so every local factor has residue characteristic `≠ p` and nontrivial `ψ`).
- §3.4: LAU87 (1.2.2.1)–(1.2.2.3) lines 401–434 (the bidual identified by the negative of the
  canonical map, hence `[−1]^*`), (1.2.2.4) 435–444, (1.2.2.5) 445–449.
- §3.5: LAU87 (1.3.2.1)–(1.3.2.2) lines 553–565; KL85 (2.1.5)(ii) lines 390–391.
- §3.6: LAU87 (1.2.2.6)–(1.2.2.8) lines 452–471, (1.2.3.1)–(1.2.3.5) lines 477–518 ((1.2.3.3) has no
  parity hypothesis, as the README says); KL85 (2.1.5)(i) lines 388–389.
- §3.8: LAU87 (1.2.1.2) lines 389–391. §4.1–4.2: LAU87 (1.3.2.3)–(1.3.2.4) lines 566–577; KL85
  (2.1.5)(iii) lines 392–393.
- §5.1: LAU87 lines 735–754, (2.1.2.7) 772–794, (2.1.2.8) 795–804, 839–875. §5.2: LAU87 lines 609–638.
- §5.3: ESDE (7.3.3)–(7.3.6) and Theorem 7.3.8 lines 7235–7312 (elementary, Fourier, irreducible
  Fourier; (1)–(4) as restated). §5.4: LAU87 (1.4.3.2) lines 656–678.
- §5.5: LAU87 (2.3.1.1)–(2.3.1.3) lines 933–974, (2.3.2) 975–987, (2.3.2.1) 988–1000, (2.3.2.3)
  1004–1007, (2.3.3.1) 1017–1034; ESDE §7.8 Class (1) lines 7877–7889; KATZ01 lines 888–893.
- §5.6: LAU87 (2.4.2.1) lines 1063–1081, (2.4.2.2) 1084–1090, (2.4.2.3) 1091–1100, (2.5.2)
  1157–1165, (2.5.3.1) 1170–1182, (4.3.1.1) 2565–2567, lines 2620–2628. Scope: LAU87 (2.4.3) lines
  1103–1139, (2.2.2.2) 911–913; KL85 (2.2.1), (2.3.1) lines 413–437; WII (3.2.3) line 2438.

**Adversarial table** (values computed here; "L" = LAU87 with its sign convention).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.1 nondegenerate ⇒ `ψ(a) − 1` unit, `p` unit, orthogonality | `ℤ/7`, `p=3`, `ψ(1)=2`; `ℤ/7×ℤ/7`, `(2,1)`; `ℤ/49`, `18`; `ℤ/9`, `4`; `Λ=0` | `1+2+4=7≡0`; `(0,3)≠0`, `(1,0)` non-unit; `18³=5832=119·49+1`, `17` unit; `4³=64≡1`, `1+4+16=21≡3≠0`; zero ring: unit, not primitive | holds; negative controls in the README |
| §0.1 classification over connected `Λ` | derivation: `u^p=1` ⇒ `∏_a (u−ζ^a)=0`, factors pairwise comaximal ⇒ `Λ ≅ ∏ Λ/(u−ζ^a)` | connected ⇒ one factor ⇒ `u=ζ^a`; `Λ_1×Λ_2` with `c_1≠c_2` not of the form | holds; needs `Spec Λ` connected, stated |
| §0.2 inversion `𝔉𝔉t(w)=|W| t(−w)` | `W=𝔽_3`, `ℤ/7`, `t=δ_1` | `𝔉t=(1,2,4)`; at `w=2`: `1+2·4+4·2=17≡3=3·t(1)`; at `w=1`: `1+4+16=21≡0` | holds; sign needed |
| §0.2 Plancherel, `f_!`, translation, `ψ⁻¹`, subspace | general computation | `Σ_{w'}𝔉t_1𝔉t_2=Σ t_1(w)t_2(u)·|W|δ_{w+u=0}`; `𝔉(f_!t)(w')=Σ t(w_1)ψ(w'(f w_1))`; `𝔉(1_U)=|U|1_{U^⊥}` | hold |
| §0.2 vs `ZMod.dft` | `N=p=3`, `Φ=δ_1` | `dft Φ k = std(−k)`, `𝔉Φ(k)=std(k)=dft Φ(−k)`; `𝔉𝔉Φ(w)=dft(dft Φ)(w)=NΦ(−w)` | agrees with `ZMod.dft_dft` |
| Layer 0 Example | `𝔽_5`, `ℤ/11`, `ψ(1)=3` | `3⁵=243≡1`; `Σψ(w²)=1+2·3+2·81=169≡4`; `4²=16≡5` | holds |
| §1.1 kernel transform, graph kernels, Tor hypothesis | `X=Y=S`; `𝔸¹→pt`; `ℤ/2` over `ℤ/4`; `(id,f)_!Λ`, `(g,id)_!Λ` | identity; `Λ(−1)[−2]` vs `Λ` for `Rp_*`; `Tor_i=ℤ/2` all `i`; `Rp_{Y!}(id,f)_!K=Rf_!K` and `Rp_{Y!}(g,id)_!g^*K=g^*K` | holds |
| §1.2 composite kernel | formula | `Φ_{𝒦'}Φ_𝒦K = Rp_{Z!}(p_X^*K ⊗ p_{XY}^*𝒦 ⊗ p_{YZ}^*𝒦')[a+a']` on `X×Y×Z` | consistent |
| §1.3 constructibility | `𝔸¹_k→pt`, `ℤ/ℓ`; `ℤ/ℓ` over `ℤ/ℓ²` | `Λ(−1)[−2]` perfect; `Tor_i=ℤ/ℓ` all `i` | holds; ctf needed |
| §1.4 dictionary | graph of `𝔸¹→pt`; `a=1`; `[ℤ/4 —2→ ℤ/4]` | `Σ_{x∈𝔽_q}1=q=t_{Λ(−1)[−2]}`; `−t_K`; `H⁰=H¹=ℤ/2`, trace `1−1=0` | holds |
| Conventions, trace/Frobenius | `Λ(−1)[−1]` | Frob on `Λ(−1)` is `qⁿ` (supplier §F.0.3: `q⁻¹` on `μ`), odd degree ⇒ `−qⁿ` | consistent with supplier |
| §2.1 Lang torsor fibre | `F(t)=t+x` ⇒ `F²(t)=t+x+F(x)` ⇒ `Fⁿ(t)=t+N(x)`; `𝔾_a`, `q=3`, `x=1` | arithmetic: `t↦t+1`; geometric: translation by `−N(x)` | holds |
| §2.1 norm onto | `a∈A`: `t` with `Fⁿt−t=a`, `x=Ft−t` | `Fⁿx = F(t+a)−(t+a)=x`, `N(x)=a` | holds |
| §2.2/2.3 trace `χ(N x)` | `(Frob·s)(t)=s(t+N(x))=χ(N x)s(t)`; `𝔾_a/𝔽_3`, `ψ(1)=2`; `𝔾_m/𝔽_5` quadratic; `𝔽_9`, `x=i` | `2` (opposite convention `4`); `+1` at `1,4`, `−1` at `2,3`; `Tr(i)=i+i³=0` ⇒ `1` | holds; convention pinned |
| §2.2 associativity argument | `End(ℒ)=H⁰(G³,Λ)=Λ` on connected `G³` | two isomorphisms differ by a unit fixed to `1` by rigidification | holds |
| §2.4 vanishing | `M⊗χ ≅ M` ⇒ `(χ(a)−1)M=0`; `ℤ/7×ℤ/7`, `(2,1)`; `𝔾_m/𝔽_4`, `Λ=𝔽_4` | unit ideal ⇒ `0`; `(0,(ℤ/7)(−1)[−2])`; `RΓ_c(𝔾_m,[3]_*𝔽_4)=𝔽_4[−1]` is the trivial part, so `RΓ_c(ℒ_χ)=0`; `H¹` has `𝔽̄_2 t ⊗ 𝔽_4` with eigenvalues `ω, ω²` | holds; both hypotheses needed |
| §2.4 orthogonality | `𝔾_m/𝔽_5`, quadratic, `ℤ/3` | `1−1−1+1=0`; `χ(2)−1=−2=1` unit | holds |
| §2.5 laws | `ℒ_ψ(x²−x)` vs `ℒ_ψ(x²−x³)` | difference `x³−x=L(x)` ⇒ trivial | holds |
| §2.6 `j_!≅Rj_*` | trivial `χ`; `k=ℂ`, sign into `ℤ/3` | stalk of `Rj_*Λ` at `0`: `Λ, Λ(−1)`; `χ(−1)−1=1` unit | holds; matches supplier §F.3 Check |
| §2.7 completion comparison | `k{π}`; non-excellent `k(π,f^p)`; `k[π]_{(π)}`, `p` odd | break `m` on both; `f∉K`, `f^p∈K`; `√(1+π)∈k[[π]]∖k(π)` | holds; henselian needed |
| §2.7 Euler–Poincaré | `𝔸¹,Λ`; `𝔾_m,Λ`; `𝔸¹,ℒ_ψ(x)`; `ℤ/49`, `ℒ_ψ(x²)`; `𝔽_p` on `𝔸¹` | `1=1`; `0=0`; `1−1=0`; `1−2=−1` (rank, length would be `−2`); `H¹` infinite | holds; R01 touches one citation in the route |
| §2.8 | `d=1`; `d=2`, `p=3`; `f=x^p` | rank `0`; trace `−(1+2ψ(1))`; break `1`, not `p` | holds |
| §3.2 `FT(σ_*M)`, `FT_{ψ⁻¹}`, `FT_{ψ(c·)}` | `𝔸¹`, `i_{0*}Λ` | `Λ[1]`, trace `−1=−Σδ_0ψ`; `ℒ_{ψ(c·)}⟨e,e'⟩=ℒ_ψ⟨e,ce'⟩` | holds |
| §3.3 `FT_!=FT_*` (headline) | `K=Λ`, `r=1`; trivial `ψ`; `p=2` | `σ'_*Λ(−1)[−1]` on both sides, fibrewise `Λ[1]` would differ; `Λ(−1)[−2]` vs `Λ`; `f_*Λ=Λ⊕(j×1)_!ℒ` | holds; nondegeneracy needed |
| §3.4 inversion (headline) | `i_{0*}Λ`; `i_{a*}Λ`; trivial `ψ` | `FT FT = i_{0*}Λ(−1)`, trace `q=𝔉𝔉δ_0(0)`; support `−a`; `Λ(−1)` not punctual | holds |
| §3.4 `Rπ'_!FT`, `σ'^*FT` | `Λ[1]`, `i_{a*}Λ`, `i_{0*}Λ` | `Λ(−1)=Rπ_!(Λ[1])[1]`; `Λ[1]`; `Λ(−1)[−1]`; `0` | shifts `[r]` and `[−r]` as stated |
| §3.5 duality (headline) | `i_{a*}Λ`; `Λ[1]`; `r=0` | `ℒ_{ψ⁻¹}(ax')(1)[1]` both sides; `σ'_*Λ(1)` both sides | holds |
| §3.6 linear maps, sub-bundles, Plancherel, convolution | `E_1=O`, `E_2=0`; traces; `ℤ/9`, `p=2`, `ψ(1)=−1` | `σ'^*(Λ[1])[−1]=Λ`; `(−1)^{r+s}q^s 1_{F^⊥}` both sides; `σ'_*(ℤ/3)(−2)[−2]`, `[−3]`, `(ℤ/3)(−2)[−2]` | holds |
| §3.6 quadratic forms | identity; `p=2`, `r=1` and `r=2` antidiagonal | `q(e+a⁻¹e')=q(e)+2⟨e,e'⟩+q'(e')`; `0=0`; `π'^*Λ(−2)[−2]` both sides | holds in every characteristic |
| §3.8 trace identity (headline) | `Λ_{𝔸¹}`; Plancherel on `i_{0*}Λ` | `−q` at `0'`; `Σ_{x'}(−1)(−1)=q=q·1` | holds |
| §4.1 `t`-exactness (headline) | `i_{0*}Λ`; `Λ_{𝔸¹}`; `(ℤ/ℓ)_0[−1]` over `ℤ_ℓ`; trivial `ψ` | `Λ[1]`; both in `ᵖD^{≥1}`; `(ℤ/ℓ)_{𝔸¹}` with dual `ℤ/ℓ(1)[1]` perverse ⇒ `p⁺` heart; `Λ(−1)` not perverse | holds |
| §4.2 hearts (headline) | `0→i_{0*}Λ→j_!Λ[1]→Λ[1]→0`; `ℤ/49` | image `0→Λ[1]→FT(j_!Λ[1])→i_{0'*}Λ(−1)→0`; `(ℤ/7)_0 ↦ (ℤ/7)[1]` | holds |
| §5.1 invariants and EP | `i_{x*}Λ` on `ℙ¹`; `j_!ℒ_ψ(x)[1]`; `ℙ¹⊔ℙ¹`; `ℙ¹_{𝔽_{q²}}/𝔽_q` | `a_x=1`, `χ=1=1−0`; `a_∞=2`, `χ=2−2=0`; `−2 ∉ {0,−4}`; `−4=0−4` | holds; signs are L's negated |
| §5.1 twisting lemma route | `θ` on `G¹/G^{1+}`; additive polynomial | `c(b)^{p^N}=Σ_j γ_j^{p^{N−j}} b^{p^{N−j}}`, injective ⇒ monomial ⇒ onto `k`; `𝔽_p` counterexample: `c+a≠0≠c^p+a` | holds over `k̄` only, as stated |
| §5.1 reduced representative | `𝔽̄_3`, `u=t⁻⁶+t⁻⁴+t⁻²` | `u−(w³−w)=t⁻⁴+2t⁻²`; with `z`: `t⁻⁴−t⁻³+2t⁻²+t⁻¹ ≡ t⁻⁴+2t⁻²` | break `4`, not `6` |
| §5.2 types (headline) | `ℒ_ψ(x)[1]`; `ψ(c·)`; `D` | (T2) at `1`, transform at `−1` with `(−1)`; `ℒ_ψ(x)=ℒ_{ψ(c·)}(c⁻¹x)`; `ℒ_ψ(−x)(1)[1]` | holds |
| §5.3 Fourier sheaves (headline) | `Λ`; `ℒ_ψ(x)`; `ℒ_ψ(x²)`; sign | `H²_c≠0`; twist at `t=−1`; `ℒ_ψ(−x'²/4)⊗H¹_c`; `(−1)^1·(−1)·(−1)=−1` | holds; ESDE 7.3.8 (4) |
| §5.4 Kummer transform (headline) | traces; `q=5`, `𝔽_11`, `ψ(1)=3` | `(−χ⁻¹(x'))(−g)=χ⁻¹(x')g`; `g=3−9−27+81≡4`, `g²≡5=χ(−1)·5`; `G^∨`: `(−g)⁻¹=−g(χ⁻¹,ψ⁻¹)/q` | holds |
| §5.5 rank formulas (headline) | `Λ[1]`; `i_{0*}Λ`; `ℒ_ψ(x²)[1]`; `j_!ℒ_χ[1]`; `ℒ_ψ(x)[1]` | `0`, `rk_{0'}=−1`; `1`; `2−1=1`; `1`, `rk_{0'}=0`; `rk_{s'}=−1+[s'≠−1]` | all match `K'`; derivation `χ_c=Σa_s+s_{>1}−r_{>1}` recomputed from §5.1 |
| §5.5 sequence at `0'` | `Λ[1]` | `0→0→0→Λ(−1)→H²_c=Λ(−1)→0` | holds |
| §5.5 vanishing on `A×s'` | `K=j_!Λ[1]` at `(0,s')` | holds by acyclicity over `Spec k`, not by §3.3 | statement holds; R02 on the route |
| §5.5 autoequivalence | criterion both ways | `G_{[0,1[}=0`, `s(G_1⊗ℒ(s/π'))=r(G_1)` for all `s≠0` ⇒ `G_1=0` by §5.1 (the lemma's `a` is nonzero) | holds |
| §5.6 tame values (headline) | `(0,∞')` and `(∞,0')` on `j_!ℒ_χ[1]`; `Λ[1]` | `ℒ_{χ⁻¹}(1/π')=ℒ_χ(π')`, `V'_χ⊗G(χ,ψ)`; `F_∞=V_{χ⁻¹}` ⇒ `V'_{χ⁻¹}⊗G(χ,ψ)`, equal to `F'_{η̄_{0'}}`; `Λ(−1)` | consistent with §5.4, §5.5 and LAU87 (2.5.3.1) |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, Layers 0–5 each ending in Examples and Dependencies, Downstream consumers, References are
present. Every subsection has at least three Checks (counts: 6, 5; 3, 3, 3, 3; 4, 3, 3, 4, 3, 4, 8,
3; 3, 3, 3, 4, 3, 5, 3, 3; 3, 3; 6, 7, 4, 3, 4, 4). No backticked name of the roadmap's own occurs
in the README (the Lean file declares nothing), no LaTeX delimiter, no pull-request number, no
process wording.

## Not verifiable

- SGA45-ST ((4.3), (4.20), the Lang-torsor construction) and KW01 (Ch. III): recorded as
  uncertified in the manifest and cited by locator only; not read. Every statement that cites them
  also has a route through LAU87 or through the roadmap's own argument, and those were checked.
- LAU87 Corollaire (2.3.1.3)(i), extraction line 971: the text layer reads the rank at `0'` with
  `r(K)` where Proposition (2.3.1.1)(iii) gives `r(K')`; for `K = Λ[1]` the two give `0` and `1` in
  L's signs, and `1` is correct. I could not render the page image on this worker to see whether a
  prime was lost in extraction, so this is not reported as a source issue. The README uses `rk(K')`,
  the correct form.
- KL85 line 446: the symbol for the derived category in the standing hypotheses of (2.4.1) is
  garbled in the extraction; the bounded-below reading used by the README is the one LAU87 lines
  521–525 and the route's use of `Rj_*` require.

## Source issues

- none
