# Review of OrdinaryAutomorphicFormsAndModularityLifting (pull request #1066 at faca0d2)

**Verdict:** needs changes

Scope of this round: the whole folder `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/` (README 2436 lines, `Suggested.lean` 118 lines, `metadata.toml`) at `faca0d2`. The gate passed on this head (every check 0, `build=0`), the dependency check reports no UPWARD or CYCLE line, and the diff outside the folder is empty. One blocking finding (ownership), three P3 notes.

## R01 (P2) — The Skinner–Wiles deformation–Hecke route has two owners: ClassicalSerreModularity §I.1 is earlier

**Location.** README lines 7–17 (Scope and ownership: "ClassicalSerreModularity §I.1 owns the classical ℚ ordinary lifting theorems … Sections 5.4, 5.7 and 6.1 identify the specializations … they do not duplicate their proof targets") and Layers 2–5 (§§2.3–2.10, 3.1–3.35, 4.1–4.19, 5.2–5.3, 5.6).

**Claim.** This roadmap owns the SW99/SW01 machinery over totally real fields: permissible Eisenstein ideals, the pseudo-deformation ring and `r_𝒟`, reducible/dihedral loci, pro-modularity, `(P1)/(P2)/(P)`, the key propositions, characteristic-`p` patching, localized `R = T`, Theorems A and B and SW01 Theorem 5.1; ClassicalSerreModularity only owns the `ℚ` specialisations.

**Witness.** `TauCetiRoadmap/ClassicalSerreModularity/README.md` (open head, merge-order position 150; this roadmap is 154) line 426: the two Skinner–Wiles theorems "are proved over totally real fields and specialised to `ℚ`. The nearly ordinary Hecke algebras, pseudo-deformation rings and pro-modularity argument they rest on are targets of this subsection, since no earlier roadmap supplies them." Its target `I.1/nearly-ordinary-hecke-algebras` (line 428) constructs Hida's `T^{n.o.}(U)` over even-degree totally real `F` with the pseudo-representation into `T_𝔪` and permissible ideals; `I.1/pseudo-deformation-rings-and-pro-modularity` (lines 443–444) constructs `R^{ps}_𝒟`, the SW99 §2.1 presentation bound, the reducible and dihedral loci of §§2.2–2.3, the §2.4 lattice comparison, pro-modular and nice primes, good data, `(P1)`, `(P2)` and the key proposition, with Source "[SW99] §§2.1–2.5 … §§4.1–4.5 (Proposition 4.1, Proposition 4.2, Main Theorem) … §5 … §6 … §§7–8"; `I.1/residually-reducible-ordinary-lifting` (line 454) runs the Theorem A route through a totally real abelian `F′` and Washington's theorem; `I.1/residually-irreducible-ordinary-lifting` (line 458) runs SW01 §2 and Lemma 2.2 with the modular seed. CSM line 78 says these are "proved here from the suppliers named in its targets" and that this roadmap's totally real theorems are "compared" with §I.1. Those are exactly the objects of §§2.3–2.6, 3.1–3.27, 4.1–4.15, 5.2 and §§3.28–3.35, 4.16–4.19, 5.6 here. Two open pull requests each build the same constructions; the earlier one is the owner under the merge order, and its ownership was fixed when its design was accepted (the CSM r1 repair added §I.1 precisely because no earlier roadmap supplied these inputs).

**Repair.** Within this pull request: in `## Exact supplier contracts` add a `### From ClassicalSerreModularity` subsection citing `§I.1` targets by name (`I.1/nearly-ordinary-hecke-algebras`, `I.1/pseudo-deformation-rings-and-pro-modularity`, `I.1/residually-reducible-ordinary-lifting`, `I.1/residually-irreducible-ordinary-lifting`) with their hypotheses, say so in Scope, and cut Layers 2–5 to what CSM §I.1 does not plan: the arithmetic refinements of §§1.4–1.6, 2.1, 2.9–2.12 (pairing, traces, Ihara, Eisenstein inputs), the Newton–Thorne weight change §2.11, Waldschmidt §3.38, the ordered-flag refinements §3.39, the Cohen–Macaulay intersection theorem §4.3, the single-coefficient descent §4.6a, the DRS criterion and the abstract characteristic-`p` patching datum §4.20 (where not already DDPA §§5.2–5.6), the abelian preparation §5.1a, Theorem B §5.3 and Hypothesis H §5.1, the `CMComponentSupport` export §5.8, Washington §5.9, the seed §5.10 and all of Layer 6. Every remaining `*Needs:*` line that points at a cut section is repointed to the CSM target. Alternatively the board may decide that this roadmap is the owner; that requires CSM §I.1 to import from here and a change of merge order, which this pull request cannot make. Either way the report records that the README's present Scope sentence misdescribes CSM §I.1 as `ℚ`-only. (PadicFamilies §§5.1–5.9, position 153, also plans `T_∞(U,𝒪)`, Proposition 3.3, Corollary 3.4, Proposition 3.7 and Lemma 3.8, which `I.1/nearly-ordinary-hecke-algebras` plans too; that double owner is PadicFamilies' to resolve, but the contracts here inherit it.)

## R02 (P3) — Supplier identifiers and link fragments that do not exist where they are cited

**Location and claim.** README 93 and 2151: `TauCeti.ResidualModularity.ArisesFrom`, `TauCeti.ResidualModularity.IsModular`, `ArisesFrom.iff_integral_model`, link `../AlgebraicModularFormsAndSerreWeights/README.md#target-s-type-arises-from-and-modular`. README 85: links `#hecke-galois-datum`, `#hecke-galois-points`. README 69, 1957: link `#patching-surjection-iso`. README 77, 235: `definiteNormFibres`. README 274, 283: `NearlyOrdinaryEigenpacket`, `NearlyOrdinaryEigenpacket.isOrdinary`.

**Witness.** Pinned Tau Ceti `a91d3aa` has no `ResidualModularity` namespace; AMFSW's Lean namespace is `TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.ResidualModularity` with the single theorem `residual_attachment` (its `Suggested.lean` lines 181–221), and the predicates `ArisesFrom(f,p,ρ̄)`, `IsModular(p,ρ̄)` and the integral-model reading are prose of AMFSW §7.5 (README 1586–1590); AMFSW has no anchors. GGD §§6.7–6.8 (README 1616, 1663) carry no `<a id>` anchors; the four `HeckeGaloisDatum.*` names do exist there (lines 1634, 1635, 1672, 1688). DDPA has no anchor `patching-surjection-iso`; `patching_surjection_iso` exists (DDPA `Suggested.lean` 257, README 1147). `definiteNormFibres` occurs nowhere in HMVSC's README or Lean; §R18.3.7 (README 2819–2838) states the norm-fibre comparison and `Nrd(D×)=F_+×` in prose. AGR §4.10 (README 2030–2146) defines the nearly ordinary eigenpacket and the predicate `δ_𝔭|O_K×=1` in prose and has no Lean names.

**Repair.** Cite by section: AMFSW §7.5 (drop the `TauCeti.` prefix and `iff_integral_model`; say "the integral-model comparison of §7.5"), GGD §§6.7–6.8, DDPA §5.6, HMVSC §R18.3.7 ("the norm-fibre comparison and `Nrd(D×)=F_+×`"), AGR §4.10 ("its ordinary predicate `δ_𝔭|O_K×=1`"). Remove the three dead fragments.

## R03 (P3) — Locator slips

- README 81, 299, 321, 375: "GL2AutomorphicRepresentationsAndTransfer §§R16.2.1–R16.2.7". That roadmap's Layer R16.2 has R16.2.1, then R16.2.6 and R16.2.7 (README 681, 723, 756); the numbers R16.2.2–R16.2.5 do not exist. Cite "§§R16.2.1, R16.2.6–R16.2.7".
- README 1460: "the proof begins in §2, p. 1622". In `waldschmidt` the proof of Theorem 1.1 is in §5 (line 628, p. 1637); §2 gives corollaries (line 64–72, p. 1619). Write "§1, p. 1618; proof in §5, p. 1637".
- README 2036: "Chebotarev Layer 10" resolves to the roadmap `Chebotarev`, Layer 10 "Dirichlet-density Chebotarev"; that roadmap is neither on main nor in the merge order. Name it as `TauCetiRoadmap.Chebotarev §Layer 10` and expect the intake to place it; not a defect, recorded so the author knows the edge exists.

## R04 (P3) — Suggested.lean: an unused hypothesis and a wider tower than the README describes

- `numerical_completeIntersection_criterion` (Suggested.lean 79–97): `hfinite : Module.length C (RingHom.ker ε).Cotangent ≠ ⊤` is not needed. If the cotangent length is `⊤`, the inequality holds and both sides of the equivalence are false (`η ≠ ⊥` makes `C ⧸ η` of finite length; a bijective `r` would make the cotangent a quotient of the finite `C`-module `ker δ`, hence of finite length). Criterion I (`drs` lines 34–38) has no such hypothesis. Delete it, or keep it and say why in the docstring.
- `cyclotomic_classGroup_primary_stabilizes` (Suggested.lean 108–117) and README 2194 ("these conditions express the cyclotomic tower"): at `ℓ = 2` the hypotheses admit towers that are not the layers of the cyclotomic ℤ₂-extension, e.g. `ℚ ⊂ ℚ(√−2) ⊂ ℚ(ζ₈) ⊂ ℚ(ζ₁₆) ⊂ …` (degrees `2ⁿ`, each inside a `ℚ(μ_{2^m})`, nested). The statement stays true: such a tower is cofinal in the cyclotomic ℤ₂-extension of `ℚ(i)` (abelian over `ℚ`), and `p`-parts inject along steps of degree prime to `p`, so Washington's bound for `ℚ(i)` bounds the tower and monotonicity gives eventual constancy. For odd `ℓ` the `ℓ`-power quotients of `Gal(K(μ_{ℓ^∞})/K) ≅ (finite prime-to-ℓ) × ℤ_ℓ` are unique, so the hypotheses pin the cyclotomic layers. Say in the README that the Lean statement covers every nested `ℓ`-power tower inside `K(μ_{ℓ^∞})`, or add `IsCyclic (L n ≃ₐ[K] L n)` to pin the layers.

## Verified sound

**Gate and dependency check.** The worker's gate at `faca0d2`: `set_option=0 … depcheck=0 … stray-files=0 outside-folder=0 build=0 OK`. Rerun of the dependency check (`--movable`, content at `fa41b37`): `depcheck: 205 roadmaps, 1435 edges, 0 problem(s)`; no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder: empty. Both pins (`lake-manifest.json` of the branch and of `content`): Tau Ceti `a91d3aa`, Mathlib `6b7abb3`, equal to the README's stated pins (line 41).

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` for all seven declarations: 3 s, `sorry` the only warning in the original declarations; the elaborated types equal the signatures file and the README statements of §4.3, §4.20, §5.9 (binder check: no section variable lost; `IsCohenMacaulayLocal`, `IsRelativeCompleteIntersection`, `pPrimaryClassNumber` carry every instance their bodies use). `#synth Module C (RingHom.ker ε).Cotangent` resolves to `instModuleCotangentOfAlgebra` (the natural `C`-structure through `C → R`); `Finite (ClassGroup (𝓞 K))` resolves, so `Nat.card` is the order. One-tactic probe (`first | simp_all | rfl | infer_instance | aesop`) on each of the four theorems: all four leave the goal unsolved; nothing is padding. No `set_option`, no sorried data, single `import Mathlib`.

**Pinned declarations opened** (file:line in `.lake/packages/mathlib/Mathlib`): `RingTheory/Regular/RegularSequence.lean:146` (`IsRegular` = weakly regular and `⊤ ≠ ofList rs • ⊤`, so the sequence lies in the maximal ideal and `IsCohenMacaulayLocal` is depth = dimension); `RingTheory/Ideal/Cotangent.lean:40–45` (`Cotangent I = I ⧸ I•⊤`, `Module S` for `[Algebra S R]`); `RingTheory/Length.lean:30` (`Module.length : ℕ∞`); `GroupTheory/Torsion.lean:268–287` (`primaryComponent` = elements with `g^(p^k)=1`, equal to `p`-power order for prime `p`); `FieldTheory/Galois/Abelian.lean:25` (`IsAbelianGalois`); `NumberTheory/Padics/Complex.lean:137` (`PadicComplex`); `FieldTheory/Finite/Basic.lean:218` (`pow_card_sub_one_eq_one`); `NumberTheory/NumberField/Units/DirichletTheorem.lean:21` (`Units.rank`); `RingTheory/DedekindDomain/FiniteAdeleRing.lean:94`; `NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:47`; the other eight contract files exist at the stated paths. Tau Ceti `a91d3aa`: `HeckeRing.GL2.Newform` (`Newforms/Newform.lean:104`), `HeckeRing.GL2.Newform.qExpansion_coeff_one` (`:164`), `TauCeti.Newform.heckeTDiamondCuspNewCharacter` (`Newforms/Hecke/Algebra.lean:131`, namespaces `TauCeti`/`Newform`), `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (`Newforms/StrongMultiplicityOne.lean:96`). Tau Ceti has no Hilbert modular forms and no Galois representation attached to a newform, so the Main Theorem, Theorems A/B and SW01 Theorem 5.1 are not statable at the pins, as the docstring says; the `ℚ` specialisation is owned by CSM §I.1 (R01).

**Cross-roadmap citations resolved** (open heads via `roadmaps show`; main for CFT, MF, SSF, DAT): PadicFamilies §§0a.1, 0a.14, 0a.15, 0.11, 0.13, 0.15, 4.1, 5.1–5.10, 5.9a (README 184–2877; §0a.14 is `e_U = lim U^{n!}` on finite modules over complete local rings with finite residue field, §5.2–5.3 are `X(U)`, `T₂(U_a,𝒪)=eT(U_a,𝒪)`, `T_∞`, §5.8 is Proposition 3.7 with `μ ≥ 0`, §5.9a the expansion lattice); LGDR §§F.1.3, F.1.9, F.1.10, F.2.1, F.2.2, F.2.5, F.2.6, F.2.7, F.2.9, F.2.11 (`PseudoDefRing`, line 926), 2.5, 2.26, 4.14, 6.2 (SW Lemma 2.2/Cor 2.3: `2f+2` variables and one relation if `χ=ω` or `ω=1`, else `2f+1`; kernel `f+ε`), 6.3 (CHT fixed inertia, ratio not 1 or `ε̄`), 7.1–7.6 (§7.6: trivial residual, `f > d(d+1)/2+1`, dimensions `1+d²+fd(d+1)/2` and `≤ d²−1+fd(d+1)/2`: at `d=2` these are `f>4`, `5+3f`, `3+3f`, as §3.37 states), 8.5, 8.12, 8.13, 8.18; GGD §§3.4–3.8, 4.1, 4.4, 5.6–5.7, 6.6–6.8, 7.4, Layer R04.6; DDPA §§1.7–1.9, 3.1–3.4, 5.1–5.6, 6.6 (connectedness dimension with the bound `c(A/I) ≥ c(A) − ara(I) − 1` for complete `A`; §4.3's SW99 A.1 bound is sharper by one and not complete-only, so it is not a duplicate), 7.6; PHT §3.6, §6.4 (unit-root criterion, BLZ weight `p+1` at `F=ℚ_p`); HMVSC §§R18.3.1–R18.3.23 (R18.3.5 perfect pairing with adjoint `ψ(Nrd g)[Ug⁻¹U]`, R18.3.7, R18.3.8 Ihara, R18.3.22 definite JL after inverting the uniformizer); GL2ART R16.2.1, R16.2.6–7, R16.6.1–5, R17.3.1–9, R17.4.8–11, R17.4.16; AMFSW §7.5; AGR §§1.5, 3.10–3.16, 4.4–4.12, 5.1, 6.4; SWLO §§3.1–3.6, 4.7–4.8; DPL §§0.4–0.6 (§0.6 Iwasawa logarithm with `L(p)=0`), Layers 2–3; AGD §§R02.4.4, R02.4.6 (Grunwald–Wang), R02.5.1, D8.1; IHGD §0.5 (determinants determined by traces when `d!` is invertible), §1.4 "Classical Ribet lattice" (line 2516 inside §1.4), §2.3 "Factorial powers" (line 3001 inside §2.3); CSM §I.1; SR §5.0e (line 2095); LGG Layer 0, Conventions; PA §§0.2–0.4, 1.1–1.3; ArithmeticGaloisRepresentations Layer 5, §4.6 (dihedral images); CFT Layers 7, 11, 12, 13 (the Artin map, global reciprocity, existence, norm theorems); MF Layers 2–5, 10 and the "Level 11, weight 2" worked example (main README 1350); SSF §4.4 (Schlessinger); DAT Layer 3 §3.5 (Schneider–Lang); Chebotarev Layer 10. Consumers named in Downstream exist at their heads: GL2ML §§5.9, 5.18, 7.4, 10.8, 10.9, 10.13, 10.15, 11.1–11.2, 12.3, 12.5, 12.8 (and GL2ML 182–188 consumes §§5.4–5.8, assuming `CMComponentSupport` for §5.8); PMCS Layers 6, 8, 9 (its 26, 36, 1204, 1234 consume §§1.4–1.5, 2.9–2.11, 6.14 and the §4.20 criterion). No `*Needs:*` line cites a later roadmap. Ownership against open pull requests was checked through `roadmaps grep` for Washington's theorem, de Smit–Rubin–Schoof, Waldschmidt's `p`-adic rank theorem and punctured-spectrum connectedness: no other roadmap states them (DDPA §6.6 is the weaker Grothendieck bound; LinearFormsInLogarithms uses Waldschmidt's book, not this theorem).

**Seeded sample** (printed page = PDF page + 3 for `sw99`, + 183 for `sw01`, PDF page 1 being the Numdam cover sheet in both).

| Target | Source, locator | Lines | Result |
|---|---|---|---|
| 3.4 presentation bound | SW99 Prop 2.4 p. 13; proof p. 14 | sw99 316–362 | `g − r ≥ d + δ_F − 2t − 3#ℳ`, `δ_F` = rank of the pro-`p` abelian extension unramified away from `p`; `(2.4)` `d+2t`, `(2.7)` `3#ℳ` as stated |
| 3.9 `r_𝒟` | SW99 §2.4 p. 21 | sw99 569–590 | unique map `R_{𝒟^ps} → R_𝒟`, diagonal basis change fixes `a, d, bc`; `𝒟^ps_Q` with `det` unramified at `Q` |
| 3.22 trace at tame inertia | SW99 Lemma 3.21, Rem. 3.22 p. 51 | sw99 1668–1677 | hypotheses `χ(Frob_w)=1=ω(Frob_w)`, `δ_w` generates `Δ_w` via (3.12), trace acts as `δ_w+δ_w⁻¹` on `M_∞(U″)_m` |
| 3.27 reducible/diagonal loci | SW99 Lemmas 2.7–2.9 pp. 15–17 | sw99 405–459 | `≤ 1+2δ_F+dim H_Σ`, `≤ δ_F+dim H_Σ`, diagonal `≤ 1+2δ_F`, `≤ δ_F` |
| 3.38 Waldschmidt | Thm 1.1 p. 1620; SW99 (4.20) p. 78 | waldschmidt 91–105; sw99 2587–2590 | `rk M_p ≥ rk M/2` with `|φ_p(α_ij)|_p = 1`; SW use `δ_L ≤ d_L/2` from [Wal] |
| 3.39 ordered flags | SW99 Lemma 2.2 p. 11, Cor 2.3 p. 13; SW01 Prop 2.1 p. 189 | sw99 257–314; sw01 176–187 | split versal ring `2d_i+2` variables, one relation iff `χ=ω` or `ω=1`; SW01 says nonsplit case "just as in Corollary 2.3" |
| 4.4 key proposition | SW99 Prop 4.1 pp. 64–66 | sw99 2076–2157 | hypotheses good, `(P1)`, `(P2)` for `𝒟, 𝒟_c`; steps as restated; "Proposition 2.12" printed for Cor 2.12 (line 2105) |
| 4.15 `R=T` all levels | SW99 Prop 8.1 pp. 119–122 | sw99 3952–4071 | (8.3)–(8.11), DRS Criterion I twice, faithful flatness over `B`; "Proposition 7.2" printed for 7.3 (line 3954) |
| 4.16 good pair, nice, (P) | SW01 (4.1), (4.2) pp. 198–199 | sw01 498–522 | `d/2 > 2+2t+7#ℳ₀`, `d_i > 2+2t+7#ℳ₀`, (H_even), (H_def); (4.2)(i)–(iv), merely nice, (P) |
| 4.18 Selmer/auxiliary primes | SW01 Lemma 7.1 p. 208, Prop 7.2 p. 209 | sw01 801–853 | assumptions on `ρ`, `F′`, `F⁺`; `(K/A)^r ⊕ X`, `#X < C(σ,r)` |
| 5.1a preparation | SW99 proof of Thm A p. 76; Conrad Def A.1 p. 31, Prop A.3 p. 32; Milne VIII Ex. 2.2 p. 231, Thms 2.3–2.4 p. 232 | sw99 2525–2531; conrad 1383, 1408; milnecft 10484–10541 | SW: `E=F·E′`, `E′` real cyclic, `p` split, `q` inert; Conrad special case and character extension; Milne: no cyclic degree-8 extension with 2 inert |
| 5.4 comparison over ℚ | SW99 Thm A pp. 74–75; Khare intro p. 3 | sw99 2468–2479; kh 79–127 | Theorem A hypotheses as restated |
| 5.9 Washington | Washington §1 Theorem p. 87, §2 p. 88, §3 p. 91; SW99 (4.13) p. 76 | washington 59–60, 87, 215 (GDZ scan, printed = scan page + 85); sw99 2539–2540 | `k` abelian, `K/k` the cyclotomic ℤ_p-extension, `ℓ ≠ p`, the `ℓ`-part of `h_n` bounded; §2 reduces to minus parts, §3 is the proof; SW99 cites [Wa] for the stabilisation of `c_n, r_n` |
| 6.4 Hida family | EPW Thm 2.1.2 p. 7, Thm 2.2.2 p. 9; Hida Cor 3.7 p. 253 | epw 340–349, 408–415; hida86 885 | `T_N` free over `Λ`, classical primes; `T^new_N` finite reduced torsion-free, tame conductor `N`, étale over `Λ_℘` |
| 6.6 distinguishedness | SW99 intro p. 6 | sw99 62–100 | the three hypotheses of the introduction |

Also checked while reading: SW99 Appendix A.1–A.2 (sw99 4097–4120: local CM `A`, `r ≤ d−2`, punctured spectrum connected; components meet in a prime of dimension `d−r−1`); SW99 §5 (5.1)–(5.11) (sw99 2655–2733); (3.9) and Prop 3.18 (sw99 1486–1508); (3.10)–(3.11) (1515, 1521); Lemma 3.10 and 3.11 (1299–1329); Lemma 3.17 and (3.7) (1446–1461); (G) and nice primes (2018–2070); the Main Theorem's proof (2445–2466); SW01 §2 (sw01 128–272), Lemma 3.5 (491–496), Prop 4.1 proof (541–637), Thm 5.1–5.2 (667–720); Pan Thm 1.0.2 (pan 100–104: at `p=3` the ratio `ω` is excluded); DP Thm 1.7 p. 4 and Paso 6 p. 14 (dp 174–180, 656–676); NT Lemma 2.6 p. 12, Lemma 3.1 pp. 13–14 (nt 548, 576–618); EPW Def 2.2.1 p. 9, Thm 2.3.1 p. 10, Props 2.3.2–2.3.5 pp. 11–13, Defs 2.3.6–2.3.7 p. 13 (epw 402–632); DRS Criterion I (drs 13–38: complete DVR `O`, `T` finite flat, `η_T ≠ 0`, `length(I_R/I_R²) ≥ length(O/η_T)` with equality iff isomorphism of complete intersections; `R` need not be finite).

**Adversarial table.** One row per statement checked; values on both sides.

| Statement | Instance | Computed | Result |
|---|---|---|---|
| §1.1 `t^{p^n(p^m−1)} → e_t` | `ℤ/25`, `t=2`, `m=1`: `2^{5·4}=2^{20}` | `16^5 = 16·6·… `: `16²≡6`, `16⁴≡11`, `16⁵≡176≡1` | unit factor → 1 ✓ |
| same | `ℤ/125`, `t=5`: `5³` | `125 ≡ 0` | nilpotent factor → 0 ✓ |
| §1.1 Check `m=0` | exponent `p^n(p^0−1)=0` | `t^0=1` for nilpotent `t` | `m ≥ 1` essential ✓ |
| Conventions pairing | one point, `c=2`, `f=3,g=4` over ℚ | `12/2 = 6`; over `𝔽₂` `c=0` | ✓ / degenerate ✓ |
| §1.4 two points, free | `f=(2,3), g=(4,5)` | `8+15=23` | ✓ |
| §1.4 central scaling | two-point free orbit, `f=2,g=3` | `B_X = 2·6 = 12`, central `6`, `#C=2` | `B_X = #C·B` ✓ |
| §1.5 fibre trace | `Y=Fin 2 → *`, `g=(2,3)` | `5` (sum, not `5/2`) | ✓ |
| §1.5 weighted trace | `c_U(x)=2, c_V(y)=1, h(y)=3` | `(2/1)·3 = 6`; `6/2 = 3 = Σ h(y)/c_V(y)` | adjunction ✓ |
| §2.5 rank over `Λ′` | `δ_F=1, r=1, p=5`: `u(1+T)^5−1` | `≡ T^5 mod p`, distinguished of degree 5; basis `1,…,T⁴` | rank `p^{Σr_j}`, not `Σ r_j` ✓ |
| §2.5 `r_j = 0` | `1+X ↦ u(1+T)` | degree-1 distinguished, rank 1 | iso ✓ |
| §2.3 Check 691 | `τ(2)=−24`, `τ(3)=252` vs `1+ℓ^{11}` | `2049+24 = 2073 = 3·691`; `177148−252 = 176896 = 256·691` | ✓ |
| §2.3 Eisenstein eigenvalue | `ψ = χω⁻¹`, `Nm ℓ ≡ ω(Frob_ℓ)` | `1+ψ(ℓ)Nm ℓ ≡ 1+χ(Frob_ℓ)` | ✓ |
| §2.1 `X₀(11)` | `a₃=−1`, `a₂=−2` | `v₃(−1)=0`, `v₂(−2)=1` | ordinary at 3, not at 2 ✓ |
| §2.1 `δ_v(1+p)` | `k=(2,4)`, `v=(1,0)`, `p=3` | `(1+3)^{−1} = 1/4` | ✓ |
| §2.8 Frobenius functional | `𝔽₅[T]/(T⁵)` | algebra trace of `T^i`: `0` for `i≥1`, `5≡0` for `i=0`; coeff of `T⁴` pairs `T^i,T^{4−i}` to 1 | ✓ |
| §2.11/2.12 determinant | `ε⁻²ω mod p` | `ε̄⁻²·ε̄ = ε̄⁻¹` | ✓ |
| Conventions quotient recovery | `g=diag(3,1)` (sub 3, quotient 1), `σ=diag(5,1)` | `(3·6 − 16)/(3−1) = 1`; multiplying: `2·2 = 4` | ✓ |
| §3.13 `(tr(gσ) − α tr σ)/(β−α)` | `g=diag(α,β)`, `σ=diag(u,w)` | `(αu+βw − αu − αw)/(β−α) = w` | quotient recovered ✓ |
| §3.7 fourth identity | `2×2` matrices | `(a_σb_τ+b_σd_τ)(c_αa_β+d_αc_β)` expands to the four terms with `x=bc` | ✓ |
| §3.7 example | `[[2,1],[1,1]]` | trace 3, det 1, `x(σ,σ)=1` | ✓ |
| §3.7 trace recovery | `ρ(z₁)=diag(1,−1)` | `(T(σ)+T(z₁σ))/2 = (a+d+a−d)/2 = a` | ✓ |
| §3.8 bound | `s² + 4s ≤ 2s² + 4` | `⟺ (s−2)² ≥ 0` | ✓ |
| §3.8 Check `[[1,t],[t,1]]` over `k[t]/(t³)` | square | diagonal `1+t²`; `ε=t²`: `x₁(σ,σ)=1`, `a₁(σ²)=1`, `a₁(σ)=0`; `1 = 0+0+1` | ✓ |
| §3.1 Ribet class at 691 | `H¹_unr(D_691, k(ω⁻¹¹))` | `ω⁻¹¹` nontrivial on `I_691` (`gcd(11,690)=1`), invariants 0 | admissible ✓ |
| §3.2 `h¹(D_i, k(χ⁻¹))` | local Euler characteristic | `= d_i + h⁰ + h² ≥ d_i` (`h⁰=0` as `χ|D_i≠1`) | ✓ |
| §3.4 dimension | `𝒪[[x_1..x_g]]/(f_1..f_r)` | `dim ≥ g+1−r` | ✓ |
| §3.24 Check | `χ(Frob_ℓ)=1` | `T(ℓ) ≡ 2`, unit for odd `p` | ✓ |
| §3.30 Klein four | `diag(1,−1)`, `[[0,1],[1,0]]` | group of order 8, projective image `(ℤ/2)²`, three index-2 subgroups | ✓ |
| §3.30/3.38 CM counterexample | `F=ℚ`, `F′` imaginary quadratic, `p` split, `ℳ=∅` | minus global units rank 0, minus local units rank 1 ⇒ `δ⁻=1 > 1/2` | SW01 Lemma 2.2 false for CM `F′` ✓ (Source issues) |
| §3.38 (i) | `d=2`: `r_p ≥ 1/2 ⇒ r_p=1`, `δ_F = 1+(1−1) = 1`; `d=3`: `⌊4/2⌋ = 2`; `d=4`: `⌊5/2⌋ = 2 = d/2` | ✓ |
| §3.38 (ii) | `F′/F` totally real quadratic | minus units rank `(2d−1)−(d−1) = d`; `r_p⁻ ≥ d/2`; `δ⁻ = d − r_p⁻ ≤ d/2` | ✓ |
| §3.37 | `d_v=5` | `5+15=20`, `3+15=18`; threshold `f > 2·3/2+1 = 4` | matches LGDR §7.6 ✓ |
| §4.2 (G) | SW99 p. 62 | `d > 2+δ_F+8(#Σ+dim H_{Σ₀})`, `d_{v_i} > 2+2t+7(#Σ+dim H_{Σ₀})`, fifth tame condition | as README ✓ |
| §4.3 Lean | `A=k[[x,y,z,w]]/(xy)`, `d=3`, `f=[]` | minimal primes `(x),(y)`; `Q=(x,y)`, `dim A/Q = 2 = d−0−1` | ✓; `I=(1)` excluded by `hproper` ✓ |
| §4.3 Lean junk | `d − f.length − 1` with `f.length+2 ≤ d` | `≥ 1`, no truncation | ✓ |
| §4.3 completeness | SW Prop A.1 states "local CM", not complete | connectedness of `Spec(Â/IÂ)∖{m}` surjects onto `Spec(A/I)∖{m}` | non-complete statement follows ✓ |
| §4.20 Lean identity case | `R=T=C`, `ε=δ=id` | `η=⊤`, `length(C/⊤)=0`, cotangent of `0` has length 0; `IsRelativeCompleteIntersection C C` via `n=0,f=[]` | both sides true ✓ |
| §4.20 Lean infinite case | `R=C[[x]]→T=C`, `ε(x)=0` | cotangent `(x)/(x²) ≅ C`, length `⊤`; `hfinite` fails; without it both sides of `↔` are false | R04 |
| §4.20 loose CI predicate | `T` finite flat over `C`, `T ≅ C[[X₁..X_n]]/(f)` with `f` regular of length `r` | `dim T = 1 = n+1−r ⇒ r=n` | DRS sense recovered ✓ |
| §4.20 `t = s²/(1+s)` | `s=1` over ℚ | `(1+s)+(1+s)⁻¹−2 = 2+1/2−2 = 1/2` | ✓ |
| §4.20 Example (SW01 gap) | `d=40, t=1, #ℳ₀=0, #Σ=4` | `2+2t = 4 < 20`; `d−7#Σ−1 = 11 < 21 = d/2+1` | (4.1) does not give the general step ✓ (Source issues) |
| §4.17 general bound | `I₂` has `1+4#(Σ∖𝒫)+δ_F` generators | `dim Q₂ ≥ d−2t−3#ℳ−4#(Σ∖𝒫)`; `d/2 > 2+2t+7#(Σ∖𝒫)` gives `≥ d/2+1` | hypothesis sufficient ✓ |
| §4.19 parameters | `tr I₂ − 2`; `(δ,δ⁻¹)` | `0`; `δ+δ⁻¹−2` | matches `B_N → A_N` ✓ |
| §5.1 Hypothesis H | degrees `2ⁿd` | `2^{n(1−ε)}d^{1−ε}/(2ⁿd) = 2^{−nε}d^{−ε} → 0` | ✓ |
| §5.1a Check 290 | `p=17` | `290 = 1+17²`; `x↦x^{17}` maps `1+17ℤ₁₇` onto `1+17²ℤ₁₇` ⇒ 17th power; `ω⁻¹(Frob₂)=2⁻¹=9`, `9²≡13, 9⁴≡−1, 9⁸≡1` ⇒ order 8 | ✓ |
| §5.1a Grunwald–Wang | cyclic degree 8 over ℚ with 2 inert | impossible (Milne Ex. 2.2); degree 16 needed | ✓ |
| §5.5 | `p=3` | `ω² = 1` in `𝔽₃^×` ⇒ `χ̄₃^{∓1}|_{G_{ℚ₃}} = ω`; Pan excludes ratio `ω` at `p=3` | ✓ |
| §5.10 Check `X₀(11)`, `p=7` | `a₂=−2`, `a₇=−2` | `X²+2X+2`, disc `−4 ≡ 3`, squares mod 7 are `1,2,4` ⇒ nonsquare; `a₇` unit; twist by `ω₇`: inertia `ω₇², ω₇` | ✓ |
| §6.5 | `X₀(11)`, `p=5` | `numerator(10/12)=5`; `a₅=1 ≡ 1+5`; `ω` order 4 on `I₅`; `k≡2 (4)` iff `ω^{2−k}=1`; new at 5 ⇒ `a₅²=5^{k−2}` | ✓ |
| §6.6 (a) | `k` even, `p` odd | `k−1` odd, `p−1` even ⇒ `(p−1)∤(k−1)` ⇒ `ω^{k−1}≠1` on `I_p` | ✓ |
| §6.6 (b) | `χ_{−23}` at 3 | `−23 ≡ 1 (3)`, square ⇒ 3 splits ⇒ `χ_{−23}|D₃ = 1` | ✓ |
| §1.6 Check | `F=ℚ(√3)` | `x²−3y²=−1` impossible mod 3 ⇒ no norm `−1` unit ⇒ `h⁺=2`, `h=1` | ✓ |
| §5.9 Lean `ℓ=2` | tower `ℚ(√−2) ⊂ ℚ(ζ₈) ⊂ ℚ(ζ₁₆) …` | degrees `2,4,8`, nested, cyclotomic; equals `ℚ(i)_{n−1}` for `n≥2` | true but wider than "the cyclotomic tower" (R04) |
| §5.9 Lean odd `ℓ` | `Gal(K(μ_{ℓ^∞})/K) ≅ Δ × ℤ_ℓ`, `ℓ ∤ #Δ` | unique quotient of order `ℓⁿ` | layers pinned ✓ |
| §5.9 injectivity | `[L_{n+1}:L_n] = ℓ ≠ p` | `N∘i = ℓ` on `Cl[p^∞]` ⇒ injective ⇒ nondecreasing bounded ⇒ eventually constant | ✓ |

**Convention witnesses recomputed across layers.** The quotient-character formula is used with "sub `β`, quotient `α`" in Conventions and §3.17 and with "sub `α`, quotient `β`" in §§2.5, 3.13; both are the same identity `tr(gσ) − (sub)·tr σ = ((quot) − (sub))·ψ₂(σ)`, and the §3.17 instance (`α_i ≡ 1` quotient, `β_i ≡ χ(g_i)` sub) agrees with SW99 p. 42 and with the permissible flag (sub `χ`, quotient `1`). The twist rule `T₀(𝔭_i) ↦ T₀(𝔭_i)Ψ(λ)` of §3.20 is forced by `(3.4)(vi)` and `T_y ↦ T_yΨ(y)`; see Source issues. The `B_N ⊂ A_N` parameter `t = (1+s)+(1+s)⁻¹−2` of §4.20 matches §4.19's `δ_w+δ_w⁻¹−2` and §3.35(iii).

## Not verifiable

- **Diamond, The refined conjecture of Serre (1995), Theorem 6.4** (README §5.10): no open copy (cited here through SW01 Theorem 5.2, which was read).
- **Skinner–Wiles, Base change and a problem of Serre, Duke 107 (2001)** (README §6.14): the README's citeseerx link is a cache of an unverified copy and in no licence class; Duke is paywalled. Not read; the statement is cited by its locator.
- **Chai, Ann. of Math. 131 (1990) §4.5**, **Wiles [W2] Invent. 94 (1988) Thm 1.4.1**, **Hida [H3]** (README §§2.4, 2.12): cited through SW99; not fetched this round.
- **BLGG12, BLGG13, BCGP** (References): listed but each is named once in the body only as a convention remark (lines 35, 2429–2432); no statement here rests on them, so nothing was checked against them.

## Source issues

- **Misprint** in sw99 at Lemma 3.10 and the paragraph before it, printed p. 41: the source says `Λ_𝒪` is free over `Λ′_𝒪` of rank `Σ r_j`; it should be `p^{Σ r_j}` (Weierstrass division by distinguished polynomials of degree `p^{r_j}`); affects nothing.
- **Misprint** in sw99 at proof of Lemma 3.11, printed p. 42: the source writes `T_y = (β_i − α_i)(β_i tr ρ(σ_y) − tr ρ(g_iσ_y))` and likewise for `T₀(𝔭_i)`; it should be the inverse `(β_i − α_i)⁻¹`; affects nothing.
- **Misprint** in sw99 at (3.7), printed p. 45: the source says `τ_P(T₀(𝔭_i)) = (T₀(𝔭_i) mod P)·Ψ_P(λ)⁻¹`; it should be `·Ψ_P(λ)` (the other lines of (3.7) and (3.4)(vi) twist the quotient character directly); affects nothing.
- **Misprint** in sw99 at proof of Proposition 4.1, printed p. 64, and proof of Proposition 4.2, p. 66, and §8.4, p. 119, and proof of Theorem B, p. 78: the source cites "Proposition 2.12", "Proposition 3.14", "Proposition 7.2" and condition "(vi)"; it should be Corollary 2.12, Proposition 3.18, Proposition 7.3 and "(iv)"; affects nothing.
- **Misprint** in sw01 at Proposition 2.1, printed p. 189: the source defines `δ_F` as the rank of the maximal abelian pro-`p` extension of `F`; it should say unramified away from `p`, as in SW99 Proposition 2.4; affects nothing.
- **Error** in sw01 at Lemma 2.2 and the sentence before it, printed p. 191: the source says `δ⁻_{F′} ≤ d/2` for every quadratic `F′` by Waldschmidt; it should be restricted to totally real `F′` (for CM `F′` with `p` split and `ℳ = ∅`, `δ⁻_{F′} = d`); affects the proof of Theorem 5.1 for a dihedral `ρ̄` induced from a field with a complex place.
- **Gap** in sw01 at proof of Proposition 4.1, general `𝒟`, printed p. 202: the source says the dimension of `Q₂` is at least `d − 7#Σ − 1` and "from (4.1)" at least `d/2 + 1`; it should carry a hypothesis on `#(Σ∖𝒫)`, since (4.1) bounds only `#ℳ₀` (`d=40, t=1, ℳ₀=∅, #Σ=4` gives `11 < 21`); affects the proof for data with `Σ ⊋ Σ₀`.
