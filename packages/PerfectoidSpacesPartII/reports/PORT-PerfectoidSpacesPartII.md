# PORT-PerfectoidSpacesPartII

- Branch: `roadmap/perfectoid-spaces-part-ii` (from main at `45f58db`).
- Head commit: `d8879ce0` "PerfectoidSpacesPartII: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/PerfectoidSpacesPartII/README.md` (3031 lines),
  `TauCetiRoadmap/PerfectoidSpacesPartII/Suggested.lean` (692 lines),
  `TauCetiRoadmap/PerfectoidSpacesPartII/metadata.toml` (`topic = "math.AG"`, as on main). Nothing
  outside the folder was touched.

## Which package was ported

`packages/PerfectoidSpacesPartII/` on the board is still at the state that round 2 reviewed: 24
declarations, its own `IsPerfectoidTateRing` class, and `review.json` from round 2
(`needs_changes`, 7 blocking findings). The repairs of rounds 2–7 never merged into the board. They
are on the package fix branch, TauCetiRoadmapJobs pull request 12960, head `3dec31a`, together with
`reports/FIX-PKG-PerfectoidSpacesPartII~3.md` … `~8.md` on that branch. `~8` applies all five
findings of `REV-PKG-PerfectoidSpacesPartII~7.md`, the latest review on the board. That
review's own verdict was `needs_changes`, and it was written before `~8`.

I read that head's `README.md`, `Suggested.lean`, `sources.toml`, `design/plan.json` and its last
three fix reports, as data and read-only, and ported that version. Porting the board copy would have
reintroduced every defect fixed in rounds 2–7. I checked each of round 7's five findings in the
ported text: the A4.3 import, `rootSaturation_completelyIntegrallyClosed`, the `A = R` carriers of
§4.7, `TauCeti.Huber.PairOfDefinition.HasDenominatorPower`, and the Kummer locators. All five are
present. **The worker should confirm this choice of source.** No review has yet been run on the
text after FIX~8.

## Build

    lake build TauCetiRoadmap.PerfectoidSpacesPartII.Suggested
    Build completed successfully (18520 jobs).

10 warnings, all `declaration uses 'sorry'`, at `Suggested.lean` lines 113, 162, 225, 302, 380,
406, 435, 562, 614 and 673. No errors and no other warnings.

## Gate

    gate PerfectoidSpacesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable`):

    depcheck: 225 roadmaps, 1988 edges, 0 problem(s)

There are no UPWARD, CYCLE or `moved:` lines. `roadmaps resolve` on the ported README reports no
cross-roadmap citation and no Lean name that cannot be found. The one lead it gave on the package,
`Algebra.galoisTensorMap`, is gone: the README now cites the pinned `TauCeti.MulSemiringAction.tensorToPi`.

## Draft pull request body

This roadmap extends PerfectoidSpaces from covers that are étale wherever `p` is invertible to covers
of `Spec A[1/g]` that may ramify along `g = 0`. Here `A` is a perfectoid algebra and `g` has a
compatible system of `p`-power roots. It builds the almost-pro calculus of towers. It then proves
Bhatt's quantitative Riemann extension theorem, whose constant `pᵏm` is independent of the annulus
and therefore survives derived tensor products, together with its regularity-free and limit forms.
Next comes André's calculus of uniform Banach algebras: closures, root saturation, Laurent and
Weierstrass localisations, uniform limits and colimits, and root algebras. On that it builds the
perfectoid coreflection and almost perfectoid algebras, and proves André's perfectoid Riemann
extension theorem: the root saturation `g^{-1/p^∞}A°` is the complete integral closure of `A°` in
`A[1/g]`, and it is completely integrally closed. With almost Galois theory it proves ramified
almost purity and André's perfectoid Abhyankar lemma. Finally it applies all of this to the
normalized Kummer tower over `W(k)⟦T₁, …, Tₙ⟧`: pure and almost pure maps, André's flatness theorem,
purity of all Kummer extensions, and almost faithful flatness modulo `pᵐ` of finite extensions étale
away from `pg`. These are the inputs of André's and Bhatt's proofs of the direct summand theorem.
`Suggested.lean` states ten headline theorems at the pins, on Tau Ceti's rational localisations,
plus presheaf, perfectoid Tate rings and finite-projective trace, and on an explicit
generators-and-relations model of the Kummer tower. The derived form, the Banach-limit clauses, the
nested-systems theorem, ramified almost purity and the first two clauses of the Abhyankar lemma are
named as not statable, each with the carrier it lacks.

## Dependencies that are still pull requests

The README cites these suppliers, all earlier in the merge order:

- PerfectoidQuotients (§1.4 monic-root pairs; §1.3 named for comparison);
- DerivedDeRhamCohomology (§1.10);
- DeformationAndDerivedPatchingAlgebra (§1.13).

These are named only as ownership boundaries or consumers, not suppliers, and add no dependency
edge: AdicSpacesPartV §1.7, PerfectoidShimuraVarieties §1.3, DirectSummandsAndBigCohenMacaulay,
ArcTopologyAndDescent and FiniteEquivalenceRelations.

The suppliers on main are PerfectoidSpaces, Completed/AdicSpaces, AdicSpacesPartII,
AdicSpacesPartIII, AdicEtaleGeometry (A4.2a, A4.3) and DerivedModuleAlgebra (§0.K.1, §0.2, §1.1).
The README no longer cites EnhancedDerivedSheaves.

## What moved from the Lean file to the README

Nothing. The ported `Suggested.lean` already has the required form:

- one module docstring, the namespace, and `/-! ## Layer k -/` sections;
- 10 `sorry`'d headline theorems, plus 24 definitions with real bodies (one of them the instance
  `instCommRingKummerBase`) and 2 proved helper theorems (`kummerIntegralStage_mono`,
  `isIntegral_kummerVar_zeta`) that the headline statements use;
- no sorry'd data, no `set_option`, no examples;
- imports: `public import Mathlib` plus nine `TauCeti.*` modules.

The only change is one docstring line, re-wrapped. Every headline that is statable at the pins is
stated. The `IsPerfectoidTateRing` and `IsAlmostZero` restatements in the board copy had already been
replaced by `TauCeti.Perfectoid.IsPerfectoidTateRing` and Mathlib `Module.IsTorsionBySet` in the
ported version.

**Binder check.** I appended `#check @name` for all 36 declarations, and for the 81 Mathlib and Tau Ceti names
the README's contracts cite, to the module. I elaborated it once with the permitted `lake build` and
then restored the file. All 117 elaborated. Every signature keeps its binders:

- `[CompleteSpace K]`, `[CompleteSpace R]`, `[T2Space R]`, `[IsPerfectoidTateRing p R]` and `hKR` in
  all seven perfectoid headlines;
- `hreg` where the README assumes regularity, and no `hreg` in `bhatt_kernel_without_regularity`,
  `bhatt_riemann_extension_limit` and `rootSaturation_completelyIntegrallyClosed`;
- `[Module.Finite]`, `[Module.Projective]`, `[Algebra.Etale]` and `hfaith` in
  `abhyankar_trace_almost_surjective`;
- `[CharP k p] [PerfectRing k p]` in the three Kummer headlines;
- `[CompleteSpace R] [T0Space R]` in `coeffToSections`.

Each type matches its README statement. Nothing changed as a result.

I ran a second block of 18 `#check`s for the Tau Ceti tower and torsor names newly cited, and all
elaborated. Seven newly cited names live in Tau Ceti modules that are not built in the shared Lake
directory (`Almost/BasicSetup`, `RootSetup`, `ValuationRing`, `Almost/Module`, `Etale/Torsor/Basic`,
`TateGauge/Spectral/Seminorm`, `…/Uniformization`). I confirmed each of those in the pinned source,
with its namespace and line, instead of building them.

## Supplier replacements

These declarations exist at the Tau Ceti pin `2fd255d`, but the package cited them through
roadmaps. They are now cited directly, with file and line, in "Exact supplier contracts — From Tau
Ceti" and in every *Needs* and Dependencies line.

1. **Basic setups.** PerfectoidSpaces P0.1–P0.3 is now Tau Ceti:
   - `TauCeti.Almost.BasicSetup` (`RingTheory/Almost/BasicSetup.lean` 111);
   - `TauCeti.Almost.BasicSetup.IsAlmostIso` (386);
   - `TauCeti.Almost.BasicSetup.ofCompatibleRoots` and `ofCompatibleRoots_isAlmostZero_iff`
     (`RootSetup.lean` 62, 92);
   - `TauCeti.Almost.BasicSetup.ofValuationRing` (`ValuationRing.lean` 74).

   This touches Conventions and §0.1, §0.2, §1.1, §2.2, §2.3, §3.3, §3.5, §4.1 and §5.2, plus the
   Dependencies of Layers 0–5. PerfectoidSpaces stays the supplier of P0.6 onwards.
2. **Pro-zero towers.** EnhancedDerivedSheaves E2:towers.2 (`IsProZero`, `IsProIsomorphism`,
   `proZero_cofinal`) is now Tau Ceti:
   - `CategoryTheory.Functor.IsProZero`, `CategoryTheory.Functor.proIsomorphisms` and
     `CategoryTheory.Functor.isProZero_monotone_comp_iff` (`CategoryTheory/Functor/ProZero.lean` 67,
     171, 127);
   - `TauCeti.ModuleTower.lim_eq_bot_of_isProZero`,
     `TauCeti.ModuleTower.subsingleton_limOne_of_isProZero`,
     `TauCeti.ModuleTower.multiplicationTower`, `isProZero_multiplicationTower_iff` and
     `lim_multiplicationTower_eq_bot` (`Tower/ProZero.lean`).

   The EnhancedDerivedSheaves supplier block is removed.
3. **Towers, `lim`, `lim¹`, Milnor.** DerivedModuleAlgebra §1.T.1 is no longer a heading there; its
   README resolves it to Tau Ceti declarations. It is now cited as:
   - `TauCeti.ModuleTower`, `.lim`, `.limOne`, `.subsingleton_limOne_of_isMittagLeffler`,
     `.connecting` (six-term sequence) and `.derivedLimit`;
   - the Milnor sequence `TauCeti.ComplexTower.limOneToHomology_injective`,
     `exact_limOneToHomology_homologyToLim` and `homologyToLim_surjective`.

   DerivedModuleAlgebra is kept for §0.K.1, §0.2 and §1.1 (exactness of the derived limit, its cone
   comparison and compatibilities). §0.3's proof sketch had attributed "pro-isomorphic towers have
   isomorphic `lim`, `lim¹`" to DerivedModuleAlgebra §1.1, which does not state it. It is now derived
   from `TauCeti.ModuleTower.connecting` and the pro-zero vanishing.
4. **Finite étale torsors.** AdicEtaleGeometry A4.2 (`Algebra.galoisTensorMap`,
   `Algebra.IsFiniteEtaleTorsor`) is now Tau Ceti:
   - `TauCeti.MulSemiringAction.tensorToPi` (`RingTheory/Invariant/Free.lean` 111,
     `a ⊗ b ↦ (g ↦ a·g•b)`, the same convention as A4.2);
   - `TauCeti.Algebra.IsFiniteEtaleTorsor` (`RingTheory/Etale/Torsor/Basic.lean` 88), with
     `isInvariant`, `baseChange` and `of_surjective`.

   This touches the Scope, §4.1 (definition, API, convention-witness Check), §4.2 (fixed ring
   `T^{S_{r−1}} = S`) and the Layer 4 Dependencies. AdicEtaleGeometry is kept for A4.2a and A4.3.
5. **Spectral seminorm and uniformization.** These are now also cited at the pin, alongside
   AdicSpacesPartII R0.4: `TauCeti.Huber.spectralSeminorm` (`TateGauge/Spectral/Seminorm.lean` 72),
   and `TauCeti.Huber.Uniformization`, `toUniformization` and `Uniformization.lift`
   (`Uniformization.lean` 72, 76, 116). R0.4 is kept for the universal property among pairs and the
   uniform completed tensor product.
6. `ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness` is now written with its full
   DerivedDeRhamCohomology name, `DerivedDeRham.ordinaryFaithfulFlatnessFromCompleteFaithfulFlatness`.

**Duplication removals.** None were needed. The sweep is by object, over main and the open heads,
with `roadmaps grep`. Objects searched: almost-pro-zero towers, Riemann extension and the
Hebbarkeitssatz, root saturation and complete integral closure, the perfectoid Abhyankar lemma, the
Kummer tower and André's flatness theorem, almost Galois extensions, the perfectoid coreflection and
perfectoidization, uniform limits and colimits and uniform Banach algebras, Laurent and Weierstrass
localisation, almost perfectoid algebras, the stabiliser torsor and frame algebra, and
pure/universally injective maps. Every hit is one of:

- a consumer citing this roadmap: DirectSummandsAndBigCohenMacaulay, FiniteEquivalenceRelations,
  ArcTopologyAndDescent;
- a different object: AdicEtaleGeometry's toric Kummer tower, PerfectoidShimuraVarieties §1.3
  (characteristic-`p` Hebbarkeitssatz), AdicSpacesPartV §1.7 (rigid Riemann extension),
  PerfectoidTowers P8.18 and PerfectoidQuotients (integral perfectoidization),
  CommRingFactorizationSystems (spectral universal injectivity);
- an ownership boundary already stated in the Scope.

PerfectoidQuotientsPartII is later in the merge order and owns none of these objects. No
`Suggested.lean` declaration has the fully qualified name of a declaration in a roadmap I could read.
Ownership against open pull requests was checked through the index of 449 open heads.

## Other README fixes from the reviewer pass

- **Layer table.** The third column, "Main sources", mapped each layer to source chapters ("André A
  §§3–4"). That presents the plan as following a source. It is now "What it delivers", stated
  mathematically.
- **Generality of `t`.** Conventions and the Layer 1 introduction imposed `|t| = |p|` in
  characteristic `0`, while §1.2 and the Lean statements take any pseudouniformizer
  `0 < ‖t‖ < 1`. The README now says this is Bhatt's normalisation, which Layer 1 does not use.
  Integral perfectoid algebras are the rings `R°` of perfectoid `R`, which involves no choice of
  `t`. Witness: for `t′ = t²`, `A⟨t′ⁿ/g⟩ = A⟨t^{2n}/g⟩`. The `t′`-offset `pᵏm` from index `n`
  becomes the `t`-offset `2pᵏm = pᵏ(2m)` from index `2n`, which is exactly the `t`-statement at
  modulus `t^{2m}`.
- **Downstream consumers.** "PerfectoidShimuraVarieties may cite §1.5" was speculative, since that
  roadmap does not cite this one, and is removed. ArcTopologyAndDescent (§2.1) and
  FiniteEquivalenceRelations (§5.1, `IsPureHom`) are added, because both cite this roadmap.
- **Former-numbering table.** DirectSummandsAndBigCohenMacaulay (43 citations) and
  ArcTopologyAndDescent (6) cite this roadmap as `PerfectoidSpacesPartII §RA.k (target name)`, the
  ids of its design plan, which are not headings here. I added a table under Downstream consumers,
  with a header naming the former numbering, in the form DerivedModuleAlgebra uses on main. It maps
  RA.0–RA.5 and their 50 target names, in order, to §0.1–§5.12; the plan's nodes correspond to the
  README sections one to one. DirectSummandsAndBigCohenMacaulay also cites
  "§RA.5 (ramified multielement kummer)", which is not a target here; it is the finitely-many-`g`
  remark of §5.8.
- **Names.** Roadmap names are written in CamelCase (DirectSummandsAndBigCohenMacaulay) throughout,
  and several over-long lines were re-wrapped.

## Adversarial mathematics pass

`q = |ϖ| ∈ (0, 1)`. "Holds" means that the computed values agree with the statement. Every row was
recomputed in this job; the change column lists what was edited.

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §0.1 almost-pro-zero | `M_n = K°/ϖ^{1/p^n}`; constant `(K°, id)`; `t = 1` | image of `M_{n′} → M_n` is `(ϖ^{1/p^n−1/p^{n′}})`, killed by `ϖ^{1/p^k}` iff `n′ ≥ k`; at `n′ = n+r`, `ϖ^{1/p^{n+r+1}}` leaves exponent `1/p^n − 1/p^{n+r} + 1/p^{n+r+1} < 1/p^n`, nonzero; constant tower image `K°`, `ϖ^{1/p^k}K° ≠ 0`; `t = 1` gives `IsProZero` | holds; pro-zero/pro-iso citations moved to Tau Ceti |
| §0.2 uniform | zero transitions; `N_n = K°/ϖ`, `t = g = ϖ`, `p = 2`, `c = 0`; Bhatt tower with `g = 1` | `c(k) = 1` works; `k = l = 2`: `ϖ^{1/4+1/4} = ϖ^{1/2}` does not kill `K°/ϖ`; Bhatt tower: `ϖ^{1/p^l}` kills `ϖ^{1/p^n−1/p^{n+c}}` only for `l ≤ n + c` | holds; root setup cited at the pin |
| §0.3 derived limits | zero transitions; `ℤ ←p ℤ` with `t = 1` | `lim = lim¹ = 0`; `lim = 0` (`lim_multiplicationTower_eq_bot`), `lim¹ = ℤ_p/ℤ ≠ 0`, not pro-zero (`p` not nilpotent) | holds; proof sketch re-sourced (six-term sequence) |
| §0.4 linear functors | `F = − ⊗_ℤ A` over `A = K°`; `k = 0`, `ϖ = p` | `|ϖ^{1/p}| > |ϖ| ≥ |p|`, so `x ⊗ ϖ^{1/p} ≠ 0` in `M ⊗_{𝔽_p} A/p`; at `k = 0`, `ϖ = p`: `x ⊗ p = 0` | holds |
| §0.5 tensor survival | `K = R`; exponent split | returns hypothesis; `1/p^{l+1} + (p−1)/p^{l+1} = 1/p^l` | holds |
| §1.1 annular tower | `g = 1`, `g = 0`, `g = (T, 0)` | `X⟨tⁿ/1⟩ = X`; `tⁿ` a unit makes `{|tⁿ| ≤ 0}` empty; `(0,1) ∈ ker f_n`; restriction `(t^{n+1}/g)^e = t^e(tⁿ/g)^e` | holds |
| §1.2, `bhatt_riemann_extension_ker_almostZero`, `bhatt_quantitative_riemann_extension` | monomials `u^e_{n+c}`; `g = 1`; `m = 0`; `n = 0`, `g = T`; `(K⟨T^{1/p^∞}⟩ × K, (T,0))` | `e ≥ 1/pᵏ ⇒ pᵏme ≥ m`; `e < 1/pᵏ`: `g^{1/pᵏ−e}t^{ce+ne}` in the image; `g = 1`: `a = t_l x`, `y = 0`; `m = 0`: `a = 0`, `y = g_k t_l x`; `n = 0`: `M_0 = (K°/tᵐ)[T^{±1/p^∞}]`, `ker f_0 = 0`; product: `hgreg` fails at `a = (0,1)` and so does the conclusion (`ϖ^{1/p^l}(0,1) ∉ ϖᵐR°`, `m ≥ 1`) | holds; hypothesis necessary; normalisation of `t` aligned with Lean |
| §1.3 derived form | `K = A/tᵐ`; `x = (0)` | §1.2 recovered; `H_1(Kos) = A/tᵐ ≠ 0` | holds |
| §1.4, `bhatt_kernel_without_regularity` | `g = (T, 0)`; `g = 0` | `(t_kT_k, 0)·(0, b) = 0`; root ideal of `tg` is `0`, so everything is almost zero | holds |
| §1.5, `bhatt_riemann_extension_limit` | `g = 0`, `g = 1`, `(T,0)`, disc | sections over `∅` are `0`, so the kernel is `R°`, killed by `t_k·0 = 0`; `g = 1`: `𝒪(X) ≅ R` (`isIso_toPresentationLimit_top`), kernel `0`; `(T,0)`: kernel `0 × K°` not killed by `t^{1/p^k}`; `‖1/T‖ = |t|^{−n}` on annulus `n`, unbounded | holds |
| §2.1 closures | `ℤ ⊂ ℤ[i]`, `p = 3`; `ℤ ⊂ ℤ[1/2]` | `Im (a+bi)³ = b(3a² − b²)`, zero only for `b = 0`; `2^m(a/2^e)^n ∈ ℤ ⇒ en ≤ m ∀n ⇒ e = 0` | holds |
| §2.2 dictionary | `K°[T, ϖ^{−1}T²]`; `ℤ_p + pTℤ_p[T]` | `|T| = 1`, `|T²| ≤ q < 1`, so not power-multiplicative; `(ϖ^{−1/2}T)² ∈ A`, gauge `q^{−1/2} > 1`; discrete `⋂_{s≥1} p^{−s}A = p^{−1}A ≠ A` | holds |
| §2.3, `rootSaturation` | `g = 1`; disc `g = T`; `b = T^{−(1−1/p)}`; product rule | `R°`; `K°⟨T^{1/p^∞}⟩`; `m = 1`: exponent `2/p − 1` (`−1/3` at `p = 3`, `0` at `p = 2`), `m = 2`, `p = 2`: `−1/4`; `(1 + (p−2) + 1)/p^{m+1} = 1/p^m` | holds |
| §2.4 Laurent | `K×K`, `g = (ϖ², 1)`, `λ = ϖ`, `a = (1, ϖ²)`; `λ/T` vs `λ²/T²` | quotient norm `q²`; `inf_m max(q^m, q^{2−m}) = q`; norms `1` and `q_λ^{−1}` | holds (source correction kept) |
| §2.5 Weierstrass | `K⟨T⟩`, `f = T`, `λ = ϖ`; `f = ϖT`, `λ = ϖ²` | unit ball `K°⟨U⟩`; `ϖ(ϖU − T) ∈ (ϖ²U − ϖT)`, `ϖU − T` not: nonzero torsion | holds |
| §2.6 uniform limits | `ulim_j K⟨T, ϖ^j/T⟩`; `Σ Tⁿ/ϖ^{⌊√n⌋}` | `|a_{−n}|q^{−jn} ≤ C ∀ j ⇒ a_{−n} = 0`; converges for `r < 1`, sup norms unbounded as `r → 1` | holds |
| §2.7 uniform colimits | shrinking discs; `𝔽_p(T)` | `ucolim = K` by evaluation at `0`; inverse perfection `𝔽_p` vs perfect closure `𝔽_p(T^{1/p^∞})` | holds |
| §2.8 root algebras | `A = K`, `g = 1`, level 1 | char 0: `K[S]/(S^p−1)` dimension `p`, reduced; char `p`: `(S−1)^p = 0`, uniformizes to `K` | holds |
| §2.9 tubes | `f = 0`; char `p`, `A = K⟨X⟩` | `ucolim B = B`; `X` is not a `p`-th power (`X`-exponents of `p`-th powers divisible by `p`) | holds |
| §3.1 coreflection | `K⟨T⟩`; char `p`, `q = 1/4`, `p = 2` | `K⟨T⟩^♮ = K`; `|t^{1/2^n}|^{2^n} = 1/4` for all `n`; unrescaled `sup q^{1/2^n} = 1` | holds |
| §3.2 root algebras | `g = 0`, `A = K`; `g = 1`, `p = 2` | `(T^{1/p^i})^{p^i} = 0`, so the root algebra is `K`; `K[S]/(S²−1) ≅ K×K`, 4 idempotents; `2^{p^i}` at level `i` when `μ_{p^i} ⊂ K` | holds |
| §3.3 almost perfectoid | `B = K + (T₁^{1/p^∞}P)^− + (T₂P)^−` | `T₂ ∈ B`, `T₂^{1/p} ∉ B`; `T₁^{1/p^k}P ⊂ B`, so `B°^a = P°^a` | holds |
| §3.4 annular | `(ϖ^j/T)^{1/p}`, `j = 1`, `p = 2`; `j = 0` | spectral norm `1`, quotient norm `q^{−j(1−1/p)} = q^{−1/2} > 1`; at `j = 0` both `1` | holds |
| §3.5 limit lemma | `r = 0`; `T` acting by `0` | zero; `R[0] = 0` (`T·u = 1`); `R[j] = k_K[U^{1/p^∞}]`; `lim = k_K`; kernel `K°°/ϖ^r`; `ϖ^{1/p}·ϖ^{1/p²} ≠ 0` in `K°°/ϖ` (`1/p + 1/p² < 1`) | holds |
| §3.6(2), `riemann_extension_completeIntegralClosure` | `g = 1`; char `p` `B = K + (Σ T₁^{1/p^m}P)^−` | saturation `R°` = CIC (`R` uniform); `T₂ = T₁T₂/T₁` in saturation, not integral (specialise `T₁^{1/p^m} ↦ 0`) | holds |
| §3.6(3), `rootSaturation_completelyIntegrallyClosed` | `K×K`, `g = (1,0)`; `g = 0`; `b = ϖ^{−1}` | `R[1/g] = K`, saturation `K°`; `|b|ⁿ ≤ max|c_i|` forces `|b| ≤ 1`; `|ϖ^{−1}|ⁿ = q^{−n}` unbounded; `g = 0`: zero ring | holds without regularity |
| §3.7 largest algebra | disc; char `p` `B` | `A`; `P ⊋ B` | holds |
| §3.8 uniform limits | constant; two-term isomorphism | all five conditions; reduction `A₂°/ϖ → A₂°/ϖ_{1/p}` onto | holds |
| §3.9 `lim¹` | non-nested `R_i = (K°/ϖ)[X]`, `X ↦ 0` | `ϖ^{1/p}[X] ≠ 0`; images stabilise, so `lim¹ = 0` by Mittag-Leffler | holds; `limOne` cited at the pin |
| §3.10 category | `A[j][ε]/(ε²)` | base-change condition holds; `ε ≠ 0` nilpotent, so not perfectoid | holds |
| §3.11 nested systems | zero system | `ulim 0 = 0`, `ς(0) = 0` | holds |
| §4.1 almost Galois; convention | `ℤ → ℤ[i]`; swap on `A×A` | images `(1,1), (i,i), (i,−i), (−1,1)`; block determinants `2`, `−2`, index `4`, cokernel `(ℤ/2)²`; André `((0,0),(0,1))` vs `tensorToPi` `((0,0),(1,0))` | holds; supplier now `tensorToPi` |
| §4.2 closure, rigidity | `r = 1`; `r = 2`, `S = R[x]/(x²−a)`; `ℚ(2^{1/3})`; cyclic cubic | `ε = 1`; `δ² = (2 + 2x⊗x/a)/4 = δ`, `(x⊗1 + 1⊗x)(1−δ) = 0`; `[T:ℚ] = 6`, stabiliser order `2`; `ℤ/3` free on 6 frames, 2 orbits, `T ≅ S×S` | holds; `isInvariant` cited |
| §4.3 envelopes | `B′ = A[1/g]^n`; `B′ = 0`; `1/T` | product; `0`; norms `q^{−j}` unbounded | holds |
| §4.4 integral almost étale | `B = A × A`; char `p` | trivial `ℤ/2`-torsor; `pᵐ = 0` for `m ≥ 1` | holds |
| §4.5 ramified purity | tame `Y^ℓ = T` | `a pᵏ + bℓ = 1 ⇒ a/ℓ + b/pᵏ = 1/(ℓpᵏ)` | holds |
| §4.6 envelope | disc `B′ = A[1/T]` | envelope `A ⊊ B′` | holds |
| §4.7(3), `abhyankar_trace_almost_surjective` | `R = K`, `g = 1`, `B′ = K×K`; `R = K×K`, `B′ = K × R`; unfaithful `B′ = A₁` | `(1,0) ↦ 1`, onto `K°`; projective trace `(x + y₁, y₂)`, while `LinearMap.trace = 0` there; image `A₁° × 0` misses `(0, ϖ)`; `c g^{1/p^l} = (c′g^{1/p^{l+1}})(c″g^{(p−1)/p^{l+1}})` | holds; faithfulness needed |
| §4.8 envelopes | `B = A`, `g = 1`; `B = A × A` | `P`; `P × P` | holds |
| §5.1, `IsPureHom` | `×2` on `ℤ`; `ℤ → ℤ[1/2]`; `K[x,y]/(xy)`; `ℤ → ℤ[i]` | `ℤ/2 → ℤ/2` zero; `ℤ/2 ⊗ ℤ[1/2] = 0`; `(x+y)(1,0) = (x,0)`, but `x ∉ (x+y)R` (mod `y`: `f(0) = 1`; mod `x`: `f(0) = 0`); pure (basis `1, i`) but two primes over `5` | holds |
| §5.2, `IsAlmostFlat`, `IsAlmostFaithfullyFlat` | `m = 0`; `m = V = ℤ`, `ℚ`; `K°° ⊂ K°` | all modules qualify; `ℚ ⊗ ℤ/2 = 0` with `ℤ/2 ≠ 0`; kernel after `⊗ K°/ϖ` is the residue field | holds |
| §5.3 Krull detection | non-Noetherian `K°`, `M = K°/K°°` | idempotent `K°°` kills `M ≠ 0` | Noetherian hypothesis needed |
| §5.4, Kummer encoding | `p = 2`, `g = 1`, `(0,1)`; `g = p²`, `p` odd; `p = 2`, `g = 2`, `j = 3`, `l = 1` | `ℚ₂[X]/(X²−1) ≅ ℚ₂²`; `y = X^{(p+1)/2}/p`, `y^p = p^{p+1}/p^p = p`, `y ∉ ℤ_p[X]/(X^p−p²)`; `u = ζ₈ + ζ₈^{−1}`, `u² = 2`, `e = (1 + X/u)/2`, `e² = e`; `v(ζ_{p²}−1) = 1/2, 1/6`; degrees `1, 2, 4` | holds |
| §5.5 spectral norm | idempotent `e`; `n = 0` | `‖e‖ = ‖1−e‖ = 1`, `‖e(1−e)‖ = 0`; `x = (ζ−1)·((ζ−1)u)` | holds |
| §5.6 tubes | `g = 1`, `n ≥ 1` | `T₁` not a `p`-th power mod `p` | coordinate roots needed |
| §5.7 tube models | `j = k′`; general | basis `U^b` with `Z = g₀`; `Z^aU^b`, `a < p^{j−k′}` | holds |
| §5.8, `kummer_almost_faithfullyFlat` | `n = 0`, `g = p` | `A°_∞0 = K°_∞`; `kummerAlmostIdeal = K°°_∞` (`ζ_j − 1` generate, valuations → 0); torsion-free over the valuation ring, hence flat | holds |
| §5.9, `kummer_isPureHom` | `n = 0`, `g = p`, `(0,1)`; `p = 2`, `g = 1`, `(0,1)`; `l = 0` | split by the coefficient of `1`; diagonal split by the first projection; identity | holds |
| §5.10 generic | `g = 0` | `A_{00} = A[1/p]`; `[X]^{p^l} = 0` for `l ≥ 1` | `g ≠ 0` needed |
| §5.11 model `S` | `p = 2`, `g = 2` | `e` has residues `(1,0)`, while `S` has diagonal residues `(a,a)`, so `e ∉ S` | holds |
| §5.12, `kummer_ramified_almost_faithfullyFlat` | `m = 0`; `m = 1`; `B = 0` | zero rings; `W(k)/p = k`, 2 elements (`𝔽₂`) or 3 (`𝔽₃`); `B = 0` excluded by injectivity, `v(ζ_{p²}−1) = 1/2, 1/6 < 1` | holds |
| gap: complete almost Nakayama | `ℤ_(p) → ℤ_p`; `ℤ_p → ℤ_p ⊕ ℚ_p` | identity on `𝔽_p` (2 / 3 elements) but not onto; `ℚ_p/pℚ_p = 0`, iso mod `p`, not onto | both completeness hypotheses needed |
| gap: principal almost flatness | `𝔽_p` over `ℤ`; `ℚ_p` over `ℤ_p[x]`, `x ↦ 0` | `Tor₁(𝔽_p, 𝔽_p) = 𝔽_p ≠ 0`; `ℚ_p[x]/(x)` not flat over `ℚ_p[x]` | both hypotheses needed |
| Convention: root systems | product | `((tg)^{1/p^{k+1}})^p = t^{1/p^k}g^{1/p^k}` | holds |
| Convention: tower index | `n = 0` term | changes no pro-statement and no limit | holds |
| Convention: `|t| = |p|` | `t′ = t²` | offset `pᵏm` at `t′` equals `pᵏ(2m)` at `t` from `2n` | not needed; README aligned |

## Unresolved

- **Unreviewed text.** The ported text is FIX~8, which has not been reviewed since round 7. The
  board's `review.json` still records the round-2 verdict.
- **Supplier gaps.** The two declared contracts remain requests to PerfectoidSpaces:
  `gap:complete-almost-nakayama` (P0.26) and `gap:principal-almost-flatness` (P0.11). They are
  written in the "What PerfectoidSpaces must provide (gap:…)" form used on main, for instance by
  FlagVarieties.
- **Citations by design ids.** DirectSummandsAndBigCohenMacaulay and ArcTopologyAndDescent cite this
  roadmap by design ids (`§RA.k`). The new table resolves them, but those roadmaps should re-cite by
  section.
- **P3 note carried over from FIX~8.** `riemann_extension_completeIntegralClosure` keeps `hreg`,
  as Théorème 4.2.2 does, although the sandwich `im R° ⊆ S ⊆ g⁻¹ im R°` shows it is not needed for
  its truth. It was not widened.
- **Untrusted text.** No passage in the package, its reports, the pull request or the cited roadmaps
  asked me to act outside the brief.


Pull request: #2286 (roadmap/perfectoid-spaces-part-ii at d8879ce)
