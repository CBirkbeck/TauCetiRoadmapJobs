<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18060#issuecomment-6907566796 -->
Review (claude) of 5ba936e

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a text-extraction line number in the roadmap text

   - **Location:** `packages/QuasicoherentSheavesOnPrestacks/README.md` line 189: "(Chevalley's theorem,
     used in the proof of BZFN Corollary 3.22, BZFN line 1205)".
   - **Claim:** the locator of Chevalley's theorem inside BZFN.
   - **Witness:** "line 1205" is a line of the worker's text extraction, not a locator a reader can
     follow; the passage is in the proof of Corollary 3.22 on arXiv p. 24 (BZFN line 1205 is on the
     page that ends at BZFN line 1214, footer "24"). Every other source locator of the README is a
     result number with a page.
   - **Repair:** replace "BZFN Corollary 3.22, BZFN line 1205" by "BZFN Corollary 3.22, p. 24".

2. **F02** (P3) the reference list names a chapter that nothing cites

   - **Location:** `packages/QuasicoherentSheavesOnPrestacks/README.md` line 940: "chapters *Morphisms of
     Schemes*, *Descent*, *Derived Categories of Schemes*, *Derived Categories of Spaces* and *Sheaves on
     Algebraic Stacks*".
   - **Claim:** the Stacks Project chapters the roadmap cites.
   - **Witness:** the 18 tags cited are 0FXR, 0FXS, 0FXT, 02JR (Morphisms of Schemes), 023Q, 0245
     (Descent), 0A0J, 08D3, 06Z0, 08DZ, 08E8, 09IS, 0BQR, 09M1, 08EU, 08IB (Derived Categories of
     Schemes), 06WG, 06WT (Sheaves on Algebraic Stacks). None is in *Derived Categories of Spaces*,
     and the `version_note` of `Stacks` in `sources.toml` lists four chapters, not five.
   - **Repair:** delete "*Derived Categories of Spaces*" from that line (the list then reads
     "*Morphisms of Schemes*, *Descent*, *Derived Categories of Schemes* and *Sheaves on Algebraic
     Stacks*").

3. **F03** (P3) a supplier is cited for more than it states (θ and colimits)

   - **Location:** `packages/QuasicoherentSheavesOnPrestacks/README.md` line 126: "`animatedToCAlg` (θ,
     which preserves colimits)"; line 217: "θ preserves small colimits, in particular pushouts; it is
     the colimit-preserving extension of the inclusion of polynomial rings (`animationExtension`)".
   - **Claim:** EnhancedDerivedSheaves E5:animation.4 supplies that θ preserves all colimits.
   - **Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` line 1996 (main) states only "a
     sifted-colimit-preserving functor θ". Line 1927 (`animationExtension`) says the extension
     preserves all colimits exactly when the input preserves finite coproducts. The fact is true, and
     it is 1.1's, but its one missing step is not written.
   - **Repair:** line 126: "`animatedToCAlg` (θ, which preserves sifted colimits)". Line 217, first
     sentence: "θ preserves small colimits, in particular pushouts: it is the sifted-colimit-preserving
     extension of the inclusion of polynomial rings, and that inclusion preserves finite coproducts,
     `ℤ[x] ⊗ᴸ_ℤ ℤ[y] = ℤ[x, y]` being discrete, so the extension preserves all colimits
     (`animationExtension`)." Tested on the instance: `Tor_i^ℤ(ℤ[x], ℤ[y]) = 0` for `i > 0`, `ℤ[x]`
     being free over ℤ, so the coproduct in `CAlg^cn` is the discrete `ℤ[x, y]`.

4. **F04** (P3) a redundant instance hypothesis in the headline theorem

   - **Location:** `packages/QuasicoherentSheavesOnPrestacks/Suggested.lean` line 80:
     `[Finite Γ] (p : ℕ) [Fact p.Prime] [CharP k p] (hp : p ∣ Nat.card Γ)`.
   - **Claim:** primality of p is a hypothesis of `not_preservesCoproducts_trivial`.
   - **Witness:** it follows from the others. `Nat.card Γ > 0` (`Nat.card_pos`, Γ finite and nonempty),
     so `p ∣ Nat.card Γ` gives `p ≠ 0`, and `CharP.char_is_prime_or_zero k p` gives `p.Prime`. A
     scratch theorem with exactly the binders `[Field k] [Group Γ] [Finite Γ] [CharP k p] (hp)` and
     conclusion `p.Prime` elaborated with no error by these two lemmas. The README (8.6) says "a field
     k of characteristic p", with no separate primality.
   - **Repair:** delete `[Fact p.Prime]` from the signature. Tested: the file with that binder removed
     elaborates with `sorry` the only warning, and `#check @…not_preservesCoproducts_trivial` shows the
     binders `k, Field k, Γ, Group Γ, Finite Γ, p, CharP k p, p ∣ Nat.card Γ, HasDerivedCategory`.

5. **F05** (P3) a pinned Tau Ceti declaration cited without its name and file

   - **Location:** `packages/QuasicoherentSheavesOnPrestacks/README.md` line 131: "§1.1:
     `Descent.qcohPseudofunctor` and `qcoh_fpqc_descent` (quasi-coherent modules form a stack for
     Mathlib's `fpqcTopology`)".
   - **Claim:** both names are consumed from SchemeAndStackFoundations §1.1.
   - **Witness:** the first exists at the pin:
     `TauCeti.AlgebraicGeometry.Descent.qcohPseudofunctor`,
     `TauCeti/AlgebraicGeometry/Descent/QuasicoherentSheaf.lean:139` (the supplier's own §1.1, README
     line 2796 on main, cites it so). The stack theorem `qcoh_fpqc_descent` is not at the pin and
     stays the supplier's.
   - **Repair:** add under `### From Tau Ceti`: "`TauCeti.AlgebraicGeometry.Descent.qcohPseudofunctor`
     (TauCeti/AlgebraicGeometry/Descent/QuasicoherentSheaf.lean:139), the pseudofunctor
     `T ↦ QuasicoherentSheaf T` with pullback, for which SchemeAndStackFoundations §1.1 proves the
     stack property; 3.2 compares its affine case with hearts." and change line 131 to "§1.1:
     `qcoh_fpqc_descent` (Tau Ceti's `Descent.qcohPseudofunctor` is a stack for Mathlib's
     `fpqcTopology`); 3.2 compares its affine case with hearts."

Five findings, all P3 (no P1, no P2). No statement was found false, vacuous or overclaimed; the
repairs are four one-line edits of `packages/QuasicoherentSheavesOnPrestacks/README.md` and one
binder deleted in `packages/QuasicoherentSheavesOnPrestacks/Suggested.lean`. A package is accepted
only with nothing to repair, so the verdict is needs changes.

Previous review of this package: none. Maintainer notes: none.

## Verified sound

**Principles.** No route-specific shortcut, no `set_option`, no sorry'd data, no algorithm. The three
local theories it overlaps (PrismaticCohomologyPartII §4.0, LanglandsParameterStacks §§1.7–1.8,
HabiroCohomologyFoundations §§1.27–1.28) are imported by name and section and extended, each
extension saying where it agrees with the import; I read the three sections at their open heads and
the README's account of each is accurate (names `QCohPrestack.eval`, `ofPoints`, `pullback`,
`specEquiv`, `limitOfColimit`, `isEquiv_iff_eval`, `unit_eval`, `isDualizable_iff_perfect`,
`isInvertible_iff`, `homotopyCategory_spec`, `QCohPrestack.Perf`, `flatDescent`,
`sheafificationEquiv`, `cechDescent`, `affinePushforward`, `affineBaseChange`,
`affineProjectionFormula` all present in §4.0).

**Elaboration.** `lake env lean` on `packages/QuasicoherentSheavesOnPrestacks/Suggested.lean` from
the content checkout: exit 0, the single warning `declaration uses sorry` (line 79). One module
docstring of the required form, one namespace, one `theorem`, a docstring on it, a single
`import Mathlib`, no `set_option`, no `lemma`, no `#eval`. `#check @name` on the one declaration:
the elaborated type keeps every binder of the source (`k`, `Field k`, `Γ`, `Group Γ`, `Finite Γ`,
`p`, `Fact p.Prime`, `CharP k p`, `hp`, `HasDerivedCategory`); none lost. It agrees with README 8.6
(k and Γ in one universe u, coproducts indexed by the morphism universe w).

**One-tactic probe (1 of 1 sorried theorems).** `simp`, `rfl`, `infer_instance`,
`exact not_forall.mpr ⟨_, inferInstance⟩` and `aesop` each leave the goal open. Not padding: the
statement needs Shapiro's lemma, the cyclic computation and a computation of maps into a countable
coproduct in a derived category.

**Headline theorems.** From the Summary and the build table: flat hyperdescent (3.2); `QCoh(u_!X) ≃
QCoh(X)` (2.4); invariance under fpqc hypersheafification and Čech descent (3.3); affine
pushforward, projection formula, base change (4.2); `QCoh(h_X) ≃ Dqc(X)` (5.3); the t-structure
(6.2) and perfect = dualizable (6.3); quotients (7.2–7.4); compact generation of qcqs schemes
(8.1); perfect stacks and permanence (8.2–8.4); non-compactness of O in characteristic p (8.5, 8.6).
Only 8.6 is statable at the pins and it is stated; each of the others is named in the module
docstring with the carrier it lacks. I confirmed the lack at the pin: the pinned Tau Ceti has
`AlgebraicTopology/Quasicategory/{Cartesian, Core, FullSubcategory, LocallySmall,
RightMappingSpace}.lean` and a dg nerve, and no limits of ∞-categories, stable or presentable
∞-categories, animated rings or `DQCoh` (`DQCoh` occurs nowhere in the pinned Mathlib or Tau Ceti).
Mathlib at the pin has no compact objects for coproducts in a preadditive category (no
`IsCompactObject`; `CategoryTheory.IsFinitelyPresentable`, Presentable/Finite.lean:49, is the
filtered-colimit notion), so 8.6 is not already in the library.

**Backticked names of this roadmap's own.** One, `not_preservesCoproducts_trivial` (README line
897), declared in `Suggested.lean`. No other roadmap on main or in an open pull request declares
that name (`roadmaps grep`: no match).

**Pinned declarations (43 file:line locators opened, all correct).** Mathlib:
Quasicategory/Basic.lean:41, KanComplex.lean:40, Nerve.lean:37, Quasicategory/Nerve.lean:32,
Scheme.lean:466 and :494, Sites/Fpqc.lean:41, :54, :61, :67, :76, :84, :88, Sites/Canonical.lean:129,
FinitePresentation.lean:392, PrecoverageToGrothendieck.lean:166 (hypotheses
`IsStableUnderComposition`, `IsStableUnderBaseChange`, `HasPullbacks`, `HasIsos`, as the README
says), Flat/Basic.lean:114, FaithfullyFlat/Basic.lean:64, DerivedCategory/Basic.lean:74, :87, :243,
TStructure.lean:33, Descent/IsStack.lean:49, DescentData.lean:59, Bicategory/Grothendieck.lean:235,
GroupCohomology/Basic.lean:183 and :202, Coinduced.lean:120, Shapiro.lean:58, FiniteCyclic.lean:80
and :114, Cycle/Type.lean:491, Preadditive/Yoneda/Basic.lean:83, Preserves/Basic.lean:74,
Discrete/Basic.lean:55, Rep/Basic.lean:30 and :288, Rep/Iso.lean:157, Presentable/Finite.lean:49.
Tau Ceti: Embedding.lean:212 (statement read: finite type over a field, one universe, closed
immersion into `GeneralLinear.groupScheme k n`), FullSubcategory.lean:53 and :157,
FilteredFree.lean:146. In addition 34 full Mathlib names were elaborated with `#check` in one
scratch file: no unknown identifier.

**Supplier citations resolved (all found where cited).** EnhancedDerivedSheaves on main: 59 names
checked, each in the section the README gives (for instance `descendableCover_zariski` in E2.8,
`tot_filteredColimit_of_bounded` in E5:animation.3, `categoricalModuleBaseChange` and `spectra` in
E5:presentability.2, `homotopyFixedPoints`, `CoherentActionData` and `continuousDerivedInvariants`
in E5:presentability.3, `coherentMate` and `beckChevalley` in E3.4, `enhancement_compatibility` in
E5). SchemeAndStackFoundations on main: §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 and 24 names,
including the 9 names the worker's resolver could not find in the pinned libraries (they are
supplier names, not library names). §1.21 defines `[X/R]` as `Stack.stackification` of the
objectwise groupoid prestack, which is what 7.4(a) uses; §2.18's `torIndependent_baseChange` and
`totalDirectImage_coproduct` carry the qcqs hypothesis 5.4(a) states. StableHomotopyKTheory §5.17:
`IsCompactForCoproducts` (Suggested.lean line 250 on main) has the body the Lean statement writes
out. DerivedModuleAlgebra §0.2, §1.E.0; ReductiveGroups Layers 1, 3, 6. The InfinityCategoryTheory
family at its open head: all 39 labelled statements cited exist (InfinityTopoi 15,
HypercompletenessAndCoherence 12, CartesianFibrations 4, PresentableInfinityCategories 2,
StableInfinityCategories 2, and one each of PresheavesAndCompletions, LimitsAndKanExtensions,
DerivedInfinityCategories, InfinityCategoryFoundations). The three "its … step" citations
(InfinityTopoi §§8.4.1, 9.1.1, 9.2.3) are stated in those sections' routes with the same HTT
lemmas, and §9.2.3 says in words that its local-lifting step holds for any Grothendieck topology,
the generality 2.5 and 4.1 use.

**Dependency check.** Output: `depcheck: 246 roadmaps, 2300 edges, 0 problem(s)`. No UPWARD, CYCLE
or `moved:` line. The suppliers not in the merge order are on main (EnhancedDerivedSheaves,
SchemeAndStackFoundations, DerivedModuleAlgebra, ReductiveGroups, StableHomotopyKTheory) or are new
roadmap folders of another author's open pull request (the InfinityCategoryTheory family).
AnalyticStacks, later in the order, appears only under Downstream consumers.

**Declared gaps (2).** `gap:chevalley-quasiprojective-quotient` (ReductiveGroups Layer 3) and
`gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16): same slugs, suppliers and sections
in `design/plan.json` and under `## Exact supplier contracts`. Each `needs` is one statement with
its hypotheses. Neither is already provided: ReductiveGroups Layer 3 on main treats `G/H` as an
fppf sheaf quotient and never says "quasi-projective"; §1.16 on main proves
`contractedProduct_isAlgebraicSpace` only. The SGA1 locator of the route (Exposé VIII, Proposition
7.8, PDF p. 190 = printed p. 174) is correct.

**Sources: the seeded sample (15 targets) and the manifest.** Every locator of the sampled targets
was opened; all are at the stated result and page, and each supports the statement as written.

| Target | Locators verified (source line) |
| --- | --- |
| 1.2 | HA Thm 4.5.3.1 and Rem 4.5.3.2, p. 601 (HA lines 22977, 22981); Cor 4.8.5.21, p. 754 (28674); Thm 4.8.4.6, p. 737 (28032); SAG Def 6.2.2.1, p. 490 (SAG line 17835) |
| 1.3 | HA Def 7.2.2.10, p. 1240 (47511); Prop 7.1.1.13, p. 1202 (46134, parts (1)–(4) are the four claims); Prop 7.2.2.13, p. 1240 (47519); Thm 7.2.2.15, pp. 1240–1241 (47532); Prop 1.4.4.11, p. 160 (6013); Prop 7.2.1.19, p. 1236 (47387); Rem 7.2.2.12 (47516) |
| 2.2 | SAG Def 6.2.2.1; Rem 6.2.2.5 and 6.2.2.7, p. 491 (17859, 17867); §6.2.6 and Notation 6.2.6.1, pp. 496–497 (18050, 18068); GR-I §§1.1.3–1.1.4, printed pp. 144–145 (GR-I lines 7354, 7365) |
| 2.4 | SAG Rem 6.2.2.2, p. 491 (17845: the Kan-extension equivalence); GR-I §1.2, pp. 145–146 (7379) |
| 3.2 | SAG Thm D.6.3.1, Cor D.6.3.3–4, pp. 2177–2178 (79502, 79518, 79526); Prop D.6.1.3, D.6.2.3, pp. 2174, 2176 (79395, 79462); Def D.6.1.4 (79403); GR-I Thm 1.3.4, Cor 1.3.5, pp. 146–147 (7446, 7452); HTT Lemma 6.5.2.9, PDF p. 687 (HTT line 31182) |
| 4.2 | SAG Prop 6.3.4.1, p. 505 (18368); Cor 6.3.4.3, p. 507 (18458); GR-I Prop 2.2.2, p. 153 (7740) |
| 5.1 | Stacks 06Z0 = Lemma 36.3.5 (Stacks line 145); SAG Prop 2.2.3.3, p. 202 (7269); Rem 6.2.2.5 |
| 5.3 | SAG Prop 6.2.4.1, p. 493 (17929); Cor 2.1.2.3, p. 193 (6951); Cor 2.2.6.2, p. 208 (7461); GR-I Prop 1.4.4, p. 149 (7572) |
| 5.4 | Stacks 08DZ = 36.4.5 (311), 08EU = 36.22.1 (2312), 08IB = 36.22.5 (2351), each for a qcqs morphism |
| 6.2 | SAG Rem 6.2.5.8, pp. 495–496 (18017); Prop 6.2.3.4, pp. 492–493 (17905); Prop 9.1.3.1, Cor 9.1.3.2, p. 733 (26667, 26690); Warning 6.2.5.9, p. 496 (18025); GR-I §1.5.1, p. 149, Prop 1.5.4, p. 150; Stacks 023Q = Descent 35.13.7 and 02JR = Morphisms 29.13.6 (read in the chapters fetched for this review) |
| 6.4 | SAG Prop 9.1.5.1, p. 736 (26798: stated for quasi-geometric stacks, both directions); HA Prop 7.2.4.11, p. 1265, and 7.2.4.17, p. 1268 (48432, 48556); Stacks 08E8 = 36.10.3 (1059, Noetherian) |
| 7.1 | HTT Def 6.1.2.7, PDF p. 559 (25224); Thm 6.1.0.6, p. 547 (24717); Prop 6.1.3.10, p. 566, and 6.1.3.19, p. 573 (25589, 25890) |
| 7.3 | GR-I Cor 1.3.8, p. 147 (7463) |
| 7.4 | GR-I Prop 2.4.3 and Lemma 2.4.5, p. 156 (7872, 7883); SAG Cor 10.4.6.8 and Warning 10.4.6.9, p. 930 (33959, 33965); HNR Thm C.1, p. 16 (HNR line 807); Stacks 06WG = 96.11.1, 06WT = 96.14.3 (no flatness hypothesis in the source); HA Thm 1.3.3.2, p. 97 (3703) |
| 8.3 | BZFN Lemma 3.20, p. 23; Prop 3.21, Cor 3.23, p. 24; Prop 3.24, p. 25 (BZFN lines 1149, 1189, 1209, 1216); §3.1.2, pp. 19–20; Stacks 0FXR, 0FXS, 0FXT = Morphisms 29.12.1–29.12.3; 0BQR = 36.16.1 (1897: `n ≥ 0`, matching the sign of the generators `L_i^{⊗−n}`) |

Outside the sample I also verified the locators of 8.5 and 8.6 (HR-perf Introduction, HR-perf line
29; HNR Thm 1.1, p. 1, and the definition of poorly stabilized, p. 9, HNR lines 45, 437; HA Prop
1.4.4.1(3), p. 154; HA Rem 7.1.1.16, p. 1206), BZFN Def 3.1–3.2 and Prop 3.9 (pp. 17, 20), and SAG
Def 2.9.1.1 and Rem 2.9.1.2 (p. 277). The author flagged no locator as unverified. All nine cited
works are in `sources.toml`; fetching the three further Stacks chapters left the manifest unchanged
(the service kept the `Stacks` entry).

**README shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read
the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References.
34 subsections; Checks per subsection, counted: 1.1–1.5: 4, 4, 4, 5, 4; 2.1–2.5: 3, 4, 4, 3, 5;
3.1–3.4: 5, 7, 3, 4; 4.1–4.2: 4, 4; 5.1–5.4: 3, 3, 4, 3; 6.1–6.4: 3, 5, 4, 3; 7.1–7.4: 6, 5, 3, 4;
8.1–8.6: 3, 4, 5, 7, 5, 5. Every subsection has a `*Needs:*` line, and each layer's Dependencies
line contains the union of them (checked item by item for Layers 1, 3, 6, 7, 8). No LaTeX
delimiters, no process words, dates, pull-request numbers, HTML anchors or machine paths (grep).
The layer order is forced by the dependency lines: 3 needs `QCoh` (2.3), 5.3 needs the gluing of
3.4, 5.4 needs 4.2, 6.2 needs 3.3, 3.4 and 5.3, 7 needs 6, 8 needs 7.4.

**Adversarial pass.** One row per statement; the values are the ones I computed.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Lean `not_preservesCoproducts_trivial` (8.6) | Γ = ℤ/2, k = 𝔽₂; Γ = 1; Γ = ℤ; k = ℚ; arbitrary morphism universe w; J finite | ℤ/2: `ρ(g) − 1 = 0`, norm `= 2 = 0`, so `Hⁱ = 𝔽₂` for all i, `Hom(k, ⊕ k[i]) = ∏ 𝔽₂ ≠ ⊕ 𝔽₂`. Γ = 1: `p ∣ 1` false, hypothesis fails. Γ = ℤ: `Nat.card = 0`, excluded by `Finite`. ℚ: `CharP ℚ p` forces p = 0, `0 ∤ |Γ|`. Any w: `J = ULift ℕ` exists, and the hypothesis is non-vacuous at w = u. | true; `Fact p.Prime` redundant (R04) |
| 8.6, coproduct in `D(Rep k Γ)` | `P = ⊕ V[i]` | degree −i term is V alone, so termwise sum = termwise product; `Hom(k, P) = ∏_i Extⁱ(k, V)` | sound |
| 8.5 witness | Γ = S₃, k = 𝔽₃ | `H¹ = Hom(S₃, 𝔽₃) = 0`; `H² = H²(C₃)^{C₂}`, C₂ acts by −1 on the degree-2 generator: 0; `Coind` from C₃ has dimension `[S₃ : C₃] = 2` and `Hⁱ = 𝔽₃` for all i | sound; trivial coefficients would not serve, the README says so |
| 1.2 base change | `ℤ → 𝔽_p` twice, `N = 𝔽_p` | derived: both sides `𝔽_p ⊗ᴸ 𝔽_p`, `π₁ = Tor₁^ℤ(𝔽_p, 𝔽_p) = 𝔽_p`; ordinary pushout: right side `𝔽_p`, `π₁ = 0` | sound, the Check discriminates |
| 1.2 products, zero ring | `A × B`, `A = 0` | idempotents `(1,0)`, `(0,1)` split modules; `Mod_0 = 0` | sound |
| 1.3 flatness | `ℤ → ℤ[1/p] × ℤ_p`; `ℤ → ℚ`; `𝔽_p → 𝔽_p ⊗ᴸ_ℤ 𝔽_p` | first: flat factors, `(p)` under `pℤ_p`, other primes under `ℤ[1/p]`: faithfully flat. second: `ℚ ⊗ ℤ/p = 0`. third: `π₁` source 0, target `𝔽_p`, so `π₁A ⊗ π₀M → π₁M` not onto | sound |
| 1.3 t-structure | `A = 𝔽_p ⊗ᴸ 𝔽_p` | heart `ModuleCat (π₀A) = ModuleCat 𝔽_p`, unit not in it (`π₁ ≠ 0`) | sound; HA 7.1.1.13 (1)–(4) |
| 1.1 θ not an equivalence | free object on `ℤ[0]` | `Sym² = ℤ_{hΣ₂}`, `π₁ = H₁(Σ₂; ℤ) = ℤ/2 ≠ 0`; `θ(ℤ[x])` discrete | sound; colimit claim R03 |
| 2.2 `QCoh` as a limit | X = ∅; `X = Bℤ/2 × Spec 𝔽₂` | empty limit = terminal category (a zero category); `π₀ Map(O, O[1]) = H¹(ℤ/2; 𝔽₂) = 𝔽₂`, every evaluation in `π₋₁A = 0` | sound; excludes the limit of homotopy categories |
| 2.4 `QCoh(u_!X) ≃ QCoh(X)` | `X = Spec R`; fibre product `Spec 𝔽_p ×_{Spec ℤ} Spec 𝔽_p`; restriction `ι^*` | `u_! Spec R = Spec u(R)`; `ι_!` of the classical fibre product is `Spec 𝔽_p`, not `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `ι^* Spec(𝔽_p ⊗ᴸ 𝔽_p) = Spec 𝔽_p` since `Map(B, ιR) = Hom(π₀B, R)` | sound; the wrong direction (restriction) is excluded |
| 3.1 covers | empty family; `ℤ → 𝔽_p × ℤ[1/p]` | `A → 0` faithfully flat iff `A = 0`; a nonzero 𝔽_p-algebra factor is not ℤ-flat, and `𝔽_p ⊗ ∏R_i = 0` otherwise | sound |
| 3.2 hyperdescent | identity; `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → 𝔽_p`; truncation step | constant nerve; fibre `ℤ[1/6][−1]`, `I^{⊗2} → ℤ` in `Ext²_ℤ = 0`, `Hom(ℤ[1/2], ℤ) = 0` so no retraction: index 2; ℚ killed by `⊗ 𝔽_p`; values of `τ_{≤n} Mod^cn` have n-truncated mapping spaces, so cores of functor categories are (n+1)-truncated | sound |
| 3.2 affines are sheaves | `𝔸¹` on `ℤ → ℤ[1/2] × ℤ[1/3]` and on `ℤ → 𝔽_p × ℤ[1/p]` | equalizer `ℤ[1/2] ∩ ℤ[1/3] = ℤ`; second: mixed tensor factors vanish, equalizer everything, contains `(1, 0)` | sound |
| 4.2 pushforward | `Spec R[t] → Spec R`; classical non-flat `Spec 𝔽_p → Spec ℤ` | `f_*O = R[t]`, free of infinite rank; pointwise value `𝔽_p` against `𝔽_p ⊗ᴸ 𝔽_p` | sound; flatness is in the classical statement |
| 5.1, 5.3 | `ℙ¹_k`, `O(−2)`; `⨿_ℕ Spec ℤ`; ∅ | cokernel of `k[t] ⊕ k[t⁻¹] → k[t, t⁻¹]`, `(a, b) ↦ a − t⁻²b`: image misses exactly `t⁻¹`, dimension 1 = `H¹(ℙ¹, O(−2))`; `∏_ℕ D(ℤ)`; `h_∅ = Spec 0`, `QCoh = 0` | sound |
| 5.4 | `ℙ¹ → Spec k`, `O(−2)`; shift convention | `f_* O(−2)` has k in cohomological degree 1 = `k[−1]` under the Conventions (`M[1]` in degree −1) | sound |
| 6.2 t-structure | `Spec ℤ`, `𝔽_p`; `BG_m`; plane with doubled origin | `𝔽_p` coconnective, pullback to `Spec 𝔽_p` has `π₁ ≠ 0`; heart = ℤ-graded groups; `U ∩ U′ = 𝔸² ∖ 0` quasi-affine not affine, so the quasi-affine clause is needed there | sound; SAG 9.1.3.2 covers the quasi-affine diagonal |
| 6.4 almost perfect | `k` over `k[ε]/(ε²)`; `⊕_ℕ ℤ`; criterion without a lower bound | `Tor_i(k, k) = k` for all i; `π₀` not finitely generated; for the criterion: `colim_k τ_{≤−k}M = 0`, so `M → τ_{≤−k}M` is null for some k and M is a retract of `τ_{≥1−k}M` — the stated criterion forces bounded below | sound |
| 7.1 group prestacks | `Γ = ℤ/2` at `ℤ × ℤ`; `O(G) = ℤ × 𝔽_ℓ`; trivial group over `Spec 𝔽₂` | constant Γ: 2 points; `Spec(ℤ × ℤ)`: 4 (one per idempotent of `ℤ²`); points = idempotents e with `ℓe = 0`, closed under `e + e′ − 2ee′`, not flat (ℓ-torsion); `Hom(𝔽₂, ℤ) = ∅` | sound |
| 7.3 | Γ = ℤ trivial on `Spec C`; d = 0; `σ(x) = 2x` | `H¹(ℤ; C) = C`; `D(C)`; `id(x) = x ≠ 2x` | sound; agrees with the supplier's Checks |
| 7.4 | G trivial; `ℤ/p` over `𝔽_p`; `G_a` over `𝔽_p` | bar construction constant, (a) is 5.3; `Extⁱ = 𝔽_p`; unbounded comparison not claimed (SAG Warning 10.4.6.9) | sound; (d) is bounded-below only |
| 8.2 perfect | `⨿_ℕ Spec ℤ` as a scheme and as a coproduct of prestacks | scheme: fibre of the diagonal is `Spec(Re)`; `Hom(O, ⊕ O_i) = ∏ ℤ ≠ ⊕ ℤ`. Prestack: fibre over (0, 1) is ∅, not affine | sound |
| 8.3 permanence | `A = k[ε]/(ε²)`, diagonal; doubled line | `Ω¹_{A/k} = A dε/(2ε dε)`: `k·dε` if `char ≠ 2`, `A·dε` if `char = 2`, nonzero both ways, so the diagonal is not flat; `{L_1, L_{−1}}` ample family on a non-separated scheme (Stacks 0FXT) | sound |
| 8.4 and its gaps | twist of `ℙ¹_ℚ` by `ℚ(i)`; `K(ℤ, 2) × Spec ℚ` | invariants of conjugation ∘ `diag(1, −1)` on `ℚ(i)²`: `ℚe₁ ⊕ ℚ·ie₂`; `H²(K(ℤ,2); ℚ) = ℚ` while `Ext²` in the heart is 0 | sound; the gaps are what the route lacks |
| Conventions: indexing | `∏_{i≥0} ℤ[−i]`, `⊕ ℤ[i]` | first: 0-truncated, `π_{−i} = ℤ` for all i, not bounded below; second: connective, in no `QCoh_{≤n}` | sound |
| Conventions: universes | K not u-small | `π₀ Map(C, ℚ/ℤ) = ∏_K ℚ/ℤ` not u-small | sound |

**Duplication audit.** By object: the coherent functor `A ↦ Mod_A`, prestacks and `QCoh`, flat
hyperdescent, affine pushforward on prestacks, `Dqc` of a non-qcqs scheme, the t-structure on
`QCoh`, group prestacks, perfect stacks. `roadmaps grep` over main and the open heads for "perfect
stack", "flat hyperdescent", "Ind(Perf", "geometric stack", "QCoh(X) = lim", "quasi-coherent sheaves
on prestack", "Ben-Zvi": the only other statements of these objects are the three imports named in
Scope and ownership (read, above) and AnalyticStacks §1.1, a consumer later in the order. No
declaration of `Suggested.lean` has a fully qualified name used elsewhere. `scratch/overlaps.md`
lists no pull request changing this roadmap, no dropped id and no second copy; I confirmed that
main has no folder of this name and that the revision of EnhancedDerivedSheaves in an open pull
request keeps every heading of main (it adds two).

Overlap check: read EnhancedDerivedSheaves (main and its two open revisions), SchemeAndStackFoundations (main), AlgebraicModuliForArithmeticGeometry (main), HypercompletenessAndCoherence and the InfinityCategoryTheory family (open), AnalyticStacks (open); shared objects and owners: the module ∞-category of one algebra and of one animated ring — EnhancedDerivedSheaves (E5:abstract.2, E5:animation.4), the coherent functor in the ring — this roadmap (1.2); `Dqc` of a qcqs scheme — EnhancedDerivedSheaves (E1.8), of an arbitrary scheme — this roadmap (5.2); abelian quasi-coherent modules on stacks and their fpqc descent — SchemeAndStackFoundations (§§1.1, 1.22) and AlgebraicModuliForArithmeticGeometry, here only as hearts; `R ↦ Mod_R(D(ℤ))` extended to !-sheaves — AnalyticStacks, a consumer of 2.2; the sheaf criteria and ∞-topos statements — the InfinityCategoryTheory family, cited.

**Copyright and arrangement.** Compared with the sources at their locators: the perfect-module
definition (HA line 48274), the flatness convention (HA line 47511), the flat hypercover definition
(SAG line 79403), the almost-perfect criterion (SAG line 26798), the perfect-stack definition (BZFN
line 834), the compactness criterion in the README and in the Lean docstring (HA line 5813), the
ample-family definition (Stacks, Morphisms, tag 0FXR), the route of 7.4(d) (GR-I line 7883), the
definition of poorly stabilized (HNR line 437), the non-tame sentence (HR-perf line 29), the
doubled-line Check of 8.3 (Stacks tag 0FXT), the proof plan of 3.2 (SAG lines 79502–79530). Shared
runs are the formulas and standard names only; the longest shared run of ordinary words is 6 ("the
structure sheaf is perfect", HR-perf line 29, in a twelve-word statement). The arrangement is not
SAG's: Layer 1 is HA §§4.5, 7.1–7.2; Layer 3 joins SAG §6.2.3 with Appendix D.6; Layer 4 (SAG
§6.3.4) precedes Layer 5 (SAG §6.2.4); Layer 6 joins SAG §§6.2.5, 6.2.6, 9.1.3 and 9.1.5; Layers 7
and 8 have no counterpart in SAG Chapter 6 (GR-I, BZFN, HNR). No table, figure or list of examples
is taken over.

Source independence: 12 passages compared with 7 sources, none shared beyond formulas and standard names; largest share SAG, 68 of about 206 locators; contents compared with SAG (Chapter 6, §§6.2–6.3, Chapter 9, §9.1, Appendix D.6): independent.

## Not verifiable

- The proof routes were read for the inputs they name and for the generality of each step, not
  re-proved. In particular the transfer of HA §7.2 and SAG Appendix D.6, stated there for
  `E∞`-rings in spectra, to commutative algebras of `D(ℤ)_{≥0}` (1.3, 3.2) rests on the route the
  README gives, since no supplier states the comparison of `Mod_A(D(ℤ))` with module spectra; the
  README says so in "Not part of this roadmap".
- 7.4(d) for a flat affine G that is not of finite presentation: the existence of a flat affine
  atlas from "quasi-compact with affine diagonal" was not checked beyond the case X affine, where
  the atlas is X itself.
- Tau Ceti declarations were checked by file and line in the pinned sources, not by `#check`
  (their object files were not built).

## Source issues

- **Misprint** in HA at Theorem 7.2.2.15, printed pp. 1240–1241: the source says the ring is R and then speaks of left A-modules and of tensoring over A; it should be R throughout; affects nothing.
- **Misprint** in HA at Proposition 7.2.1.19, printed p. 1236: the source says the ring is R and the modules are over A; it should be modules over R; affects nothing.
- **Misprint** in SAG at the proof of Proposition 9.1.5.1, printed p. 737: the source repeats the opening words of a sentence choosing a faithfully flat map; it should have them once; affects nothing.

## For the human reviewers

- **Licence.** `SAG` (68 of about 206 locators) and `HA` are unpublished book manuscripts read from the author's page (`sources.toml`, `licence_class = "author-page"`); `GR-I` is the published AMS volume as posted by its authors.
- **Scope.** `GR-I` works over a field of characteristic zero; the roadmap cites it for statements it proves over ℤ and says so (README, References, the GR-I entry).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5ba936e38b42924ec96c7e7a564bbc82eb2c77f7", "job": "REV-PKG-QuasicoherentSheavesOnPrestacks", "model": "fable", "worker": "chris-x82"} -->
