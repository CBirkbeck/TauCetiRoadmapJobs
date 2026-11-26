# Review of ProfiniteCohomology (pull request #3177 at 5a08539)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 157 changed lines since `7e8e228`. Every added or changed passage of `README.md` was read against the pinned Tau Ceti and Mathlib and against the layers it cites (1.7, 2.1, 3.2 to 3.4, 4.2, 6.3, 6.4, 8.1, 8.2, 10.1, 10.5, 11.8, 12), and the two new targets (the coefficient-ring action and the cocycle counts) were computed on small cases; no finding remains, so the folder is accepted. There are four small corrections and one format note, none blocking: two sentences of the new *Cohomology objects* convention state its scope more widely than the layers do, one new Check holds for every candidate structure, and 3.4 does not name the `ZMod n`-module instances Tau Ceti already has on the explicit groups. One point is left for the human reviewers (the text of the most-cited source could not be read).

## C01 — The *Cohomology objects* convention calls `H2` a description of the canonical object for every topological group, but the degree-two comparison is only claimed for locally compact `G`

A consumer reading the convention alone would take an explicit degree-two statement over any topological group to be a statement about `continuousCohomology 2`, and for a group that is not locally compact the roadmap gives no way to pass between the two. The bullet opens "For a topological group `G`" and says "The explicit groups `H0`, `H1`, `H2` of Layer 2 are its description in low degrees" (Conventions, lines 92 to 96). Section 3.2 claims degree two only under `[LocallyCompactSpace G]` (`TauCeti.ContCohomology.explicitH2AddEquivContinuousCohomology`), its second Check says of the dense subgroup `⊕_ℕ 𝔽₂ ⊂ ∏_ℕ 𝔽₂` that "the degree-two comparison is not asserted for this `G`", and 3.4 says the roadmap does not decide whether the comparison holds in general; yet the *Groups* bullet keeps Layers 2, 5 and 8 at the generality of an arbitrary topological group.

Adding the hypothesis to the sentence is enough: "… are its description in low degrees: `H0` and `H1` for every topological group, `H2` for locally compact `G` (3.2)", with a clause that an explicit degree-two statement over a group that is not locally compact is a statement about `H2` alone.

## C02 — "The one statement made for an explicit group with coefficients that are not discrete" is not the only one: the new 2.1 target is stated for every topological module

The sentence (Conventions, lines 105 to 107) tells a reader that outside Layer 11's class-module theorem the explicit groups always have discrete coefficients, so that the comparison of Layer 3 always applies; the same change contradicts it. The new target of 2.1 says "The first two equations hold for every topological `G`-module `M`" (lines 694 to 695), Layer 2's complex and operations are defined for topological modules (Layer 11's inputs list them "at arbitrary topological coefficients", line 2617, and 11.8 says they "need no discreteness of the coefficients"), and Tau Ceti's `H1 G A`, `H2 G M` carry `[IsTopologicalAddGroup M] [ContinuousSMul G M]` with no `DiscreteTopology` (`ContCohomology/H2ZMod.lean:40`–`:42`).

The smallest repair is to say what is meant: "The one theorem about cohomology groups proved for coefficients that are not discrete is Layer 11's class-module theorem …; the definitions and formal identities of Layer 2, including the cocycle counts of 2.1, hold for every topological module, and for those coefficients the explicit group is the object of the statement."

## C03 — The second Check of *The coefficient-ring action* holds for every module structure, and its closing clause is not right

The Check (1.7, lines 594 to 595) reads: for `M = ZMod n` with `R = ZMod n`, "the scalar `n` acts as zero on every `Hⁱ`, which the `ℤ`-module structure alone does not say". In `R = ZMod n` the scalar `n` is `0`, and `0` acts as zero in any module, so no candidate instance fails it; moreover an abelian group has at most one `ZMod n`-module structure, so at this `R` no Check can separate two candidates. The closing clause misleads as well: by the target stated four lines above (agreement with the `ℤ`-module structure at `R = ℤ`) the integer `n` acts on `Hⁱ(G, ZMod n)` as the coefficient map of `m ↦ n • m = 0`, so the `ℤ`-structure does give `n • x = 0`.

A Check that can fail: trivial `C₂` on `M = ℤ[i]` with `R = ℤ[i]`. Then `H²(C₂, ℤ[i]) = ℤ[i]/2`, four elements, and `i` acts as multiplication by `i`, which sends the class of `1` to the class of `i ≠ 1`; a structure that let `R` act through a ring map to `ℤ` (or trivially) would fix the class of `1`. If the present Check is kept as a remark, "the integer `n` kills `Hⁱ(G, ZMod n)`, because it acts as the coefficient map of multiplication by `n`" is the true form.

## C04 — 3.4 introduces an `R`-module structure on the explicit `H1` and `H2` without naming the `ZMod n`-module instances the pinned Tau Ceti already has on them

The new sentence of 3.4 (lines 925 to 928) says the explicit groups "carry the `R`-module structure induced by `m ↦ r • m` on cochains", and the remaining-targets paragraph lists the `R`-linearity of the comparisons (3.4) as not implemented. An implementer who builds this as written adds a second structure at `R = ZMod n` beside `TauCeti.instModuleH1 : Module (ZMod n) (H1 G A)` (`ContCohomology/H1/ZMod.lean:83`) and `TauCeti.ContCohomology.instModuleZModH2 : Module (ZMod n) (H2 G M)` (`ContCohomology/H2ZMod.lean:46`), both global instances at the pin, defined from `n`-torsion and not from the action on cochains, and stated for topological (not only discrete) coefficients. The two structures are equal, a `ZMod n`-module structure being unique, but not by unfolding.

Name the two instances in 3.4 (or in 2.1) and add the one-line target that the structure induced on cochains is theirs at `R = ZMod n`, so that the general structure extends the existing ones.

## N01 — "this action as a `Module R` instance" (1.7) at `R = ℤ`

The carrier of `continuousCohomology n (ofDiscreteModule ℤ G M)` already has its `Module ℤ` from `TopModuleCat ℤ`; a global instance for all `R` gives a second one at `R = ℤ` that agrees only propositionally (the agreement is already a stated target). Would the text say whether the structure is meant as a global instance, a scoped one or a definition?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 `Nat.card W = Nat.card π(W) · Nat.card (W ⊓ B¹)` | trivial `C₂` on `𝔽₂`, `W = Z¹`; sign `C₂` on `ℤ/3`, `W = B¹`; `W = 0`; `W = Z¹(ℤ, ℤ)` infinite | `2 = 2·1`; `3 = 1·3`; `1 = 1·1`; `0 = 0·1` since `H¹(ℤ,ℤ) = ℤ` is infinite | true, also with the junk value | none |
| 2.1 `M ⧸ H⁰ ≃+ B¹`, `card B¹ · card H⁰ = card M` | sign `C₂` on `ℤ/3`; trivial `C₂` on `𝔽₂`; `G = 1`, `M = ℤ/5` | `d⁰ m (s) = −2m = m`: `3·1 = 3`; `1·2 = 2`; `1·5 = 5` | true | none |
| 2.1 `card Z¹ · card H⁰ = card H¹ · card M`, finite `M` | sign `C₂` on `ℤ/3`; trivial `C₂` on `𝔽₂`; `G = ⊕_ℕ C₂` discrete, trivial `𝔽₂` | `3·1 = 1·3`; `2·2 = 2·2`; `Z¹ = H¹ = Hom(G, 𝔽₂)` infinite, `0·2 = 0·2` | true; finiteness of `M` not needed for truth | none |
| 2.1 Checks (three) | as stated | `Z¹ = Hom(C₂, 𝔽₂)`, 2 elements, `B¹ = 0`; `f(s²) = f(s) − f(s) = 0` so `#Z¹ = 3`, `H⁰ = {m : 2m = 0} = 0`; wrong count gives `1 ≠ 3` | Checks true and discriminating | none |
| 1.7 coefficient-ring action is a left `R`-module | `r, s ∈ R` noncommutative; `r = 1`; `r + s`; `R = ℤ` | `(rs)• = (r•) ∘ (s•)` so `coeffMap` gives `(rs)x = r(sx)`; `coeffMap 𝟙 = 𝟙`; additivity from `map_add`; `n ↦ n·id` | well defined; needs only `SMulCommClass G R M` for equivariance | N01 |
| 1.7 Check, trivial `C₂` on `𝔽₄` | `H¹ = Hom(C₂, 𝔽₄)` | every element of `𝔽₄` is 2-torsion: 4 homomorphisms, `dim_{𝔽₄} = 1`, `dim_{𝔽₂} = 2` | true | none |
| 1.7 Check, `ZMod n` | any `ZMod n`-module `H` | `(n : ZMod n) = 0`, `0 • x = 0` always; integer `n` acts as `coeffMap (n•) = coeffMap 0 = 0` | vacuous; last clause misleading | C03 |
| 1.7 `R`-linearity of `map φ f n` | `φ = id`; restriction `C₄ ⊇ C₂`, `𝔽₄` trivial | `map φ f ≫ coeffMap (r•) = coeffMap (r•) ≫ map φ f` from `map_comp_coeffMap` (`Functoriality.lean`) since `f (r m) = r f(m)`; `res (cχ) = c res χ` | follows from pinned naturality | none |
| 1.7 agreement with `continuousCohomology n X`, `X : TopRep R G` discrete | `ofDiscreteModuleRestrictScalarsIntEquiv` at `RestrictScalars.lean:656` | type `continuousCohomology n (ofDiscreteModule ℤ G X.V) ≃+ continuousCohomology n X`: additive only at the pin, so `R`-linearity is a real target | as stated | none |
| 3.4 `R`-structure on explicit groups, comparisons `R`-linear | `(r f)(g) = r f(g)`; `d¹(r f) = r d¹ f` | `g • (r f(h)) = r (g • f(h))` by `SMulCommClass`; cochain correspondence `f(g₀,g₁) = g₀ • c(g₀⁻¹g₁)` commutes with `r` | true; existing `ZMod n` instances not named | C04 |
| Conventions, *Cohomology objects*: `H2` describes the canonical object | `ℚ_p` (locally compact); `⊕_ℕ 𝔽₂ ⊂ ∏_ℕ 𝔽₂` (not) | comparison at `CohomologyComparison.lean:214` under `[LocallyCompactSpace G]`; not claimed for the second | overstated in degree two | C01 |
| Conventions, "the one statement … not discrete" | 2.1 new target; Layer 11 inputs | "every topological `G`-module `M`" at line 694; `H2 G M` at the pin has no `DiscreteTopology` | inaccurate | C02 |
| Conventions, *Coefficient rings*: counterexample | discrete `ℝ`-vector space `V ≠ 0`, `v ≠ 0` | preimage of `{0}` under `r ↦ r • v` is `{0} ⊂ ℝ`, not open | kept from the merge base, true | none |
| Layer 4 intro: degree-two colimit is the case `n = 2` of 10.1 | 10.1 last sentence | "What remains here is the agreement with every Layer 4 system in degrees `0, 1, 2`": the agreement is stated there | consistent | none |
| Layer 6 intro: degree-two `cor` is 10.5's | `explicitH2AddEquivContinuousCohomology_corestriction` at `Corestriction/AllDegrees.lean:331`; `C₂ ⊇ 1`, `ℤ` | `corestriction U M hU 2 (explicitH2… x) = explicitH2… (explicitCor2 G M U hU x)`; 10.5 items 3, 4 list transitivity, `cor ∘ res`, Mackey | name and statement exact | none |
| Layer 8 intro: total degree two shapes are bidegrees of Layer 12 | `(0,2)`, `(1,1)`, `(2,0)` at `Cup/Comparison.lean:396`, `:412`, `:427` | each equates `(ofDiscreteModulePairing μ hequiv).cup p q` with `explicitCup02/11/20` through `explicitH2IsoContinuousCohomology`; sign `(−1)^{1·1} = −1` matches 8.3 | exact | none |
| Consumer contracts: pass to `H2` through `explicitH2IsoContinuousCohomology` and `discreteH2Equiv` | `CohomologyComparison.lean:435`, `LowDegree.lean:918` | `TopModuleCat.of ℤ (DiscreteH2 G M) ≅ continuousCohomology 2 (ofDiscreteModule ℤ G M)` under `[CompactSpace G]`, `[DiscreteTopology M]`; `DiscreteH2 G M ≃+ H2 G M` | hypotheses as written ("discrete coefficients over a compact group") | none |
| 11.8 exception: `H2 (G ⧸ V) V^ab(p)` | `G = ℤ_p`, `V = pℤ_p` | coefficients `ℤ_p` profinite, not discrete; `H²(C_p, ℤ_p) = ℤ/p`; comparison needs `[DiscreteTopology M]` | exception correctly stated in the consumer contract | none |
| 11.2 universe equality (`Suggested.lean`, headline, unchanged) | elaboration at this head | exit 0; warnings only `declaration uses sorry` at `:278`, `:286` | unchanged | none |

- Source locators checked against the text: 0; the diff adds no locator (0 of the 134 added lines cite a source).
- Library declarations opened at the pin: 15 (`ofDiscreteModule` `SmoothDiscrete/Basic.lean:223`, `ofDiscreteModuleMap` `:455`, `restrictScalarsIntIso` `RestrictScalars.lean:304`, `ofDiscreteModuleRestrictScalarsIntEquiv` `:656`, `coeffMap`, `coeffMap_id`, `coeffMap_comp`, `map_comp_coeffMap` `Functoriality.lean:289`–`:330`, `H1pi` `LowDegree.lean:834`, `discreteH2Equiv` `:918`, `corestriction` `Corestriction/AllDegrees.lean:103`, the degree-two transport `:331`, `explicitH2IsoContinuousCohomology` `CohomologyComparison.lean:435`, the three cup comparisons `Cup/Comparison.lean:396`–`:427`, `instModuleH1`, `instModuleZModH2`).
- The two new targets are not in the pinned Tau Ceti: no `Nat.card` statement on `Z1`, `B1` or `H1pi`, and no `Module R` instance on `continuousCohomology` of `ofDiscreteModule ℤ` (searched by object); the special `ZMod n` instances on `H1`, `H2` exist (C04).
- Record: 14 layers at the merge base, 14 at the head, no heading removed or retitled; the *Scalars* bullet of Conventions is replaced by *Coefficient rings*, which keeps its `ContinuousSMul` caveat and counterexample; no roadmap on `main` cites either renamed bullet by name.
- Cross-roadmap citations resolved: `ProfiniteCohomologyPartII` is on `main`; the sibling folders' new citations (*Coefficient rings*, *Counting*, *Cohomology objects*, §2.1 *Cocycle counts from class counts*) all exist at this head.
- Dependency check: `depcheck: 100 roadmaps, 1129 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean` (unchanged by the pull request): exit 0, `sorry` the only warning (two). Signatures unchanged, so no `#check` comparison was needed; padding probe not rerun (no declaration changed).
- Changes outside the folder: only the three sibling roadmap folders the pull request owns. The description agrees with the head sentence by sentence (the three conventions, the 1.7, 2.1, 3.4 targets, Layers 4, 6, 8, Scope items 5, 6, 7, 9, the consumer contracts, no `Suggested.lean` change).

Previous review (at `ed9bdba`, accepted): no finding to repair.

Overlap check: read QuadraticFormInvariants, ProfiniteProPGroups, LocalGaloisGroups (scope and supplier contracts on `main`: each consumes this roadmap and owns none of the changed objects), ArithmeticGaloisDuality, ClassFieldTheory and SelmerIwasawaCohomology (this pull request's changes: they cite the new conventions and 2.1 and do not restate them), and searched CohomologyOfGroups and every open head by object for the two new targets; nothing shared. IdelicReciprocityCountsAndCyclotomicClassGroups (open, under ShortGRH) states its own Selmer-type cocycle counts (4.4, 4.5), a different object from the class-to-cocycle relation of 2.1.

Source independence: changed passages only; 6 passages compared with 1 source (MilneADT), none shared; largest share NSW, about 68 of roughly 120 source citations, text not readable (uncertified); the diff adds, removes and reorders no layer, so the arrangement was not compared.

Research link: the README places the roadmap as the Galois-cohomology language of class field theory and the duality theorems; its class-module theorem is Neukirch–Schmidt–Wingberg (2008) (3.6.4), and the cocycle counts added here feed the Greenberg–Wiles formula of ArithmeticGaloisDuality. Rests on the README.

## Not verifiable

- NSW locators in the affected sections of the seeded sample (4.2, 6.3, 10.1: (1.2.5), (1.5.2), (1.5.7)): uncertified, cited by locator; untouched by the diff.
- Serre *Local Fields*, Koch, Brown, Ribes–Zalesskii locators in 6.3 and 8.2: no text in the sources cache; untouched by the diff.
- The remaining sampled sections (0.1, 1.2, 7.3, 9.4, 9.6, 10.7, 11.7, 13.1) lie in untouched text the change does not affect and were not re-read.

## Source issues

- none

## For the human reviewers

- Not tested: NSW has the largest share of the README's locators and its text could not be read (recorded as uncertified); wording and arrangement were not compared with it. The diff adds no locator into it.
