# PORT-LocalFieldsRamificationPartII

## Result

- Branch: `roadmap/local-fields-ramification-part-ii`, created from main at `42813dd`.
- Head commit: `68e1c85a` (`LocalFieldsRamificationPartII: roadmap (README, Suggested.lean, metadata)`).
  It adds only `TauCetiRoadmap/LocalFieldsRamificationPartII/{README.md,Suggested.lean,metadata.toml}`.
- Build: `lake build TauCetiRoadmap.LocalFieldsRamificationPartII.Suggested` ends with the line
  `Build completed successfully (18274 jobs).`, with 9 warnings, all of them
  ``declaration uses `sorry` ``, one per theorem. There are no errors and no other warnings.
- Gate, run after the commit:
  `gate LocalFieldsRamificationPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), exact output:
  `depcheck: 210 roadmaps, 1910 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the ported README finds no cross-roadmap citation and no Lean name that is
  missing everywhere. Separately, the Mathlib names were checked by elaboration and the Tau Ceti
  names by grep at the pin, with their namespaces (see "Checks run").

## Draft pull request body

Extend the local-field ramification library from nonarchimedean local fields to fields with an
arbitrary Krull valuation: any height, any value group, no completeness or henselian hypothesis,
imperfect residue fields allowed. The roadmap builds the henselization of a valued field on Tau
Ceti's henselization of pairs. It builds the ramification tower `Kʰ ⊆ Kᵘ ⊆ Kᵗ ⊆ Kˢ` with
decomposition, inertia and wild inertia, and the six extension classes (strictly unramified,
unramified, tame, henselian, totally ramified, purely wild) with their tower laws. It also covers
tame and separably tame fields, composition of valuations, finite height and the algebraic
Abhyankar inequality. It ends in Temkin's tameness theorem: a valued field with no nontrivial
finite extension of degree a power of its residue characteristic exponent is tame. A separable
export follows for imperfect fields. On the way it proves the Kuhlmann–Pank–Roquette splitting
`Kᵗ ⊗_K K_w ≅ Kᵃ` over henselian fields and in height one, and the profinite input it needs
(sections of surjections with pro-`p` kernel onto groups of `p`-cohomological dimension at most
one). The other input it needs is Krasner's lemma over a henselian, not necessarily complete,
base. Finite presentation of flat finite-type algebras and modules over Prüfer domains feeds the
étale criterion for unramified extensions. These are the valuation-theoretic inputs that
prime-to-`p` alteration and tame distillation arguments, and the roadmaps that import valued
henselization, decompletion and the Abhyankar inequality, consume. Over local fields and complete
discretely valued fields the roadmap proves agreement with the classes of LocalFieldsRamification
and RamificationOfCompleteDiscretelyValuedFields rather than restating them.

AI assistance: Claude (Opus 5.5) performed the port, the supplier, ownership and duplication
checks, the mathematical self-review and the Lean signature validation.

## Roadmaps this one depends on that are still pull requests

- ClassicalAdicEtaleCohomology (§5.1, strict localization of a valuation ring; §5.3, the tame
  quotient of a henselian field with separably closed residue field). It is a new roadmap, earlier
  in the merge order (line 74; this roadmap is line 391).

The other suppliers are on main: SchemeAndStackFoundations, ProfiniteCohomology and
RamificationOfCompleteDiscretelyValuedFields (active), and LocalFieldsRamification and
ProfiniteProPGroups (completed). No cited id is defined only by an open revision. The open draft
revision of SchemeAndStackFoundations still has §§0.12, 0.13 and 1.1 at its head, so it drops no
id cited here.

The README contains three supplier gap contracts, carried over unchanged from the accepted
package. The review's acceptance is conditional on the first one.

- `gap:source-side-fpqc-descent` (SchemeAndStackFoundations, Layer 1: EGA IV 17.7.5(iv)).
- `gap:source-side-etale-descent` (SchemeAndStackFoundations, Layer 1: EGA IV 17.7.7).
- `gap:char-p-galois-h2-vanishing` (ProfiniteCohomology, Layer 9: `cd_p(G_F) ≤ 1` in
  characteristic `p`). ProfiniteCohomologyPartII asks ProfiniteCohomology for the same contract.

## What moved from the Lean to the README

Nothing moved. The package's `Suggested.lean` already met the acceptance-test form. It has 7
definitions with real bodies, each needed to state a headline, and 9 headline theorems. It has no
sorry'd data, no `set_option`, no `lemma`, no examples and no padding. The headlines that cannot be
stated at the pins are named in its docstring. I changed only the following.

- **Header.** Added `module` before `import Mathlib`, the form ten Suggested files on main use.
  Without it Lake prints a module-system notice for `import Mathlib`, a warning that is not a
  `sorry`. The gate accepts the header (`imports=0`, `no-import-mathlib=0`), and with it `sorry`
  is the only warning. The import lines are unchanged: `import Mathlib` and the two Tau Ceti
  modules the statements use (`TauCeti.cohomologicalDimensionAt`, `TauCeti.IsProP`). Both modules
  exist at the pin.
- **Docstring of `isSeparablyTameField_of_isSeparablyPClosed`.** It said "Let `P` be a set of
  primes", but the signature takes `P : Set ℕ`, as the README does, and at exponent `1` it is a
  set of natural numbers that matters. It now says "a set of natural numbers" and records the
  exponent-`1` case.
- **Module docstring.** "residue characteristic" became "residue characteristic exponent", to
  match the signature. The not-statable item now names Tau Ceti's `TauCeti.wildInertiaSubgroup`
  and says why it does not cover the case: it assumes a nonarchimedean local field.

## Supplier replacements and duplication removals

Supplier repairs in the README:

1. **ProfiniteCohomology, Layer 11.** The contract named the legacy ids `cd_p_le_iff_finite_pPrimary`
   and `cd_p_le_of_isClosed`. That roadmap's own README maps them to the Tau Ceti declarations
   `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ` (with `p ≠ 0`) and
   `TauCeti.cohomologicalDimensionAt_le_of_isClosed`. The contract, the Scope bullet and the §3.1
   *Needs:* line now cite these pinned names. They are added to the Tau Ceti contract with their
   files and hypotheses. The §3.1 *Needs:* named the finite-coefficient test, which the §3.1 route
   does not use; it now names the invariant only.
2. **§3.5 Check.** "`cd_p Ẑ = 1` (ProfiniteCohomology §11.6)" now cites the pinned
   `TauCeti.zHat.cohomologicalDimensionAt_eq_one` (`ZHat/CohomologicalDimension.lean`, for every
   prime `p`).
3. **LocalFieldsRamification (completed), Layers 2–4.** The contract used that roadmap's
   unprefixed names `IsUnramified K L`, `IsTamelyRamified`, `IsWildlyRamified` and `wildInertia`.
   The completed work is at the pinned Tau Ceti, so it now cites `TauCeti.IsUnramified`,
   `TauCeti.ramificationIndex`, `TauCeti.inertiaDegree`,
   `TauCeti.ramificationIndex_mul_inertiaDegree`, `TauCeti.IsTotallyRamified`,
   `TauCeti.isTotallyRamified_iff_inertiaDegree_eq_one`, `TauCeti.IsTamelyRamified`,
   `TauCeti.maximalUnramifiedExtension`, `TauCeti.maximalTameExtension`, `TauCeti.inertiaSubgroup`,
   `TauCeti.wildInertiaSubgroup`, `TauCeti.inertiaTameCharacter` and
   `TauCeti.IsArithFrobeniusLift`. RamificationOfCompleteDiscretelyValuedFields cites the same
   roadmap the same way. Each name has its file under `TauCeti/NumberTheory/LocalField/` in a new
   Tau Ceti contract bullet. The §2.9 statement is rewritten on these declarations:
   - unramified here ⇔ `TauCeti.IsUnramified K L`;
   - totally ramified here ⇔ `TauCeti.IsTotallyRamified K L`;
   - tame here ⇔ `TauCeti.IsTamelyRamified K L`;
   - `Kᵘ` and `Kᵗ` are `TauCeti.maximalUnramifiedExtension` and `TauCeti.maximalTameExtension` in
     `AlgebraicClosure K`;
   - `I` and `W` are `TauCeti.inertiaSubgroup` and `TauCeti.wildInertiaSubgroup`;
   - the pairing of ClassicalAdicEtaleCohomology §5.3 (ii) restricts to
     `TauCeti.inertiaTameCharacter`.

   The previous wording ("`W` is `wildInertia`") named no declaration that exists at the pin.
4. **Prolongations in §1.1.** The pinned Tau Ceti proves two inputs of §1.1:
   `ValuationSubring.eq_of_le_of_comap_eq` (prolongations to an algebraic extension are
   incomparable) and `ValuationSubring.exists_valuation_eq_one_and_lt_one` (finitely many are
   separated by elements of the normalization), in `TauCeti/RingTheory/Valuation/AlgebraicExtension.lean`.
   The package never cited them. They are now in the Tau Ceti contract, the Scope list, the §1.1
   route and *Needs:*, and the Layer 1 Dependencies. §1.1 itself (semilocal normalization,
   prolongations ↔ maximal ideals, Prüfer localizations) is not at the pin and stays a target.
5. **Mathlib `Nat.factoredNumbers`.** This is Mathlib's notion of a `P`-number for a finite set
   (`Mathlib/NumberTheory/SmoothNumbers.lean:45`). §0.1 gains an API bullet identifying the two for
   finite sets, and the Mathlib contract gains its entry. `IsPNumber` stays because `P` must be
   allowed to be infinite: the set of all primes, or `{q | q.Prime ∧ q = ringExpChar …}` read as a
   `Set ℕ`.
6. **Strict henselization in the Scope bullet.** The bare backticked `existsUnique_lift`, `map` and
   `fromHenselization` are now fully qualified `TauCeti.StrictHenselization.*` names.

Duplication sweep, by object, against main and the open roadmap heads (`roadmaps grep` and the
listed checkouts):

- Raynaud–Gruson / Stacks 053E (flat ⇒ finitely presented): no owner. AdicSpacesPartIII (main)
  uses Raynaud–Gruson flattening, a different statement.
- Prüfer domains: no owner.
- Abhyankar inequality: only the consumers AdicCoefficientsAndComparisonsPartII and
  QuadraticFormInvariantsPartII.
- Kuhlmann–Pank–Roquette, purely wild extensions: no owner. QuasiregularMaps and
  SobolevMapsBetweenManifolds match only on the name "Pank".
- Tame field, separably tame, defectless: only uses in EtaleCohomologyFoundations, K2SymbolsBrauer
  and others with defectless hypotheses, none an owner.
- Krasner's lemma over a henselian base: no owner. FourierDeligneTransform §2.7 compares the
  Galois groups of a henselian DVR and its completion, a different statement. No roadmap restates
  Mathlib's complete-base lemma as owned.
- Section theorem for pro-`p` kernels: no owner. ProfiniteProPGroups owns `proPKernel`, a
  different object. DiamondEtaleCohomology C8.35 removes a pro-`p` kernel from `cd`, again a
  different statement.
- Valued henselization and decompletion: only the consumers.
- Composite valuations: only examples in AdicEtaleGeometry and ArcTopologyAndDescent.

Pinned Tau Ceti `RingTheory/Valuation/` was read file by file (AlgebraicExtension,
LinearIndependent, Amalgamation, RamificationGroup, ValuationSubring, Approximation, RootMonic,
Sum, RestrictToConvex, NontrivialComap, Center, Polynomial). None states a target of this roadmap.
The two AlgebraicExtension lemmas are inputs, now cited (item 4). `LinearIndependent.lean` gives
the `ef ≤ n` and prolongation-count bounds, not the algebraic-independence statement of §5.3.
`TauCeti/RingTheory/Henselization/` has quotient base change (`BaseChange.lean`, Stacks 0DYE) but
not integral base change or coprime products. The SchemeAndStackFoundations §0.13 contract
therefore stands.

**Ownership against open work.** The tools checked against main, the board packages and the open
roadmap heads. ClassicalAdicEtaleCohomology is not among the listed checkouts; I read its §§5.1
and 5.3 at its head through `roadmaps show`. This roadmap is the owner of every object it states.
Each object is valuation theory beyond local fields that no roadmap on main or at an open head
plans, and the two open roadmaps that plan around these objects (AdicCoefficientsAndComparisonsPartII,
QuadraticFormInvariantsPartII) import them from here by the `GF.k` ids. Those ids are kept, with
the mapping table under "How to read the build". No declaration of `Suggested.lean` has the fully
qualified name of a declaration in another roadmap.

No removals were needed, so "Scope and ownership" gains no deferral entry for a deleted target. It
gains one Library entry, for the prolongation lemmas, and the existing entries now name the pinned
Tau Ceti declarations.

## Fixes from the upstream-reviewer reread

1. **Conventions, maximal extensions.** "it is neither canonical nor normal" is false as stated:
   `S = ∅` gives `Kᵃ`, and over a henselian field `S = {tame}` gives `Kᵗ`, both normal. It now
   reads "in general neither unique nor normal over `K` (§3.2)". §3.2's Check gives the
   non-unique, non-normal maximal purely wild extensions of `ℚ_p`.
2. **§1.5, Raynaud–Gruson sentence.** "the case of a domain of the theorem that a flat finite-type
   algebra over a domain is finitely presented" was garbled. It now says that the algebra statement
   is the Prüfer case of Raynaud–Gruson's theorem over an arbitrary domain, and that this roadmap
   states and proves the Prüfer case only, by the Stacks 053E route.
3. **Summary.** It said the pro-`p`-kernel section theorem is one "that no library has", and that
   `cd_p(G_F) ≤ 1` "is ProfiniteCohomology's". Library claims belong in Scope, and ProfiniteCohomology
   does not yet state the bound (it is the gap contract). It now says that the section theorem is
   one profinite input and the bound "belongs to ProfiniteCohomology", matching the Scope bullet.
4. **Title.** "part ii:" became "part II —", the Roman numeral as upstream Part II titles write it.
5. **§2.4 Check, `X³ − X − 2` at `2`.** The claim that the decomposition-group cubic field is not
   in the Galois tame part had no reason given. It now lists the Galois subextensions of `N`: `ℚ`,
   `ℚ(√−26)` (ramified at `2`, since `disc = −104 = −4·26` and `−26 ≡ 2 mod 4`) and `N`. So the
   Galois tame part meets `N` in `ℚ`.
6. **§3.5 Check, `p = 1`.** "the only admissible `E` is `K`" now gives its reason: `E ⊗_K Kᵃ` has
   `Kᵃ`-dimension `[E : K]`, and linear disjointness from `Kᵃ` forces it to be `1`.
7. **Checks that named this roadmap's declarations.** Five Checks were reworded into prose ("is a
   tame Galois extension", "the Galois tame part", "Krasner's lemma over a henselian base").
8. **Downstream consumers.** The section now names AdicCoefficientsAndComparisonsPartII and
   QuadraticFormInvariantsPartII and the sections each one consumes, read at their heads.
   Depcheck was re-run after this edit: 0 problems.
9. **Wording.** The §1.3 API bullet "not a new construction" became "no second henselization is
   constructed". "at the pinned Tau Ceti" was removed from the §3.1 route and a §3.1 Check; such
   wording now appears in Scope only. The "Notes on the sources" became a subsection of
   References. Long lines were rewrapped without breaking any code span (checked: every line has
   an even number of backticks).

## Checks run

- **`#check @name` comparison.** One elaboration, with temporary `#check @` lines appended to
  `TauCetiRoadmap/LocalFieldsRamificationPartII/Suggested.lean` and removed before the final build,
  since the only Lean command allowed is the module build. It covered all 16 own declarations and
  61 Mathlib names cited by the README. All resolved; the build exited 0. Each elaborated type was
  compared with its README statement and they agree:
  - the Prüfer hypothesis is `∀ (P : Ideal A) [P.IsMaximal], ValuationRing (Localization P.primeCompl)`,
    with `[IsDomain A]`;
  - the module theorem keeps `[IsScalarTower A B M] [Module.Finite B M] [Module.Flat A M]`;
  - the section theorem keeps `[Fact p.Prime]` and, on both groups, `IsTopologicalGroup`,
    `CompactSpace` and `TotallyDisconnectedSpace`, with `TauCeti.IsProP p ↥f.ker`;
  - KPR keeps `[HenselianLocalRing ↥V]`;
  - Krasner keeps `[HenselianLocalRing ↥NormedField.valuation.valuationSubring]` and
    `[Algebra.IsAlgebraic K L]`;
  - Abhyankar keeps `[vK.HasExtension vL]`;
  - the height bound keeps `Algebra.trdeg K L = ↑n`.

  The file has no `variable` or `include`, so no binder could be dropped. Nothing changed after
  the comparison. In the section theorem the coefficient universe of
  `TauCeti.cohomologicalDimensionAt` is a free universe parameter. That is harmless:
  ProfiniteCohomology §11.2 proves the invariant independent of it.
- **Pinned names.** The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. Every Tau Ceti
  declaration the README names was grep-located in the pinned Tau Ceti sources with its enclosing
  namespace, including the profinite Sylow, embedding-problem, henselization,
  strict-henselization, convex-subgroup, coarsening, local-field and `zHat` names.
- **Sources.** No cached source text is available on this host. I did not reopen the papers. The
  locators are those verified line by line in the accepted review. Every mathematical statement I
  changed was recomputed (table below).

## Adversarial mathematics pass

Each row gives the statement, the instances tried, the values computed, the result and any change.
"Lean" marks a declaration of `Suggested.lean`.

| Statement | Instances | Computed values | Result / change |
|---|---|---|---|
| Conventions: value group, sign | `ℚ` 2-adic; `ℚ_p((t))` composite | `|2| = 1/2 ≤ 1` multiplicatively, `v(2) = 1` additively; `v(t) = (1,0)`, `v(p) = (0,1)`, `v(p⁻¹) = (0,−1) < 0` | consistent / none |
| Conventions: residue exponent | `ℚ` trivial, `𝔽_p`, `ℚ_p` | `ringExpChar ℚ = max 0 1 = 1`, `ringExpChar 𝔽_p = p`, residue of `ℚ_p` is `𝔽_p`, exponent `p` | pass / none |
| Conventions: height | field; DVR; composite on `ℚ_p((t))` | prime chains of length 0, 1, 2; heights 0, 1, 2 | pass / none |
| Conventions: total ramification | `𝔽_p(u^{1/p})((t))/𝔽_p(u)((t))` | `e = 1`, `f = p` purely inseparable: totally ramified here = T, `f = 1` convention = F | differs exactly as stated / none |
| Conventions: Frobenius witness | `ℚ_2(ζ_7)` | arithmetic `ζ ↦ ζ²`; geometric `ζ ↦ ζ⁴` since `2·4 = 8 ≡ 1 mod 7` | discriminates / none |
| Conventions: maximal extensions | `S = ∅`; `S = {tame}`, henselian; purely wild over `ℚ_p` | `Kᵃ` and `Kᵗ` are normal; a maximal purely wild extension of `ℚ_p` is not normal, else `G = W × H` contradicts the non-trivial action of `(ℤ/p)^×` on `ℤ/p` in `Gal(ℚ_p(ζ_p, p^{1/p})/ℚ_p)` | old "neither canonical nor normal" false / fixed |
| §0.1 `IsPNumber` (Lean) | `P = ∅, {3}, {2,3}`; `n = 0, 1, 6, 9` | `∅`: F,T,F,F; `{3}`: F,T,F,T; `{2,3}`: `6` = T; `0` = F for every `P` (positivity) | pass / none |
| §0.1 vs `Nat.factoredNumbers` | `s = ∅`, `{2,3}` | `factoredNumbers ∅ = {1}` = `∅`-numbers; `6 ∈ factoredNumbers {2,3}` | agrees on finite sets / API bullet added |
| §0.2 `P`-extensions, tower | `ℚ ⊂ ℚ(2^{1/3}) ⊂ ℚ(2^{1/3}, ζ_3)`, `P = {3}` | degrees 3, 2, 6; tower predicate F = T ∧ F; two cubic fields compose to degree 6 | pass / none |
| §0.2 descent Check | `ℚ(√2) ⊂ ℚ(√2,√3)` | `√6·1 = √2·√3` gives coordinate `√2`; `[E_0 : L_0] = 2`, while `[ℚ(√3,√6) : ℚ] = 4` | pass / none |
| §0.3 `IsPClosed`, `IsSeparablyPClosed` (Lean) | `𝔽_2` with `P = {2}, {3}, {1}`; `F = 𝔽_p(t)ˢ`, `P = {p}` | `𝔽_4`: degree 2 → F; `𝔽_8`: 3 → F; `{1}`: only degree 1 → T; `F` separable = T, full = F (`t^{1/p}`, degree `p`) | pass / none |
| §0.4 maximal `P`-extension, perfection | `𝔽_p(t)`, `P = {p}`; `P = ∅` | missing `t^{1/p}` has degree `p`; `K_{sP}(t^{1/p})` has degree `p`; `P = ∅` gives `K` | pass / none |
| §0.5 split towers | biquadratic; `S₃` cubic fields | `2·2 = 4` = compositum degree; `3·3 = 9 ≠ 6`, intersection `ℚ` | trivial intersection is not a splitting / none |
| §1.1 normalization | `ℤ_(7) ⊂ ℚ(√2)`; `ℤ_(3)`; trivial `V` | `3² = 9 ≡ 2 mod 7`: two maximal ideals `(3 ± √2)`; `2` not a square mod 3: one; trivial `V`: `B = L`, one prolongation | pass / Tau Ceti inputs cited |
| §1.1 prime versus all localizations | `x = (3 − √2)/(3 + √2)` | values `(1, −1)` at the two primes, inverse `(−1, 1)`: `x, x⁻¹ ∉ A`, each prime localization contains one | pass / none |
| §1.2 étale ⇒ valuation ring | `ℤ_(p) → ℤ_(p)[√p]_(√p)` | value group `½ℤ ≠ ℤ`; algebra finite, not étale | hypothesis needed / none |
| §1.3 valued henselization | `ℚ` `p`-adic | `Kʰ` algebraic over `ℚ`, countable; `ℚ_p` uncountable; `Γ = ℤ` and residue `𝔽_p` on both sides | completion ≠ henselization / none |
| §1.4 tensor decomposition | `ℚ(√2)` at 7; `𝔽_p(t^{1/p})/𝔽_p(t)` | `ℚ_7ʰ × ℚ_7ʰ`, dimension 2; a single field of degree `p` | pass / none |
| §1.5 homogenization | `R = ℤ`, `B = 𝔽₂` | `S = ℤ ⊕ ⊕_{d≥1} 𝔽₂T^d ≅ ℤ[T]/(2T)`; `S_(T) = 𝔽₂`, since `2 = 2T/T = 0` | pass / none |
| §1.5 graded finite presentation | `R = ∏_ℕ 𝔽₂`, `I = ⊕_ℕ 𝔽₂` | every `R_𝔭 = 𝔽₂`, so `R → ∏ R_{𝔭_j}` factors through `𝔽₂^m`, not injective; `I·X·R[X]` finitely generated ⇒ `I` finitely generated (read off `X`-coefficients) | hypothesis needed / none |
| §1.5 Prüfer (2 Lean theorems) | `A` a field; `A = 𝒪_{ℂ_p}`, `B = A/𝔪`; `M = A/𝔪`; `A = ∏𝔽₂` | field: Noetherian, f.p. = T; `A/𝔪` not flat, not f.p.; `M` cyclic, torsion, not f.p.; `∏𝔽₂` satisfies `hA` (localizations `𝔽₂`) but `A/I` is flat and not f.p. | `[IsDomain A]` genuinely needed / RG sentence fixed |
| §2.1 étale criterion | `ℚ_p(√p)/ℚ_p`; `𝔽_p((t))` | `(p) ⊊ (√p)`: not essentially étale, ramified; strict identity with residue `𝔽_p` | pass / none |
| §2.2 tower | trivial valuation; henselian `K`; `𝔽_p(t)` trivial | `D = G`, `I = W = 1`, `Kᵘ = Kᵗ = Kˢ`; `Fix_{Kᵃ}(1) = Kᵃ ≠ Kˢ` | `Kˢ` needed in fixed fields / none |
| §2.3 unramified | `𝔽_{p^r}((t))/𝔽_p((t))`; `ℚ_p(p^{1/ℓ})` | `e = 1`, `f = r`; strictly unramified iff `r = 1`; Eisenstein `e = ℓ` | pass / none |
| §2.4 tame, finite henselian | `[L : M]` prime to `p` with `I` having normal Sylow `W` | open `H ≤ I` of index prime to `p` contains a Sylow subgroup, hence `W`: `L·Kᵘ ⊆ Kᵗ`; purely inseparable `L`: `[L : M] = p` | pass / none |
| §2.4 `IsTameGaloisExtension` (Lean) | `ℚ_p(ζ_p)`, odd `p`; `ℚ_2(i)`; `ℚ_p(ζ_{p²})`; unramified degree `p` | inertia `p − 1, 2, p(p − 1), 1`; coprime to `p`: T, F, F, T; decomposition order `p` in the last | inertia, not decomposition / Checks in prose |
| §2.4 `galoisTamePart` (Lean) | `X³ − X − 2` at 2 | roots mod 2: `0` simple and `1` double; Newton step `a ≡ −2 mod 8`; quadratic factor discriminant `4 − 3a² ≡ −8 mod 32`, `v_2 = 3`; `disc = −104`; `D = W = C₂`; Galois subfields `ℚ`, `ℚ(√−26)` (ramified), `N` | Galois tame part ∩ `N = ℚ` ≠ `Kᵗ ∩ N` / reason added |
| §2.5 henselian extension | `ℚ/ℚ`; `ℚ(√2)` at 7; purely inseparable | prolongations 1, 2, 1; tensor factors 1, 2, 1 | pass / none |
| §2.6 totally ramified, purely wild | AS root `a^p − a = t⁻¹`; `ℓ`-radical over `ℚ_p` | `v(a) = −1/p`, `e = p`: purely wild; `e = ℓ` prime to `p`: totally ramified, not purely wild | pass / none |
| §2.7 `IsTameField`, `IsSeparablyTameField` (Lean) | trivial `𝔽_p(t)`; `ℚ_p`; residue characteristic 0 | inertia 1: separably tame T, perfect F; `ℚ_p(ζ_{p²})` inertia `p(p − 1)`: F; `Coprime n 1` always T | pass / none |
| §2.8 tower laws | `𝔽_{p^6}((t))` tower; `ℓ`-radical then `p`-radical | `f = 2, 3, 6` unramified throughout; `e = ℓ, p, ℓp`: tame F = T ∧ F | both directions / none |
| §2.9 local fields | inseparable `L/𝔽_q((t))` | `K(a^{1/p})`: `f = 1` (finite residue fields are perfect), `e = p`, so `p ∣ e`: not tame, not unramified, matching `TauCeti.IsTamelyRamified` | holds including inseparable `L` / restated on pinned names |
| §2.9 complete DVF | `K = 𝔽_p(s)((t))`, `y^p − y = s·t^{−p}` | `z = ty`: `z^p = t^p y + s = t^{p−1}z + s`; residue `𝔽_p(s^{1/p})`, `e = 1`, `f = p` | totally ramified here, not there / none |
| §2.10 perfection | `𝔽_p(t)` `t`-adic; AS extension | `Γ: ℤ → ℤ[1/p]`; AS stays degree `p` with `e = f = 1` (defect) | pass / none |
| §3.1 section theorem (Lean) | `S₃ → C₂`, `p = 3`; `C₄ → C₂`, `p = 2`; `Ẑ → ∏_{ℓ≠p} ℤ_ℓ`; trivial kernel | `cd₃ C₂ = 0`, transposition gives a section; `cd₂ C₂ = ∞`, every lift of the generator has order 4; kernel `ℤ_p`, `cd_p = 0`, source not pro-`p`; `f⁻¹` | pass; totally disconnected ⇒ T0 ⇒ Hausdorff group / none |
| §3.2 maximal extensions | `S = ∅`, `{tame}`, `{tame, purely wild}` | `Kᵃ`, `Kᵗ`, `K` | pass / none |
| §3.3 complements | `ℚ_3(√3)` and `ℚ_3(√−1)` | Kᵘ-dimension 2/2, bijective; `Kᵘ × Kᵘ`, kernel of dimension 1 (`−1` not a square mod 3) | pass / none |
| §3.4 splitting equivalences | tame `K`; `p = 1`; `S₃` at 2 | `K_w = K`; `C₂` has 3 conjugates in `S₃`, not normal | pass / none |
| §3.5 KPR (Lean) | henselian `p = 1`; separably closed imperfect `K`; trivial valuation | tame part `Kᵃ`, `E = K`; tame part `K`, `E = Kᵃ`; tame part `Kˢ`, `E = K^{perf}`, `K^{perf} ⊔ Kˢ = Kᵃ` | pass / `p = 1` reason added |
| §4.1 Krasner, henselian (Lean) | `ℚ` 7-adic, `L = ℚ(√2)`; `ℚ_pʰ` | `s ≡ 3`, `3² = 9 ≡ 2`; `‖2s‖ = 1`, `‖s − 3‖ ≤ 1/7`, `√2 ∉ ℚ`; over a henselian base the extended norm is unique, hence the spectral norm | non-henselian fails as required / none |
| §4.1 roots | `f = g = X² − 1` at 2; `f = X`, `g = X − 2`; `f = X² − 1/16`, `g = f + 2X` | `kras = 1`, threshold `∞`; threshold 1 = distance; `γ* = −2`, threshold `1/2 − 2 < 0`; `deg g ≠ n` gives `v(f − g) ≤ 0` | pass / none |
| §4.2–4.5 height one | `ℚ(√p)`; `ℚ(t)`, `√(1+t)`; `ℂ_p`; `ℚ_2` | degree `2 = [L : Kʰ]`; `1 + t` has a simple zero at `−1`; `ℂ_p` algebraically closed; `X² − 2` gives degree 2 | pass / none |
| §5.1 composite | `ℚ_p((t))` | `p⁻¹ ∈ ℚ_p[[t]]` with value `(0, −1)`, not in the composite; kernel `{0} × ℤ` | pass / none |
| §5.2 coarsening chain | composite on `ℚ_p((t))` | residue exponents 1, 1, `p`: monotone, `n = 2` | pass / none |
| §5.3 Abhyankar (Lean) | `x_i = 0`; repeated `x`; `𝔽_p(t)` `t`-adic and Gauss | `n = single i 1` gives `0 ∈ range`: excluded; `x_1 = x_2` gives `n = e_1 − e_2` with value `1`: excluded; `1 + 0 = 1`, `0 + 1 = 1` | pass / none |
| §5.3 height bound (Lean) | composite on `ℚ(t)`; trivial restriction; `n = 0` | `2 ≤ 1 + 1`; trivial restriction gives height ≤ 1; algebraic `L/K` gives equality; `∞ + n = ∞` | pass / none |
| §5.4–5.6 composition | `𝔽₄((t))/𝔽₂((t))`, `i = 0, 1`; `s^p = t` over `ℚ_p((t))` | four steps of degree 2, all unramified; coarse tame, residual identity, `Γ` quotient `ℤ/p`: not tame | final residue exponent needed / none |
| §6.1 `p`-closed residues | `ℚ_p`; `X^p − a` | `X^p − p` irreducible, degree `p`: not `{p}`-closed; for `a ∉ K^p`, `X^p − a` is irreducible, so `{p}`-closed ⇒ `p`-th roots ⇒ `Γ` `p`-divisible | pass / none |
| §6.2–6.3 induction, descent | `d = 2`, `i = 1`; `ℚ(t)`, `√t` | heights 1 and 1 are below 2; `L_0 ⊗ ℚ(t) = L_0(t)` has constant field `L_0` ⇒ degree `1 ≠ 2` | pass / none |
| §6.4 tameness (Lean) | `ℂ((t))`; `ℚ_p`; algebraically closed | `P = {q prime, q = 1} = ∅`, hypothesis T, conclusion T (char 0, coprime to 1); `ℚ_p` hypothesis F; all degrees 1 | pass / none |
| §6.5 separable export (Lean) | `𝔽_2(t)ˢ` trivial, `P = {2}`; `P = ∅`; `P = {1}` with residue `p` | `ringExpChar = 2 ∈ P`, separably tame T, tame F (`t^{1/2}`); `ringExpChar ∈ ∅` F; `p ∉ {1}`, nothing claimed | pass / docstring "set of primes" → "set of natural numbers" |

## Unresolved

- **The `gap:` contracts.** They stay as carried from the accepted package: acceptance is
  conditional on `source-side-fpqc-descent`, and `source-side-etale-descent` and
  `char-p-galois-h2-vanishing` are declared in the same way. None of SchemeAndStackFoundations
  Layer 1 or ProfiniteCohomology Layer 9 states these results on main today.
- **Generality of §1.5.** The Prüfer form is kept, as the review accepted. Raynaud–Gruson,
  Corollaire 3.4.7, covers an arbitrary domain, but its proof needs their flattening theory, and
  the source is uncertified (paywalled). No roadmap plans the general-domain theorem. A reviewer
  may ask for it as a separate target; this port does not add it.
- **Sources.** The locators were not re-verified against the source texts in this job; I relied
  on the accepted review's line-by-line checks.
- **Suspicious text.** None of the data I read (reports, other roadmaps, tool output) contained
  instructions addressed to me.


Pull request: #2258 (roadmap/local-fields-ramification-part-ii at 68e1c85)
