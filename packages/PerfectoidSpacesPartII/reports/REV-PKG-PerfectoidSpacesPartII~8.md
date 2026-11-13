<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12960#issuecomment-6857021743 -->
Review (claude) of 3dec31a

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) Four proof sketches render the source's proof sentence by sentence

   **Location.** `packages/PerfectoidSpacesPartII/README.md`:
   (a) §5.9, *Proof sketch*, lines 2664–2672: "Let `P` be a finitely presented `A°_∞0`-module and
   `N ⊆ ker(P → P ⊗ A°_∞∞)` finitely generated, hence finitely presented … its annihilator `I`
   contains `K°°_∞`";
   (b) §4.7, lines 2159–2161: "if `B′` is faithful, `B̃°` is a faithful `A°`-module, and since
   `A → B̃` is isometric, `B̃°/p` is faithful over `A°/p`; `B̃°^a/p` is finite étale over `A°^a/p`, so
   the trace is almost surjective modulo `p`";
   (c) §3.6, *Proof sketch*, lines 1648–1652 (the proof of clause (1));
   (d) §3.11, *Proof sketch*, lines 1818–1823.

   **Claim.** The sketches are the roadmap's own wording.

   **Witness.** (a) ANDRE18B lines 552–562 (proof of Corollaire 2.6.1, p. 82): the five README
   sentences correspond one to one, in order, to the source's seven, with the same letters `P`, `N`,
   `I`, `I_j` and the same instantiation of Lemme 1.1.2. (b) ANDRE18A lines 3196–3200: an English
   rendering of two consecutive sentences, about 45 words. (c) ANDRE18A lines 2588–2614: four
   sentences in the source's order, the last one clause for clause. (d) ANDRE18A lines 2927–2957:
   four sentences in the source's order. In (b) the step from faithfulness to surjectivity of the
   trace also has no owner in the cited sections (see R06).

   **Exact repair.** Replace the four passages by the following (each states the route and its inputs;
   the mathematics is unchanged and was rechecked on the instances of the table below).

   (a) §5.9: "*Proof sketch.* The route upgrades the almost purity that §5.8 gives for the completed
   tower to purity, by Krull detection on a Noetherian stage. Two reductions come first. Purity passes
   to the first map of a composite (§5.1), and `A°_{j0} → A°_jl → A°_∞∞` is also the composite
   `A°_{j0} → A°_∞0 → A°_∞∞`, whose first map is faithfully flat (§5.4); so only `A°_∞0 → A°_∞∞` has to
   be shown pure. Purity may be tested on finitely presented modules `P` (§5.1), and it holds as soon
   as every finitely generated submodule `N` of `ker(P → P ⊗ A°_∞∞)` is zero. Such an `N` lies in the
   kernel of `P → P ⊗ Â°_∞∞`, which `K°°_∞` kills because `Â°_∞∞` is almost faithfully flat, hence
   almost pure, over `A°_∞0` (§5.8, §5.2). The ring `A°_∞0` is coherent, a directed union of Noetherian
   rings flat over one another, so `N` is finitely presented and `Ann(N)` is a finitely generated ideal
   containing `K°°_∞`; it is therefore extended from an ideal `I_j` of a finite stage. Krull detection
   (§5.3) for the Noetherian local ring `A°_{j0}`, its module `A°_{j0}/I_j`, the faithfully flat algebra
   `A°_∞0` and the idempotent ideal `A°°_∞0 = K°°_∞A°_∞0` (§5.5), whose preimage in `A°_{j0}` contains
   `p ≠ 0`, forces `I_j = A°_{j0}`, so `1` kills `N`. For finite `j, l` the cokernel of the finite map
   `A°_{j0} → A°_jl` is finitely presented, so purity gives a module splitting (§5.1)."

   (b) §4.7, the sentence on almost surjectivity up to "onto `(A°^a)_* = g^{-1/p^∞}A°`": "(3), almost
   surjectivity: the route is modulo `p` first, then a lift. Replace `A°` by its root saturation and
   split `A` along the idempotents of `A[1/g]`, which are integral and so lie in `g^{-1/p^∞}A°`, into
   factors on which `B′` has constant rank `r`; faithfulness means `r ≥ 1` on each. If `B′` is Galois
   with group `G`, then `B̃°^a/p` is `G`-Galois over `A°^a/p` (§4.4), and the trace of a Galois
   extension is an epimorphism (§4.1). In general let `C′` be the frame torsor of `B′`
   (AdicEtaleGeometry A4.3), `S_r`-Galois over `A[1/g]` and `S_{r−1}`-Galois over `B′` (§4.2(1)); by
   §4.4 over the bases `A` and `B` its integral model is Galois modulo `p` over both, the trace of
   `C̃°^a/p` over `A°^a/p` is the composite of its trace over `B̃°^a/p` with the trace of `B̃°^a/p`
   (PerfectoidSpaces P0.12), and the first being an epimorphism makes the last one an epimorphism. So
   the trace `B̃° → (A°^a)_* = g^{-1/p^∞}A°` is almost surjective modulo `p`." Add `§4.1, §4.2;
   AdicEtaleGeometry A4.3` to the *Needs* of §4.7. The lifting sentences that follow stay as they are.

   (c) §3.6, the first four sentences of the sketch: "*Proof sketch.* (1) is Scholze's limit lemma
   (§3.5) transported from the truncated algebraic root localisations to the unit balls of the annuli.
   For perfectoid `A`, §3.4 identifies `A{ϖʲ/g}°/ϖ^r` almost, and compatibly in `j`, with the ring
   `R[j]` that §3.5 builds from `R = A°/ϖ^r`; so §3.5 reads `(A°/ϖ^r)^a ≅ lim_j (A{ϖʲ/g}°/ϖ^r)^a`. All
   these rings are `ϖ`-adically complete and limits commute with limits, so the truncation disappears:
   `(A°)^a ≅ lim_j (A{ϖʲ/g}°)^a`. The functor of almost elements is a right adjoint; it turns the left
   side into `g^{-1/p^∞}A°` and each term on the right into `g^{-1/p^∞}A{ϖʲ/g}° = A{ϖʲ/g}°`, since `g`
   is invertible on the annulus (§2.3). For almost perfectoid `A` the argument runs on `A^♮`, which has
   the same annuli (§2.4(5)) and the same almost unit ball."

   (d) §3.11: "*Proof sketch.* Three things are shown. *The uniform limit is almost perfectoid.* In
   characteristic `p` perfectness passes to limits. In characteristic `0`, by the criterion of §3.8 in
   the ramified setup it suffices that `lim_j(B_j°/ϖ) → lim_j(B_j°/ϖ^{1/p})` be almost surjective. The
   `B_j°` are `K°`-flat, so the kernels are the `B_j°/ϖ^{1−1/p}` and the obstruction lies in their
   `lim¹_j`; §3.9, applied to the system `R_j = B_j°/ϖ^r`, which is nested because `R_i[j] ≅ R_j`
   almost (§3.4 and the isomorphisms `B_i{ϖʲ/g} ≅ B_j`), makes it almost zero. *`ulim ∘ ς ≅ id`* is
   §3.6(1). *Adjunction.* A morphism `ς(C) → (B_j)` gives `C ≅ ulim ς(C) → ulim B_j`; a map
   `C → ulim B_j` is localised to `C[j] → (ulim B)[j]` and composed with the canonical maps
   `(ulim B)[j] → B_j`; the two constructions are inverse to each other and natural. A full
   subcategory whose inclusion has a right adjoint with invertible unit is coreflective."

   Tested: (a) on `n = 0`, `g = p`, where `A°_∞0 = K°_∞` and `N` killed by `K°°_∞` with `Ann(N)`
   extended from `ℤ_p[ζ_{p^j}]` forces `Ann(N) ∋ 1`; (b) on `B′ = K × K` over `A = K`, `g = 1`
   (`r = 2`, `C′ = B′`, trace `(x, y) ↦ x + y`, onto `K°`); (c), (d) on the disc `A = K⟨T^{1/p^∞}⟩`,
   `g = T`, where both sides are `K°⟨T^{1/p^∞}⟩` and `ulim A[j] = A`.

2. **F02** (P3) A regularity hypothesis the package's own theorem makes unnecessary

   **Location.** `packages/PerfectoidSpacesPartII/Suggested.lean:389`: "`(hreg : ((g 0 :
   powerBoundedSubring R) : R) ∈ nonZeroDivisors R)`" in `riemann_extension_completeIntegralClosure`;
   `README.md:1612`: "(2) assumes that `g` is a nonzerodivisor of `A`, so that `A° ⊆ A[1/g]`";
   `README.md:943–950` defines the localised complete integral closure only for an injective `R → S`
   and a nonzerodivisor `g`, while §2.3 (lines 1059–1063) and §3.6(3) use it for zero divisors.

   **Claim.** Clause (2) needs `g` to be a nonzerodivisor.

   **Witness.** With `S = rootSaturation p g hg`: `b ∈ S` gives `g·bⁿ ∈ im R°`, so `bⁿ ∈ R°·g⁻¹`;
   conversely `Σ R°mᵢ ⊆ Σ S·mᵢ` and `rootSaturation_completelyIntegrallyClosed` apply. For `R = K × K`,
   `g = (1, 0)` both sides are `K°`. A copy without `hreg` elaborates.

   **Exact repair.** (i) In `Suggested.lean` delete the binder `hreg` of
   `riemann_extension_completeIntegralClosure` and, in its docstring, replace "`g ∈ R°` a
   nonzerodivisor of `R` with a compatible system" by "`g ∈ R°` with a compatible system" and "the
   complete integral closure of `R°`" by "the complete integral closure of the image of `R°`". (ii) In
   README §3.6 replace the sentence "Clauses (1) and (3) … isometric." by "Clauses (1)–(3) need no
   further hypothesis on `g`; for a zero divisor `g` the closures of (2) are those of the image of `A°`
   in `A[1/g]`. In (4) `g` is a nonzerodivisor because multiplication by `g` is isometric."; in the
   sketch replace "and for a nonzerodivisor `g` the fourth, which is (2)" by "and the fourth, which is
   (2): a finitely generated module over the image of `A°` lies in one over the root saturation, and
   `g` multiplies the root saturation into the image of `A°`"; in the paragraph on `Suggested.lean`
   say that both statements carry no regularity hypothesis. (iii) In §2.1 add after the definition:
   "When `R → R[1/g]` is not injective the same definitions are read for the image of `R`: `s` lies in
   the closure if its powers lie in one finitely generated submodule over that image." (iv) Add to the
   Check "(3) holds for zero divisors" of §3.6: "The same algebra satisfies (2): the elements of `K`
   whose powers lie in a finitely generated `K°`-module are those of `K°`." The repaired signature was
   elaborated on a scratch copy (exit 0, ten `sorry` warnings); on the cross
   `{(f, h) : f(0) = h(0)}` in characteristic `p` with `g = (X, 0)` both sides are
   `K°⟨X^{1/p^∞}⟩`. The trace theorem keeps its `hreg`: its route (§4.4) uses regularity.

3. **F03** (P3) Gabber's invariance is used where its hypothesis is not assumed

   **Location.** `README.md:1784`: "`B[j]` is perfectoid since `B[j] ≅ B^♮[j]` by Gabber's invariance
   and §3.4"; line 1774 ("via `A[j] ≅ A^♮[j]`"); §3.6(5), line 1627, for clause (1).

   **Claim.** §2.4(5) gives `B^♮{ϖʲ/g} ≅ B{ϖʲ/g}` for every almost perfectoid `B`.

   **Witness.** §2.4(5), line 1132, assumes "`g` is a nonzerodivisor and `A ⊆ A′ ⊆ A[1/g]`"; §3.10
   makes no such assumption. For `B = (K + (T₁^{1/p^∞}P)^− + (T₂P)^−) × K`, `g = (T₁, 0)` is a zero
   divisor; the conclusion still holds, both sides being `P{ϖʲ/T₁} × 0`.

   **Exact repair.** In §2.4 replace item 5 by: "5. (Gabber's invariance) let `ι : A → A′` be an
   injective continuous map of Banach algebras and `ψ : A′ → A` a continuous `A`-linear map with
   `ι ∘ ψ` the multiplication by `u·g^N` for a unit `u` of `K` and some `N`; then
   `A{λ/g} → A′{λ/g}` is an isomorphism of Banach algebras, with inverse `(u·g^N)^{−1}ψ`. Such a `ψ`
   exists when `g` is a nonzerodivisor and `A ⊆ A′ ⊆ A[1/g]` (Baire and the open mapping theorem), and
   when `A → A′` is the counit `B^♮ → B` of an almost perfectoid `B`, with `N = 1` and any nonzero
   `u ∈ K°°`, because `u·g·B° ⊆ B^♮°` (§3.3)." Change the matching API bullet and the sketch of (5)
   accordingly, and in §3.10 and §3.6(5) cite "§2.4(5), second case". Add to the Checks of §3.10 the
   instance of the witness. Tested there: `u·T₁` multiplies `B°` into `B^♮° = (K + (T₁^{1/p^∞}P)^−)° × K°`
   and the localised map is the identity of `P{ϖʲ/T₁}`.

4. **F04** (P3) Two open roadmaps cite ids of the design that the README no longer has

   **Location.** `packages/PerfectoidSpacesPartII/README.md`: the layers are "`## Layer 0`" …
   "`## Layer 5`" and the targets `### 0.1` … `### 5.12`; no `RA.` id occurs.

   **Claim.** No id that other roadmaps cite was dropped.

   **Witness.** DirectSummandsAndBigCohenMacaulay (open, #1735),
   `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:449`: "PerfectoidSpacesPartII §RA.5
   (pure map)" (64 such citations, 14 targets); ArcTopologyAndDescent (open, #1755), `README.md:26`
   and `:1300`: "§RA.2, target p-root-closure". The ids are those of
   `packages/PerfectoidSpacesPartII/design/plan.json`.

   **Exact repair.** Add at the end of `## How to read the build` a table whose header names the
   former numbering:

   | Former numbering | Now |
   | --- | --- |
   | RA.0: almost-pro-zero-tower, uniformly-almost-pro-zero, almost-pro-zero-derived-limit, almost-pro-zero-linear-functor, uniform-annihilation-derived-tensor | §0.1, §0.2, §0.3, §0.4, §0.5 |
   | RA.1: annular-tower, quantitative-riemann-extension, quantitative-riemann-extension-derived, quantitative-riemann-extension-general, riemann-extension-almost-limit | §1.1, §1.2, §1.3, §1.4, §1.5 |
   | RA.2: p-root-closure, unit-ball-dictionary, root-saturation, laurent-localisation, weierstrass-localisation-unit-ball, uniform-limit, uniform-colimit, root-algebra, tubular-colimit | §2.1 … §2.9 in this order |
   | RA.3: perfectoid-coreflection, perfectoid-root-algebra, almost-perfectoid-algebra, annular-localisation-perfectoid, scholze-limit-lemma, perfectoid-riemann-extension, largest-perfectoid-subalgebra, uniform-limit-perfectoid-criterion, nested-lim-one-vanishing, compatible-annular-system, nested-systems-theorem | §3.1 … §3.11 in this order |
   | RA.4: almost-galois-extension, galois-closure-and-rigidity, annular-envelope, integral-ramified-almost-etale, ramified-almost-purity, abhyankar-envelope, perfectoid-abhyankar-lemma, almost-perfectoid-envelope-of-affinoid | §4.1 … §4.8 in this order |
   | RA.5: pure-map, almost-pure-map, krull-detection-lemma, normalized-kummer-tower, kummer-tower-spectral-norm, kummer-tower-tubular-description, noetherian-tube-faithful-flatness, kummer-almost-faithful-flatness, kummer-purity, kummer-generic-faithful-flatness, flat-integral-model, ramified-kummer-almost-flatness | §5.1 … §5.12 in this order |

   Tested on the witness: "§RA.5 (pure map)" resolves to §5.1 and "§RA.2, target p-root-closure" to
   §2.1; the 50 design nodes and the 50 README targets are in the same order (5, 5, 9, 11, 8, 12 per
   layer).

5. **F05** (P3) An imported module is not used, and the README says it is

   **Location.** `packages/PerfectoidSpacesPartII/Suggested.lean:6`: "`public import
   TauCeti.RingTheory.Huber.Bounded`"; `README.md:271`: "`Suggested.lean` uses the first five".

   **Claim.** The file uses `IsTateRing`, `IsPseudoUniformizer`, `PairOfDefinition`, `IsBounded` and
   `IsPowerBounded`.

   **Witness.** `IsPseudoUniformizer`, `IsBounded` and `IsPowerBounded` do not occur in
   `Suggested.lean`. A copy without line 6 elaborates: exit 0, ten `sorry` warnings.

   **Exact repair.** Delete line 6 of `Suggested.lean`. In the README replace "`Suggested.lean` uses
   the first five; the power-bounded subring is the `A°` of every statement." by "`Suggested.lean` uses
   `TauCeti.Huber.IsTateRing`, `TauCeti.Huber.PairOfDefinition` and
   `TauCeti.Huber.powerBoundedSubring`, which is the `A°` of every statement." Tested by the
   elaboration of the witness.

6. **F06** (P3) Galois extensions are used as faithfully flat with surjective trace; §4.1 does not say so

   **Location.** `README.md:1870–1873`, the list of what §4.1 proves ("a `G`-Galois extension is finite
   étale of rank `|G|` with trace the sum of conjugates; …"), and its API, lines 1892–1900.

   **Claim.** §4.1 lists what the later proofs take from Galois extensions.

   **Witness.** §4.1's own construction ("invariants are computed after faithfully flat base change",
   "descend from `B` to `C`"), §4.7(3) and §5.12 ("so the almost finite étale algebra is almost
   faithfully flat") use that a Galois extension is faithfully flat with epimorphic trace; the source
   uses it at ANDRE18A line 349. PerfectoidSpaces P0.11–P0.15 state neither.

   **Exact repair.** Add to the statement and to the API of §4.1: "A `G`-Galois extension `A → B` is
   faithfully flat, and its trace `B → A` is an epimorphism (André A, Proposition 1.9.1, proof of (2),
   pp. 9–10)." Add to the construction: "For `η ∈ m` the relation `η = Σ_i t(b_i)b′_i` puts `η` in
   `I·B_*`, `I` the image of the trace in `A_*`; the norm `η^{|G|} = ∏_γ γ(η)`, expanded, is a sum of
   monomials in `I` with coefficients that are orbit sums, hence in `B_*^G = A_*`; so `η^{|G|} ∈ I`,
   and the `|G|`-th powers of the elements of `m` generate `m` (condition (B) of PerfectoidSpaces
   P0.1), so `m ⊆ I`. The extension is flat because it is almost projective (PerfectoidSpaces P0.11),
   and faithful because, for `ε = t(c_ε)` in `m`, the map `n ⊗ b ↦ t(c_εb)n` retracts
   `N → N ⊗_A B` up to `ε`." Add the Check: "Over `ℤ[1/2]` the trace of `ℤ[1/2][i]` sends `1/2` to
   `1`; over `ℤ` its image is `2ℤ`, in agreement with `ℤ → ℤ[i]` not being Galois." In §5.12 replace
   "so the almost finite étale algebra is almost faithfully flat" by "so on each constant-rank factor
   the rank is positive, the frame torsor of `B′` (AdicEtaleGeometry A4.3) has by §4.4 an integral
   model that is Galois modulo `pᵐ` over `Â°_∞∞/pᵐ` and over `B°/pᵐ`, both Galois extensions are
   faithfully flat (§4.1), and then so is `Â°_∞∞/pᵐ → B°/pᵐ`", and add `§4.1, §4.2, §4.4;
   AdicEtaleGeometry A4.3` to its *Needs*. Tested: for `G = ℤ/2` on `A × A` the trace is
   `(x, y) ↦ x + y`, onto for every `A` (also `p = 2`); for `|G| = 2`, `η² = N(η)` with
   `η = i₁b₁ + i₂b₂` gives `i₁²N(b₁) + i₁i₂t(b₁γ(b₂)) + i₂²N(b₂) ∈ I`.

Six findings: one P2 and five P3. All five findings of round 7 are repaired (table under
`## Verified sound`). The package elaborates (exit 0, ten `sorry` warnings and nothing else), the
dependency check is clean, no statement was found false, and every sampled locator matches its
source. What remains: four proof sketches that render a source proof sentence by sentence (R01), a
regularity hypothesis that the package's own theorem makes unnecessary (R02), a lemma used outside
its stated hypothesis (R03), the design-stage ids that two open roadmaps still cite (R04), an unused
import with a false sentence about it (R05), and a fact on Galois extensions that three proofs use
and no target states (R06). No file of the package was edited.

## Verified sound

### The findings of round 7

| Finding | Repaired passage (quoted from the files at this head) | Status |
| --- | --- | --- |
| F01, import the `S_r`-torsor | README §Scope: "the splitting torsor of a finite étale algebra (A4.3, *splitting-torsor-of-finite-etale-algebra*)"; §4.2: "through `ι`, `T` is a finite étale `S_{r−1}`-torsor over `S`" | repaired; A4.3 read on main at `TauCetiRoadmap/AdicEtaleGeometry/README.md:9428` (frame algebra `ε·S′^{⊗n}`, universal frame), A4.2 `isInvariant` at :9278 |
| F02, clause (3) statable | `Suggested.lean:406` `rootSaturation_completelyIntegrallyClosed`, no `hreg`; README: "Statements (1) and (4) need the Banach localisations" | repaired; the same pattern remains in clause (2): R02 |
| F03, `A = R` in the trace paragraph | README §4.7: "Here `A = R` is a perfectoid Tate ring …, `A° = powerBoundedSubring R`" | repaired |
| F04, namespace | README: "`TauCeti.Huber.PairOfDefinition.HasDenominatorPower`" | repaired; pin `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:311` |
| F05, Kummer locators | `Suggested.lean:513`: "§2.2, formula (8), p. 78"; :537: "§2.3, p. 78"; README §3.7: "in the Checks of §3.6" | repaired; ANDRE18B lines 314, 328, 333 |

The repair report marks nothing "not actionable".

### Principles, shape, Lean

All 50 targets, their API lists, Checks, *Needs* lines, the supplier contracts and the 35
declarations of `Suggested.lean` were read. No route-specific shortcut, re-planned roadmap, upward
supply, computational algorithm, sorry'd data, `set_option`, `lemma`, LaTeX delimiter, pull-request
number, date or machine path. Every definition has at least three Checks (3 to 9); the six layers
end with Examples and Dependencies. Elaboration with `lake env lean` from the content checkout:
**exit 0; ten warnings, all `declaration uses 'sorry'`** (lines 113, 162, 225, 302, 380, 406, 435,
562, 614, 673). `#check @name` for all 35 declarations in one scratch file: exit 0; each type was
compared with its README statement, and no declaration lost a binder. The `module` /
`public import` header is the form of 71 of the 187 `Suggested.lean` files on main.

One-tactic probe on all ten sorried theorems (`first | (intros; rfl) | (intros; simp; done) |
(intros; infer_instance) | (intros; trivial)`): ten failures, none closes. The two proved theorems
(`kummerIntegralStage_mono`, `isIntegral_kummerVar_zeta`) supply the membership proofs of later
definitions. **No padding.**

Headline theorems: §1.2 (both clauses stated), §1.3 (docstring: no derived tensor product of
complexes at the pin), §1.4 (kernel clause stated), §1.5 (stated), §3.6 ((2), (3) stated; (1), (4)
named), §3.11 (named), §4.5 (named), §4.7 ((3) stated; (1), (2) named), §5.8, §5.9, §5.12 (stated).
None statable and absent.

### Seeded source sample

No locator is flagged unverified by the author. All fifteen targets were read at their locators.

| Target | Text opened | Outcome |
| --- | --- | --- |
| 1.1 | BHATT18 lines 90–94 (§1.2, p. 2), 348–353 (Notation 4.1, p. 6), 374–395 (proof, p. 7); SCHOLZE12 line 1393 (Lemma 6.4) | matches; transition `u_{n+1}^e ↦ t^e u_n^e` |
| 1.2 | BHATT18 lines 355–370 (Theorem 4.2, p. 6), 396–417 (p. 7), 111–118 (Theorem 1.6, p. 3) | matches; (2) is stated for `n ≥ 0`, `c = pᵏm` |
| 1.3 | BHATT18 lines 418–426 (Remark 4.3, p. 7), 125–130 (Remark 1.8, p. 3) | matches |
| 1.5 | BHATT18 lines 119–124 (Remark 1.7, p. 3) | matches |
| 2.6 | ANDRE18A lines 1255–1281 (§2.8.1, (2.27)–(2.28), Exemples 2.8.2, Lemme 2.8.1, pp. 31–32) | matches |
| 3.3 | ANDRE18A lines 1988–2009 (§3.5.4, Déf. 3.5.2, Lemme 3.5.3, p. 46), 2032–2064 (Prop. 3.5.4, p. 47), 2065–2123 (Rem. 3.5.5(2), Lemme 3.5.5, Prop. 3.5.6, pp. 47–48) | matches |
| 3.5 | ANDRE18A lines 2468–2572 (§4.2.1, (4.3), Prop. 4.2.1, pp. 54–55), 2573 (Rem. 4.2.2, p. 55) | matches |
| 3.6 | ANDRE18A lines 2580–2632 (Th. 4.2.2, Lemme 4.2.3, Rem. 4.2.4, pp. 55–56), 2644, 2674 | matches; Lemme 4.2.3 has no regularity hypothesis |
| 3.9 | ANDRE18A lines 2841–2850 (Prop. 4.4.1, p. 60); GR03 lines 1070–1086 (Lemma 2.4.2(iii), pp. 22–23) | matches |
| 4.1 | ANDRE18A lines 295–365 (§§1.9.1–1.9.2, (1.1), footnote 6, Prop. 1.9.1, pp. 8–10) | matches; see R06 |
| 4.3 | ANDRE18A lines 2969–3003 (Prop. 4.4.4, pp. 62–63) | matches, with the README's correction of step (3) |
| 4.5 | ANDRE18A lines 3005–3049 (§5.1, Th. 5.2.1, Question 5.2.2, pp. 63–64) | matches |
| 4.7 | ANDRE18A lines 56–77 (Th. 0.3.1, p. 2), 3171–3200 (§5.3, Prop. 5.3.1, pp. 67–68) | matches |
| 5.4 | ANDRE18B lines 305–355 (§§2.1–2.3, (7)–(8), p. 78) | matches |
| 5.8 | ANDRE18B lines 385–548 (Th. 2.5.2, pp. 79–82), 575–586 (Rem. 2.6.1(4), pp. 82–83) | matches |

Also opened: ANDRE18A lines 915–1092 (Lemmes 2.5.1–2.5.3), 1163–1195, 2762–2834, 2906–2958,
3090–3160, 3201–3215; ANDRE18B lines 551–614; GR03 lines 1277–1298, and the pages of Lemma 5.2.1
(p. 106) and Lemma 5.3.3 (p. 111). No text was missing; `needs-references.toml` was not written and
the manifest is unchanged (five works, one key each, all certified).

### Adversarial table

`q = |ϖ|`, `0 < q < 1`; `P = K⟨T₁^{1/p^∞}, T₂^{1/p^∞}⟩`.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 annular tower | `g = 1`; `g = 0`; `g = (T, 0)` on `K°⟨T^{1/p^∞}⟩ × K°` | opens `X`, `∅`, annuli of the first factor; `u_{n+c}^e ↦ t^{ce}u_n^e`; `(0, 1) ∈ ker f_n` | keep |
| §1.2(1) Lean | `m = 0`; `n = 0`, `g = T` | `t⁰ = 1`, conclusion `b = t_l a`; `M_0 = (K°/tᵐ)[T^{±1/p^∞}]`, kernel `0`; `g^N a ∈ tᵐ` gives `t_l^N a ∈ tᵐ`, and `N/p^l → 0` | keep |
| §1.2(2) | monomial `g^{1/p^k}u_{n+c}^e`, `c = pᵏm` | `e ≥ p^{−k}`: `ce ≥ m`, zero; `e < p^{−k}`: `g^{1/p^k − e}t^{(n+c)e}`, exponent of `g` positive | keep |
| §0.5/§1.3 | `γ = g^{1/p^k}t^{1/p^l}`; `p = 2` | `γτ` factors through `H^{−1}[1]`; `t_{l+1}·g_k t_{l+1}τ = 0` and `t_l = t_{l+1}^p`, `p − 2 = 0` at `p = 2` | keep |
| §1.4 Lean | `g = 0`; `g = (T, 0)` | localisation `0`, conclusion `0·a ∈ tᵐR°`; `(t_kT_k, 0)(0, 1) = 0` while `(t_k, t_k)(0, 1) ≠ 0` | keep |
| §1.5 Lean | `g = 1`; `g = 0`; `g = (T, 0)` | limit `R°`; limit `0`, kernel `R°` killed by `(tg)_k = 0`; kernel `0 × K°` killed by `(t_kT_k, 0)` | keep |
| §2.3 `rootSaturation` | `g = 1`; `g = T`, `b = T^{−(1−1/p)}` | `R°`; `m = 1` exponent `2/p − 1 < 0` for `p ≥ 3`, `m = 2` exponent `−1/4` at `p = 2` | keep |
| §2.4 Checks | `K × K`, `g = (ϖ², 1)`, `λ = ϖ`, `a = (1, ϖ²)`; `λ = ϖ³` | first factor `K⟨U⟩/(ϖU − 1) = 0`, norm `q²`; `inf_m max(q^m, q^{2−m}) = q`; at `λ = ϖ³` both factors `K` | keep |
| §2.4(5), §3.10 (R03) | `B = (K + (T₁^{1/p^∞}P)^− + (T₂P)^−) × K`, `g = (T₁, 0)` | `B^♮ = (K + (T₁^{1/p^∞}P)^−) × K`; both localisations `P{ϖʲ/T₁} × 0`; `Ann(g) ∋ (0, 1)` | conclusion true, hypothesis of (5) fails: R03 |
| §3.3 | `B = K + (T₁^{1/p^∞}P)^− + (T₂P)^−` | `T₁^{1/p^k}P ⊆ B`; `T₂ ∈ B`, `T₂^{1/p} ∉ B` | keep |
| §3.5 | `R = K°/ϖ^r`, roots of `T` acting by `0` | `R[0] = 0` (`0 = 1`); `R[j] = k_K[U^{1/p^∞}]` for `j ≥ 1`; limit `k_K`; kernel `K°°/ϖ^r` | keep |
| §3.6(1) | `K × K`, `g = (1, 0)`; `g = (ϖ, 0)`; `g = 0` | limits `K°`, `K°` (`j ≥ 1`; `j = 0` empty), `0`; saturations the same | holds without regularity |
| §3.6(2) Lean (R02) | `K × K`, `g = (1, 0)`; cross in characteristic `p`, `g = (X, 0)` | both sides `K°`; both sides `K°⟨X^{1/p^∞}⟩`; general: `bⁿ ∈ R°g⁻¹` and `ΣR°mᵢ ⊆ ΣS mᵢ` | `hreg` not needed: R02 |
| §3.6(3) Lean | `K × K`, `g = (1, 0)`, `b = ϖ⁻¹`; `g = 0` | `|b|ⁿ = q^{−n}` unbounded, no finitely generated `K°`-module; zero ring | keep |
| §3.8 | constant system; `(1) ⇔ (2) ⇐ (3) ⇔ (4) ⇔ (5)` against ANDRE18A line 2783 | all five hold; directions agree | keep |
| §3.11 | disc; zero system | `ulim A[j] = A`, unit the identity; `ulim 0 = 0` | keep |
| §4.1 (R06) | swap on `A × A`; `ℤ[1/2][i]`; `ℤ[i]` | trace `(x, y) ↦ x + y` onto; `t(1/2) = 1`; image `2ℤ`, Galois-map determinant `±4` | fact true, not stated: R06 |
| §4.2(1) | `r = 1`; `r = 2`, `S = R[x]/(x² − a)`; `ℚ(2^{1/3})`; cyclic cubic | `T = S = R`; `δ² = δ`, `(x⊗1 − 1⊗x)δ = 0`, `(x⊗1 + 1⊗x)(1 − δ) = 0`; `T` a field of degree 6; 6 frames in 2 orbits, `T ≅ S × S` | keep |
| §4.2(2) | `S′ = ∏_G R ⊆ S` | `S = ∏ e_γS`, `S^G = e_1S = R`, so `S = S′` | keep |
| A4.3 contract | rank `r`; rank `0` | padding factors `(A/(1))^{…} = 0`; `T = R`, `S_0` trivial | keep |
| §4.3 | `B′ = A[1/g]^n`; `1/T` | envelope `(ulim A[j])^n`; norms `q^{−j}`, in the algebraic limit only | keep |
| §4.7(3) Lean | `R = K`, `g = 1`, `B′ = K × K`; `B′ = K × R` over `R = K × K` | trace `x + y`, `tr(c·a, 0) = c·a`; projective trace `(x + y₁, y₂)`, ranks `(2, 1)` | keep |
| §5.1 `IsPureHom` | `ℤ → ℤ[1/2]`; `2 : ℤ → ℤ`; `K[x, y]/(xy) → K[x] × K[y]` | `ℤ/2 ⊗ ℤ[1/2] = 0`; zero map on `ℤ/2`; `x = (x + y)(1, 0)`, `x ∉ (x + y)R` | keep |
| §5.2 definitions | `m = 0`; `m = V = ℤ`, `M = ℚ` | every module almost zero; `ℚ ⊗ ℤ/2 = 0`, `ℤ/2 ≠ 0` | keep |
| §5.3 | `R = S = K°`, `M = K°/K°°` | `K°°M = 0`, `R ∩ K°° ≠ 0`, `M ≠ 0`: Noetherian needed | keep |
| §5.4 encoding | `p = 2`; `j = 0`; `n = 0`, `g = 2`, `j = 3`, `l = 1` | `Φ₂(ζ₁) = 1 + ζ₁`, `ζ₁ = −1`; `ζ₀ = 1`; `u = ζ₈ + ζ₈⁻¹`, `u² = 2`, `e = (1 + X/u)/2`, `e² = e` | keep |
| §5.8 Lean | `n = 0`, `g = p`; `N = A°_∞0/p` | torsion-free over `K°_∞`; `M ⊗ N = Â°_∞∞/p` not killed by `ζ_{p²} − 1` (valuation `1/(p(p − 1))`) | keep |
| §5.9 Lean | `j = 0`, `l = 1`, `g = p`; `p = 2`, `g = 1`; `j` finite, `l = ∞` | coefficient-of-`1` retraction; diagonal `ℤ₂ → ℤ₂²` split; composite through `A°_∞∞` | keep; sketch R01(a) |
| §5.12 Lean | `m = 0`; `B = A`; `B = 0` | quotient ring `0`; almost isomorphism; excluded by `hinj` | keep; route R06 |
| gap complete-almost-nakayama | `ℤ_(p) → ℤ_p`; `ℤ_p → ℤ_p ⊕ ℚ_p` | identity of `𝔽_p` modulo `p`, not onto, in both | contract precise |
| gap principal-almost-flatness | `M = 𝔽_p` over `ℤ`; `M = ℚ_p` over `ℤ_p[x]` | `Tor₁ = 𝔽_p`; `M[1/p] = ℚ_p[x]/(x)` not flat | contract precise |

### Ownership, pins, suppliers

Pinned declarations opened (file and line at the pin): `TauCeti/RingTheory/Perfectoid/Basic.lean:86`,
`:102`, `:108`; `TauCeti/LinearAlgebra/Trace/Projective.lean:72`, `:96`, `:112`, `:147`, `:158`;
`TauCeti/RingTheory/Huber/Basic.lean:213`, `:474`; `TauCeti/RingTheory/Huber/Bounded.lean:109`;
`TauCeti/RingTheory/Huber/PowerBounded.lean:482`, `:598`;
`TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:311`, `Completion.lean:242`,
`CompleteSeparated/Basic.lean:91`, `Plus.lean:117`;
`TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basic.lean:146`, `:319`;
`Spa/Localization/PlusComparison.lean:219`; `Spa/StructurePresheaf/Stalk/Basic.lean:58`,
`GlobalSections.lean:81`, `:199`, `Plus/Basic.lean:116`, `:151`, `:225`;
`TauCeti/RingTheory/Almost/BasicSetup.lean:252`, `:261`; `TauCeti/RingTheory/Almost/Module.lean:75`,
`:86`; `TauCeti/CategoryTheory/Functor/ProZero.lean:67`;
`Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27`, `:32`;
`Mathlib/RingTheory/Filtration.lean:393`; `Mathlib/RingTheory/Flat/Tensor.lean:89`;
`Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:385`;
`Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:175`;
`Mathlib/Algebra/Category/Ring/Limits.lean:489`; `Mathlib/CategoryTheory/Category/Preorder.lean:157`;
`Mathlib/Algebra/Module/Torsion/Basic.lean:214`; `Mathlib/RingTheory/Perfection.lean:40`, `:507`;
`Mathlib/RingTheory/TensorProduct/Basic.lean:231`; `Mathlib/LinearAlgebra/Trace.lean:75`. All
exist with the content the README states. No pinned declaration proves a retained headline.

Cross-roadmap citations resolved now: PerfectoidSpaces on main, 31 target names, each found in the
section the README cites (for instance *change-of-basic-setup* at P0.16 :2206,
*almost-zero-limits-and-colimits* at P0.27 :3251, *tilt-of-uniform-tate-ring* at P1.7 :4082,
*integral-closure-almost-finite-etale* at P3.12 :8691); AdicEtaleGeometry A4.2 :9246, A4.2a,
A4.3 :9428; DerivedModuleAlgebra §0.K.1 :649 and the mapping of §1.T.1 :38; EnhancedDerivedSheaves
E2:towers.2 :1401; AdicSpaces §2.2, §3.1; AdicSpacesPartII R0.3, R0.4, R0.9; AdicSpacesPartIII
R3.5, R3.9; at open heads PerfectoidQuotients §1.3, §1.4, DerivedDeRhamCohomology §1.10,
DeformationAndDerivedPatchingAlgebra §1.13 (`flatCompletion_finiteComparison`),
PerfectoidShimuraVarieties §1.3, AdicSpacesPartV §1.7. The tool's one lead,
`Algebra.galoisTensorMap`, is A4.2's alias (`TauCetiRoadmap/AdicEtaleGeometry/README.md:9267`).

Dependency check:

```text
depcheck: 223 roadmaps, 1976 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier is on main or earlier in the merge order (the roadmap is at
line 80; DerivedDeRhamCohomology 23, PerfectoidQuotients 25, DeformationAndDerivedPatchingAlgebra
79); no forbidden supplier. The two declared gaps have the same slug, supplier, section and `needs`
in `design/plan.json` and in the README; both are precise and minimal (P0.26 at :3168 has the tight
form only; P0.11 has no gluing criterion). They are contracts, not findings.

The overlap file lists no second copy, conflicting head or dropped cited id; main has no
`PerfectoidSpacesPartII` folder. Object searches with `roadmaps grep` (almost-pro-zero, pure ring
maps, root saturation, Kummer tower, perfectoid Abhyankar, Riemann extension, Krull detection): the
other hits are consumers (DirectSummandsAndBigCohenMacaulay, FiniteEquivalenceRelations, which cites
§5.1 and `IsPureHom`, ArcTopologyAndDescent) or different objects. No declaration of
`Suggested.lean` has the fully qualified name of a declaration in a readable roadmap.

Overlap check: read DirectSummandsAndBigCohenMacaulay, PerfectoidQuotientsPartII, PerfectoidQuotients,
PerfectoidTowers, RelativeFarguesFontaine, PerfectoidSpaces, AdicEtaleGeometry, AdicSpacesPartIV;
almost algebra, perfectoid rings and ordinary almost purity belong to PerfectoidSpaces; monic-root
pairs to PerfectoidQuotients §1.4; the ind-syntomic André lemma to PerfectoidQuotientsPartII;
finite étale torsors and the splitting torsor to AdicEtaleGeometry A4.2–A4.3; Riemann extension, root
saturation, pure maps and the Kummer tower to PerfectoidSpacesPartII; the direct summand theorems to
DirectSummandsAndBigCohenMacaulay; nothing has two owners.

For the maintainer, not a finding: DirectSummandsAndBigCohenMacaulay declares
`gap:ramified-multielement-kummer` against this roadmap (Kummer flatness over ramified regular
bases with several discriminants). The README mentions that extension in §5.8 as a remark of the
source and has no target for it.

### Source independence and arrangement

Compared: the fifteen sampled passages and nine further ones (§0.4 with BHATT18 line 339; §1.2's
sketch with BHATT18 lines 396–417; §3.3's construction with ANDRE18A lines 2047–2057; §3.8 with
lines 2784–2825; §4.2's new sketch with lines 372–377; §4.3 with lines 2976–3003; §4.4 with lines
3096–3151; §3.9 with GR03 line 1070; the docstring of `kummer_isPureHom` with ANDRE18B line 551).
§4.2's sketch is independent of the source (frame algebra over `S`, not geometric fibres). Statements
share only formulas and forced hypotheses. Four sketches follow the source's proof sentence by
sentence: R01. The others are condensed (three or more source sentences to one) or reorganised.

Locators by source, counted as author key followed by a locator between Conventions and References:
ANDRE18A 80, ANDRE18B 28, BHATT18 20, GR03 8, SCHOLZE12 1. ANDRE18A's contents (line 14): Layer 2
takes §2.3, §2.5, §2.6, §2.8, §2.9 with ANDRE18B §1.2 inserted; Layer 3 merges §3 with §§4.2–4.4;
Layer 4 takes §1.9, Proposition 4.4.4 and §5. No layer is one chapter with the same scope, and the
order inside the layers is forced by the *Needs* lines (§3.6 needs §3.4–§3.5; §3.11 needs §3.6,
§3.8–§3.10; §4.3 needs §4.2, §3.10–§3.11; §4.4–§4.7 each need the preceding one).

Source independence: 24 passages compared with 5 sources, four proof sketches follow the source
sentence by sentence (R01), no other wording shared; largest share ANDRE18A, 80 of 137 locators;
contents compared with ANDRE18A: independent.

Maintainer notes: none were supplied.

## Not verifiable

- Elaboration checks the types of the admitted theorems, not their proofs; the mathematical checks
  are the source comparisons and the instances above.
- The probe used `rfl`, `simp`, `infer_instance` and `trivial`; no `exact?` search was run.
- The sketches of Layers 2–5 not listed under source independence were not compared with the
  sources line by line in this round.

## Source issues

- **Gap** in ANDRE18A at §4.4.2, p. 61: the source says the annuli of an almost perfectoid algebra and of its perfectoid coreflection agree by Lemme 2.6.2, which assumes a nonzerodivisor; it should use that `g` times a small scalar maps the unit ball into that of the coreflection; affects the proof.
- **Gap** in ANDRE18A at Lemme 2.5.3, pp. 26–27: the source says conditions (3) and (4) use closures that §2.5.5 defines only for a nonzerodivisor, while Lemme 4.2.3 applies them to every `g`; it should define them for the image of the unit ball; affects a stated result.
- **Gap** in ANDRE18A at Proposition 5.3.1(3), proof, p. 68: the source says the trace is almost surjective modulo `p` once the reduction is faithful and finite étale; it should reduce to the Galois case, where the trace is onto by a norm argument; affects the proof.
- **Misprint** in ANDRE18A at formula (2.17), §2.5.3(1), p. 26: the source says to invert `p` in the saturated integral ring; it should be to invert the pseudouniformizer, since in characteristic `p` inverting `p` gives zero; affects a stated result.
- **Misprint** in ANDRE18A at Lemme 2.5.3, proof of (2) ⇒ (6), p. 27: the source says condition (1) supplies the implication; it should be condition (2), which applies to elements of the larger localisation; affects nothing.
- **Error** in ANDRE18A at Lemme 2.6.3, proof, p. 29: the source says the norm of the image is the infimum of the norms of the multiples by powers of `g/λ`, bounded below by one; it should be the quotient norm, bounded below by the norm of the element at a spectral point; affects the proof.
- **Error** in ANDRE18A at Remarque 2.6.4(1), p. 29: the source says the restrictions between uniformised Laurent localisations are injective; it should be that a restriction can kill a factor, as for `K × K` and `g = (ϖ², 1)`; affects a stated result.
- **Error** in ANDRE18A at Théorème 0.3.1(1), p. 2: the source says the base embeds in the largest perfectoid algebra for every finite étale generic algebra; it should be a continuous structure map, injective when the generic algebra is faithful; affects a stated result.
- **Error** in ANDRE18A at Proposition 4.4.4, proof (3), p. 63: the source says the localised base embeds into the uniform limit of the annuli; it should be the algebraic limit, since the inverse of the coordinate has unbounded annular norms; affects the proof.
- **Gap** in BHATT18 at §1.4 Notation, p. 3: the source says `t` has compatible roots with a norm condition in characteristic zero only; it should require a nonzero topologically nilpotent `t` in characteristic `p` as well; affects a stated result.

The six further issues of ANDRE18B recorded in round 7 (Théorème 2.5.2 step (a), §1.2.1 formula
(2), §0.6, Annexe A.4, Lemme A.2.1(4), arXiv v1 §5.5) were not reopened in this round.

## For the human reviewers

- **Licence.** Most proof sketches of Layers 2–5 follow the order of the proofs in ANDRE18A and ANDRE18B, condensed and in English; R01 rewrites the four that track sentence by sentence. Whether the remaining condensed sketches need rewording is a human decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3dec31aa55c3d9ff8722ef266e99206e211657a6", "job": "REV-PKG-PerfectoidSpacesPartII~8", "model": "fable", "worker": "chris-x8"} -->
