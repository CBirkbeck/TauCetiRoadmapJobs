# FIX-RT-NashBlowups~2: repair of red-team round 2 (passes a and b)

Five findings in two reviews, none overlapping. I checked each one against the sources, the pins and the sibling
roadmaps, and found all five correct; all are applied. `Suggested.lean` is unchanged: no finding touches its three
declarations, their README statements (§§0.7, 4.4, 5.4) or its module docstring.
Edited files: `packages/NashBlowups/README.md` and `packages/NashBlowups/sources.toml` (two new locators). The plan's
`gaps` list stays empty, because every new input is a pinned declaration or a target of this roadmap.

## RT-NashBlowups~2a/F01 (P3) — applied

Witness confirmed: `𝔸²_k ⊔ 𝔸¹_k` with `d = 2` is smooth, and `X* = 𝔸² ≠ X`. Old (§2.5): "if `X` is smooth then `ν` is an
isomorphism". New: "if `X → Spec k` is smooth of relative dimension `d` (in particular if `X` is in the Setting and smooth,
§0.3)". The new text adds the one-line route (`σ_X` is a section of the separated Grassmannian, hence a closed immersion)
and the witness as a boundary case.
Same pattern elsewhere, repaired: the §2.2 Check "For `X` smooth the witness is `X`…" and the §6.4 Check "For `X` smooth,
both are isomorphisms" now say "smooth of relative dimension `d`". The §2.1 Check, §2.7 and §7.1 already carried `d`.

## RT-NashBlowups~2a/F02 (P3) — applied

Confirmed on main: `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §4.11 (lines 6838–6839) defines
`IsModification.Witness φ U` as a chosen dense open `U` over which `φ` is an isomorphism, with no clause on the preimage.
Old contract: "… isomorphism and whose preimage is dense". New: "… a chosen dense open of the target over which `φ` is an
isomorphism." §2.2 proves the density of `ν⁻¹(X_sm)` itself, and that density is what the pinned `IsModification`
asks for (`Modification/Basic.lean:55`).

## RT-NashBlowups~2b/F01 (P2) — applied

Confirmed. Stacks' proof of 06DF (stacksAlgebra lines 21518–21545) uses three things: the Nagata finiteness of
integral closure (lines 21525–21527), ascent of normality along smooth maps (line 21544), and going down plus Lemma
10.37.16. The proof of 0C30 goes through 037Z, which uses smooth ascent and faithfully flat descent (lines 21496–21503).
None of these is at the pins in that generality. Tau Ceti has ascent along étale maps only (`TauCeti/RingTheory/Etale/Normal.lean`, read).

Old → new: the 06DF bullet ("`A` geometrically normal, `B` normal ⇒ `A ⊗_k B` normal") becomes
*isNormal_tensorProduct_of_isTranscendentalSeparable* (`k'/k` separable, `B` normal ⇒ `k' ⊗_k B` normal), routed
through pinned declarations. New target: *isNormal_directLimit* (037D, line 4015). The 0C30 bullet is now derived
(`B = K`).

Also updated to match: the theorem's route, the second Check, the *Needs* line, Layer 0 Dependencies, Scope, and both
contracts. The route's pinned inputs are `TauCeti.MvPolynomial.isIntegrallyClosed`, the two étale lemmas,
`Algebra.Etale.baseChange` and `Algebra.Etale.iff_exists_algEquiv_prod`; no colimit lemma for normal rings exists at
the pins, hence the new target.

Why not keep 06DF in full: its general form needs Nagata finiteness, smooth ascent and Lemma 10.37.16, and no
consumer uses it. The theorem 0C3M stays at full generality, and the definition *Algebra.IsGeometricallyNormal* keeps
its four Checks.

## RT-NashBlowups~2b/F02 (P3) — applied

Confirmed. A flat `g` lifts generalisations (stacksNormalization, Lemma 29.26.9, tag 03HV, line 2125), so the generic
points of `X'` map to generic points of `X`. Since `X` is locally Noetherian, those lie in the dense open `U`.
Old: "… from a reduced locally Noetherian scheme such that `g⁻¹(U)` is dense". New: that hypothesis is dropped, and a
sentence derives the density. In the third Check, "flatness and density are needed" becomes "(not flat; here
`g⁻¹(U) = ∅` is not dense) … flatness is needed".
Other places with the same pattern: §§2.6 and 6.3 already derive the density from flatness, and no target carries it as
a hypothesis.

## RT-NashBlowups~2b/F03 (P3) — applied

Confirmed at the pin: `TauCeti.AlgebraicGeometry.pushforwardDerivation` (`Modules/Differentials/Restriction.lean:40`)
and `TauCeti.AlgebraicGeometry.relativeDifferentialsSpecIso` (`…/Spec.lean:268`). Old: "applied to the pushforward
derivation and the pullback–pushforward adjunction". New: the text names Tau Ceti's `pushforwardDerivation` and
Mathlib's `Scheme.Modules.pullbackPushforwardAdjunction`, and the affine bullet now holds "under
`relativeDifferentialsSpecIso`". All three names are added to the contracts and to the *Needs* lines of §§0.1 and 0.2.
Same pattern elsewhere: the backward step of the §0.7 stalk criterion also identifies `Ω_{X/k}` on `Spec A` with the
sheaf of `Ω[A⁄k]`. It now cites `relativeDifferentialsRestrictIso` and `relativeDifferentialsSpecIso`, and its *Needs*
line does too. `Scheme.Modules.pullback` was cited in a *Needs* line but missing from From Mathlib; it is now listed there.

## Checks

- **Elaboration.** From the content checkout, `lake env lean packages/NashBlowups/Suggested.lean` exits 0. Its only
  output is two `declaration uses 'sorry'` warnings, at lines 71 and 87. All imported `TauCeti.*` object files were present.
- **`#check @name`.** I elaborated one scratch file: a copy of `Suggested.lean`, plus `#check @` for its three
  declarations and for every pinned name the repair adds.
  - The three declarations elaborate to the types in the job's signature file, with every binder kept. Their README
    statements (§§0.7, 4.4, 5.4) are unchanged, and nothing changed in the Lean.
  - These cited names all elaborate at the pins: `pushforwardDerivation`, `relativeDifferentialsSpecIso`,
    `Scheme.Modules.pullback`, `Scheme.Modules.pullbackPushforwardAdjunction`, `Algebra.IsSeparablyGenerated`,
    `Algebra.Etale.iff_exists_algEquiv_prod`, `Algebra.Etale.baseChange`, `isIntegrallyClosed_of_isLocalization`,
    `IsLocalization.isDomain_of_le_nonZeroDivisors`, `TauCeti.MvPolynomial.isIntegrallyClosed`,
    `TauCeti.Algebra.Etale.isDomain_localization_atPrime_of_localization_under` and
    `…isIntegrallyClosed_localization_atPrime_of_localization_under`. None of the elaborated statements needs a
    Noetherian hypothesis.
  - The scratch file did not import the module of `IsModification`, which I read at the pin instead.
- **Citations.** `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found
  nowhere.
- **Dependency check:**

```
depcheck: 239 roadmaps, 2246 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.

No gate failures were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.5 corollary (new form) | `∅`, any `d`; `𝔸¹`, `d = 1` and `d = 0`; `𝔸² ⊔ 𝔸¹`, `d = 2`; `Spec K`, `K/k` finite separable, `d = 0`; line with doubled origin, `d = 1` | `X* = ∅ = X`; `X* = 𝔸¹` / `𝔸¹` not of rel. dim. 0 and `X* = ∅`; `X* = 𝔸² ≠ X`, excluded; `Ω = 0`, `X* = X`; `Gr_1 → X` separated, so `σ_X` is a closed immersion and `X* ≅ X` | holds; no separatedness of `X` needed | stated |
| §2.2, §6.4 Checks | smooth of rel. dim. `d` versus `𝔸² ⊔ 𝔸¹`, `d = 2` | `ν` iso, `X` normal, `ν̄` iso / `X̄* = 𝔸² ≠ X` | holds | `d` added |
| §4.11 contract | main lines 6838–6839; pin `Basic.lean:55` | Witness: dense `U`, `φ` iso over it; `IsModification`: also `Dense (f⁻¹ᵁ U)` | contract matches supplier | clause dropped |
| §1.5 base change | inclusion of `U`; `Spec O_{𝔸²,0} → 𝔸²`, `U = 𝔸² ∖ 0`; `{0} → 𝔸²` | `g⁻¹U = U`; contains the generic point, dense; not flat, `g⁻¹U = ∅`, `ℙ¹ ≠ ∅` | density automatic; flatness needed | hypothesis derived |
| *isNormal_directLimit* | constant system; `k[x] → k → k → …` (`x ↦ 0`); zero rings; `ℚ̄ ⊗_ℚ ℚ̄` | colimit `R`; `k`, local rings `k[x]_{(x)} → k`, `b ≠ 0` at each stage; `0`, no primes; absolutely flat, local rings fields | holds; needs neither injective transition maps nor Noetherian rings | new target |
| *isNormal_tensorProduct_of_isTranscendentalSeparable* | `ℚ(i) ⊗ ℚ(i)`; `k(s) ⊗ K`; `k(t^{1/p}) ⊗ k(t^{1/p})`; `B = 0`; `B = k × k`; `B = k[x_1, x_2, …]`; `B` = node; `B` = the curve `C`, `k' = k(s)` | `n = 0`, `ℚ(i)²`; `n = 1`, localisation of `K[s]`; not separable, nilpotent `y − τ`; `0`; `k' × k'`; `k'[x_1, …]`, the pinned instance asks no Noetherian; not normal, excluded; localisation of the normal `B[s]` | holds | replaces 06DF bullet |
| 0C30 bullet (derived) | `K ⊗ ℚ(i)`; `K ⊗ k(s)` | `K(i)` or `K × K`; normal domain | holds | route added |
| §0.6 theorem route | the four theorem Checks | `ℚ(i) × ℚ(i)`; `C_{k'}` not normal for inseparable `k'`; `k(s)[y]` principal ideal domain; `ℚ̄ ⊗ ℚ̄` absolutely flat | unchanged values | route cites new bullet |
| §0.1 construction | `t ↦ (t², t³)`, characteristic 0 and 2; identity of `𝔸¹` | the pushforward derivation sends `x ↦ 2t dt`, `y ↦ 3t² dt` (char. 2: `0`, `t² dt`); `dx ↦ dx` | Checks unchanged | names added |
| §0.7 stalk criterion | `𝔸¹`, `d = 1`; node, `d = 1` | `Ω[k[x]⁄k] = k[x]dx` on `Spec k[x]`; no surjection at the origin | unchanged | names added |

## Ownership, sources, overlaps

- **Ownership.** `roadmaps grep` covers main and the open heads. I searched for colimits of normal rings (037D,
  10.37.17), for 033C, ascent of normality, `isNormal_tensorProduct`, 06DF, 0C30 and 0C3M, and for geometric normality.
  The only hits are uses as a hypothesis: PELModuli cites 033C, and SchemeAndStackFoundations, AdicSpacesPartIII and
  others assume "geometrically normal". No roadmap states either new target, so this roadmap owns them. No declaration
  of `Suggested.lean` changed.
- **Sources.** The two new locators are both in cached texts: stacksAlgebra line 4015 (037D) and stacksNormalization
  line 2125 (03HV). Both are recorded in `sources.toml`. No text was missing, and no `needs-references.toml` was written.
- **Overlaps.** `scratch/overlaps.md` lists no second copy, no dropped id and no other pull request on this folder.

## For the maintainer

- Renamed italic target: *isNormal_tensorProduct_of_isGeometricallyNormal* → *isNormal_tensorProduct_of_isTranscendentalSeparable*.
  New italic target: *isNormal_directLimit*. No other roadmap, on main or at an open head, cites either old or new
  name. These are README targets only, not Lean declarations.
- No text in the reviews asked for anything outside this job.
