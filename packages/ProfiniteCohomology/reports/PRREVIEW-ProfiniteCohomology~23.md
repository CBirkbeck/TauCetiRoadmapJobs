# Review of ProfiniteCohomology (pull request #3177 at 5d66223)

**Verdict:** accepted

**Summary.** An incremental re-review of the 66 lines of `README.md` changed since `5a08539`: the previous review had no finding, and its four small corrections and its format note are all taken up correctly at this head (the changed sentences were read against the pinned Tau Ceti and the two reworked computations redone). No finding remains, so the folder is accepted. There are two small corrections, neither blocking: one clause of the new sentence of 3.4 and one bullet of the description that the change left behind. One point is left for the human reviewers (the text of the most-cited source could not be read).

## C01 — "so that it replaces them" in 3.4 would narrow the two `ZMod n` instances, which the pin states for every topological module

The new sentence of 3.4 (lines 942 to 944) asks that the structure induced on cochains be that of `TauCeti.instModuleH1` and `TauCeti.ContCohomology.instModuleZModH2`, "so that it replaces them rather than adding a second one beside them". The structure of 3.4 is introduced "For a discrete `M` with `[Module R M] [SMulCommClass G R M]`" (line 939), while the two pinned instances carry only `[IsTopologicalAddGroup A] [DistribMulAction G A] [ContinuousSMul G A]` and `[Module (ZMod n) A]`, with no `DiscreteTopology` and no `SMulCommClass` (`ContCohomology/H1/ZMod.lean:76`–`:83`, `ContCohomology/H2ZMod.lean:40`–`:46`). An implementer who replaces them as written loses the instances on non-discrete coefficients, which the *Cohomology objects* convention now says Layer 2 keeps.

The agreement target is right as it stands. Either end the sentence at "is theirs" (adding "where both are defined"), or state the cochain structure of 3.4 for every topological module on which each `m ↦ r • m` is continuous, which is what a replacement needs.

## C02 — The description still gives the fourth counting equation "for finite `M`" and does not mention the new target of 3.4

The description's bullet on 2.1 reads "`Nat.card Z¹ · Nat.card H⁰ = Nat.card H¹ · Nat.card M` for finite `M`". At this head the hypothesis is gone: "All four equations hold for every topological `G`-module `M`, with `Nat.card` zero on infinite types" (2.1, lines 708 to 709), and `π` is now any additive map on `Z¹` with kernel `B¹`. The bullet on 3.4 says only that the comparisons are to be `R`-linear; the head adds the target that the cochain structure agrees with the two pinned `ZMod n` instances.

Text that would be right: "… and `Nat.card Z¹ · Nat.card H⁰ = Nat.card H¹ · Nat.card M`, for every topological `G`-module `M`"; and "Layer 3.4 asks for the comparisons to be `R`-linear and for the structure on the explicit groups to agree with Tau Ceti's `ZMod n`-module instances on `H1` and `H2`."

## Previous findings

The previous report (at `5a08539`, accepted) had no finding. Its small corrections and format note, for the record:

- C01 — repaired: "`H0` and `H1` for every topological group, `H2` for locally compact `G` (3.2). An explicit degree-two statement over a group that is not locally compact is a statement about `H2` alone."
- C02 — repaired: "The definitions and formal identities of Layer 2, including the cocycle counts of 2.1, hold for every topological module … The one theorem about cohomology groups proved for such coefficients is Layer 11's class-module theorem".
- C03 — repaired: the `ZMod n` Check is replaced by trivial `C₂` on `M = R = ℤ[i]`, where `i` sends the class of `1` to the class of `i ≠ 1` in `ℤ[i]/2`.
- C04 — repaired: 3.4 names `TauCeti.instModuleH1` and `TauCeti.ContCohomology.instModuleZModH2` and makes the agreement a target; the clause "replaces them" is C01 above.
- N01 — repaired: "this action as a global `Module R` instance of low priority (so that at `R = ℤ` scalar multiplication keeps resolving to the `ℤ`-module structure of the object)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 `Nat.card W = Nat.card π(W) · Nat.card (W ⊓ B¹)`, `π` any additive map with kernel `B¹` | trivial `C₂` on `𝔽₂`, `W = Z¹`; sign `C₂` on `ℤ/3`, `W = B¹`; `W = Z¹(ℤ, ℤ)` | `2 = 2·1`; `3 = 1·3`; `0 = 0·1` (`π(W) ≅ ℤ` infinite). `W/(W ⊓ ker π) ≅ π(W)` for any such `π` | true, also with junk values | none |
| 2.1 `card B¹ · card H⁰ = card M`, now without "finite `M`" | sign `C₂` on `ℤ`; trivial `ℤ` on `ℤ`; `G = 1`, `M = ℤ/5` | `B¹ = 2ℤ`, `H⁰ = 0`: `0·1 = 0`; `B¹ = 0`, `H⁰ = ℤ`: `1·0 = 0`; `1·5 = 5` | true for infinite `M` | none |
| 2.1 `card Z¹ · card H⁰ = card H¹ · card M`, every `M` | sign `C₂` on `ℤ`; trivial `ℤ` on `ℤ`; sign `C₂` on `ℤ/3` | `Z¹ ≅ ℤ`, `H¹ = ℤ/2`: `0·1 = 2·0`; `0·0 = 0·0`; `3·1 = 1·3`. Product of the two preceding identities in `ℕ` | true; "All four equations" correct | none |
| 2.1 `π` = `H1pi` or its composite with `explicitH1AddEquivContinuousCohomology` | `LowDegree.lean:834`, `:859`; `CohomologyComparison.lean:145` | `H1pi = QuotientAddGroup.mk'`, kernel `B¹` (`H1pi_eq_zero_iff`); `H1 G M ≃+ continuousCohomology 1 (ofDiscreteModule ℤ G M)`, no hypothesis on `G` | names and kernels as stated | none |
| 1.7 Check, trivial `C₂` on `ℤ[i]` | `H² = M^G/N M`; `i − 1` | `N = 2`, `ℤ[i]/2` has 4 elements; `N(i − 1) = 2 < 4` so `i ≢ 1 mod 2`; `ℤ[i] → 𝔽₂`, `i ↦ 1` is a ring map (`−1 = 1`) and fixes the class of `1` | true and discriminating | none |
| 1.7 low-priority global instance | `R = ℤ` | default-priority `Module ℤ` of the `TopModuleCat ℤ` carrier is tried before a low-priority instance; agreement at `R = ℤ` is a stated target | consistent | none |
| Conventions, *Cohomology objects*: discrete `X : TopRep R G` | `RestrictScalars.lean:656` | `continuousCohomology n (ofDiscreteModule ℤ G X.V) ≃+ continuousCohomology n X`, namespace `TauCeti.ContCohomology` | name and direction exact | none |
| Conventions: `H2` only for locally compact `G` | `CohomologyComparison.lean:243` | `explicitH2AddEquivContinuousCohomology` stands in the section with `[LocallyCompactSpace G]`; degree one at `:145` needs none | as stated | none |
| 3.4 `ZMod n` instances | `H1/ZMod.lean:83`, `H2ZMod.lean:46` | both built from `n`-torsion (`QuotientAddGroup.zmodModule`, `AddCommGroup.zmodModule`); binders: topological `A`, no `DiscreteTopology`, no `SMulCommClass` | named correctly; "replaces" too wide | C01 |

The rows of the previous review for untouched statements stand as in that review, of `5a08539`.

- Source locators checked against the text: 0; the diff adds, changes and removes no locator. Of the seeded sample, 1.7, 2.1 and 3.1 to 3.4 touch the diff, and their changed sentences cite no source.
- Library declarations opened at the pin: 7 (`ofDiscreteModuleRestrictScalarsIntEquiv` `RestrictScalars.lean:656`, `H1pi` `LowDegree.lean:834`, `H1pi_eq_zero_iff` `:859`, `explicitH1AddEquivContinuousCohomology` `CohomologyComparison.lean:145`, `explicitH2AddEquivContinuousCohomology` `:243`, `instModuleH1` `H1/ZMod.lean:83`, `instModuleZModH2` `H2ZMod.lean:46`).
- Record: no heading, layer or item removed or retitled since `5a08539` or against the merge base (14 layers at both); `Suggested.lean` unchanged.
- Cross-roadmap citations resolved: the one line changed outside the folder since `5a08539` (ArithmeticGaloisDuality, a dependencies bullet "ProfiniteCohomology: Layer 2") matches its use of §2.1 *Cocycle counts from class counts*, which exists at this head.
- Dependency check: `depcheck: 94 roadmaps, 1061 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: exit 0, `sorry` the only warning (two, at `:278` and `:286`). No declaration changed, so signatures and the padding probe stand as before.
- Changes outside the folder: only the three sibling roadmap folders the pull request owns.

Overlap check: read QuadraticFormInvariants, ProfiniteProPGroups, LocalGaloisGroups, CohomologyOfGroups and ArithmeticGaloisDuality as in the previous review; the change adds no object, and the pinned `ZMod n` instances of 3.4 are Tau Ceti's and are cited; nothing shared.

Source independence: changed passages only; 4 passages compared with 1 source (MilneADT), none shared (the source has no counterpart of them); largest share NSW, about 68 of roughly 120 source citations, text not readable (uncertified); the diff adds, removes and reorders no layer, so the arrangement was not compared.

Research link: the README places the roadmap as the Galois-cohomology language of class field theory and the duality theorems; its class-module theorem is Neukirch–Schmidt–Wingberg (2008) (3.6.4), and the cocycle counts of 2.1 feed the Greenberg–Wiles formula of ArithmeticGaloisDuality. Rests on the README.

## Not verifiable

- NSW, SerreGC and the other book locators in the sampled sections (1.3, 1.4, 5.4, 6.3, 8.4, 8.7, 9.2, 9.5, 10.2, 11.1, 13.3): uncertified or not in the sources cache; all in text the diff does not touch, not re-read in this incremental review.

## Source issues

- none

## For the human reviewers

- Not tested: NSW has the largest share of the README's locators and its text could not be read (recorded as uncertified); wording and arrangement were not compared with it. The diff adds no locator into it.
