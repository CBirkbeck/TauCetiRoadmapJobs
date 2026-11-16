# Review of CongruenceSpectralGap (pull request #1504 at a40d0b8)

**Verdict:** accepted

No finding. The 20 changed lines replace the additive-character-sheaf contract on DeligneWeightsAndPurity by citations of FourierDeligneTransform §§2.2–2.3 and 2.5 (the sheaf) and DeligneWeightsAndPurity §2.13 (its weight); both resolve at the suppliers' open heads and say what is cited.

## Previous findings

- none: the previous report, of `1f44022`, had no finding (its R01–R03 bullets recorded repairs already made).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Additive-character sheaf, trace and torsor direction (README lines 126–128, 681; FourierDeligneTransform Conventions and §§2.2–2.3) | 𝔽₃, ψ(1)=ζ₃, x=1; 𝔽₉, x=1; both torsor descriptions | Torsor t−t^q=x: arithmetic Frobenius t↦t−x, geometric t↦t+x, descent through ψ gives ψ(x)=ζ. Supplier's t^q−t=x: geometric t↦t−x, push-out along ψ⁻¹ gives ζ. 𝔽₉: Tr(1)=2, trace ζ² | both descriptions agree; matches supplier's witness (ψ(1), not ψ(−1)) and its 𝔽₉ Check ψ(2) | none |
| Tensor, dual, trivial character and prime-field form (README line 128; supplier §2.2 laws, §2.5 and its API) | 𝔽₂ nontrivial ψ; ψ=1; c=0; phases 1,1 over 𝔽₃ and 𝔽₉ | 𝔽₂: trace at 1 is −1, tensor square (−1)²=1=trace of L₁. c=0: Lψ₀(0)=constant. Phases 1,1 over 𝔽₃: ζ·ζ=ζ²=ψ(2). Over 𝔽₉: ζ²·ζ²=ζ=ψ(Tr 2)=ψ(4) | each law cited is stated in supplier §2.2 (multiplicativity, Lχ⊗Lχ′, dual, L₁, base extension) or §2.5 (Lψ₀(cx), Lψ₀(−f)) | none |
| Weight zero (README lines 19, 124; DeligneWeightsAndPurity §2.13) | ζ₃ over 𝔽₃; −1 over 𝔽₂; trivial ψ | moduli 1, 1, 1; eigenvalue ψ(Tr x) a root of unity, Weil number of weight 0 | §2.13 states punctual purity of weight 0 and modulus-one traces for Lψ(f), and names this roadmap's §4.2b as consumer | none |
| `hyperKloosterman_bound` (consumes the sheaf through §4.2b; statement unchanged) | 𝔽₂, k=2, r=1 | one tuple (1,1), sum ψ(1+1)=ψ(0)=1 ≤ 2·√2≈2.83 | holds | none |

The rows of the previous reviews stand for every other statement, as in the review of `1f44022`: the diff changes no statement and no Lean line.

- Incremental re-review of 20 changed lines since `1f44022` (README only; `Suggested.lean` unchanged); `git diff --stat origin/main...HEAD` outside the folder is empty.
- Cross-roadmap citations resolved at open heads, 5: FourierDeligneTransform §2.2 (README line 246), §2.3 (262), §2.5 (283) and its Conventions (Lang torsor item, line 28: the `x−x^q`-through-ψ convention gives the same sheaf); DeligneWeightsAndPurity §2.13 (line 1194). FourierDeligneTransform line 626 and DeligneWeightsAndPurity §2.13 both name this roadmap's §4.2b as the consumer, and FourierDeligneTransform line 18 leaves Kloosterman sheaves to §4.2b: one owner each.
- No residue of the dropped contract: `additive-character-sheaf-weight` and `SchemeAndStackFoundations` occur nowhere in the README; no anchor links to the renamed supplier heading; the dropped slug is not among the six declared gaps.
- Source locators in the changed passages, 4 checked: katz-gkm line 2266 (§4.3 heading, p.59), line 2279 (the 1−F note), line 2288 (trace formula), line 2300 (sum-map isomorphism, p.60); each supports its sentence.
- Dependency check: `depcheck: 260 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line. FourierDeligneTransform and DeligneWeightsAndPurity are both earlier in the merge order, in that order.
- Gate rerun at this head: every counter 0, `OK`; the worker's gate adds `build=0`. Elaboration: `lake env lean` on `TauCetiRoadmap/CongruenceSpectralGap/Suggested.lean` gives only the three `sorry` warnings (lines 52, 63, 79).
- Title and description read against this head: 0 sentences contradicted; the prose names no supplier list that the change makes wrong (the generated `depends-on` block lists FourierDeligneTransform). Remark, no change asked: the declared gap `all-level-spectral-realization` has no `(gap:…)` sentence in the README, which states five of the six.
- Remark on untouched text, no change asked: the Check at README line 692 writes the phases 1 and 1 as ζ·ζ=ζ² inside its 𝔽₉ bullet; that value is the 𝔽₃ one (over 𝔽₉ it is ζ²·ζ²=ζ); the addition law holds in both.

Overlap check: read AutomorphicSpectralTheory, MaassForms, UnboundedOperators, and for the changed passages FourierDeligneTransform and DeligneWeightsAndPurity; the additive-character sheaf is owned by FourierDeligneTransform §§2.2–2.5, its weight by DeligneWeightsAndPurity §2.13, Kloosterman sheaves by this roadmap §4.2b; nothing else shared.

Source independence: changed passages only, 3 passages compared with 1 source (katz-gkm lines 2266–2303), none shared; largest share lrs95, 30 of 102 locator mentions; contents not compared again (no layer added, removed or reordered), and lrs95 could not be read.

Research link: Layers 1–5 state the bound of Luo–Rudnick–Sarnak (1995), λ′₁≥21/100 for congruence quotients, through the Gelbart–Jacquet (1978) adjoint lift and the Deligne–Katz (1988) hyper-Kloosterman estimate; this rests on the README's summary and references, and on gj78 and katz-gkm.

## Not verifiable

- `lrs95` is settled as uncertified (paywalled): its locators are cited by locator only and were not read.
- The description's “AI assistance” sentence and Lake's module-system notice describe the job board and the worker's build, not the head, and were not checked.

## Source issues

- none

## For the human reviewers

- **Not tested.** `lrs95` has the largest share of the README's locators (30 of 102 mentions) and is paywalled, recorded as uncertified: wording and arrangement were not compared with it (`TauCetiRoadmap/CongruenceSpectralGap/README.md`, References).
