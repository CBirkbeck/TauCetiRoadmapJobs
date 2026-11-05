# FIX-RT-GeneralAlgebraicKTheoryPartII~2

## RT-GeneralAlgebraicKTheoryPartII~2a/F01 (P3) — applied

The witness holds. In K(1)-local KU_p^∧-modules the local colimit of multiplication by p on R is zero, while the colimit of π₀Map_R(R,R) along it is ℚ_p, so the unit is not compact. BSY define nilpotence detection on compact T(n)-local R-modules, with tensor nilpotence (bsy lines 88–92, Definition 1.3; line 1832, Definition 4.11). The proof of nil-conservativity also argues through compact objects, not the unit (bsy line 2059, Lemma 4.32).

§6.1a, definition: "for every map f out of a compact R-module" → the localized category is named, maps are between compact localized modules, nilpotence means a tensor power is null, and the KU_p^∧ remark is added. First Check: "the identity of the compact module R" → the argument through a compact dualizable C (C is a retract of C⊗C⊗C∨, so C=0) and compact generation, citing bsy line 2059. The KU_p^∧ control is added: R/p is nonzero and compact.

Pattern search: "compact module R", "compact R-module" and "detects nilpotence" occur only in §6.1a, plus the §6.2 route. The §6.2 route says "nilpotence detection forces A≠0", which the corrected Check now justifies. The Hℚ[x] Check is unaffected, because the rational unit is compact.

## RT-GeneralAlgebraicKTheoryPartII~2a/F02 (P3) — applied

Verified. agh line 1541 attributes the regularity of ko and tmf to Barwick–Lawson. The primary proofs are barwick-lawson line 207 (Proposition 3.1, Wood's cofiber and then the Bott cofiber give Hℤ perfect over ko), line 220 (Corollary 3.2), line 253 (Proposition 4.1: c₄, c₆ away from 6, Hill at 3, Mathew at 2) and line 299 (Corollary 4.2). I fetched the text legally from arXiv:1402.6038v2 and added it to `sources.toml` as `barwick-lawson`.

§8.9 locator: "lmmt … secondary citation …; agh line 1541" → barwick-lawson lines 207, 253 and 299 as the primary source, agh line 1515 (Proposition 4.4) for the nonconnective extension, and lmmt as background. The proof route now names the Wood and Bott cofibers, the c₄/c₆ sequences on tmf[1/6], the separate mod 2 and mod 3 finiteness, and the c₄/Δ²⁴ cover. A References entry was added; it records the source's Δ-versus-surviving-power misprint (barwick-lawson lines 303–306).

Pattern search: no other "secondary citation" remains. §3.4's agh line 1515 citation was already primary.

## RT-GeneralAlgebraicKTheoryPartII~2b/F01 (P3) — applied

The overlap is real. KTheoryFiniteLocalFields §0.4, at the head given by the roadmap service, builds `heightOneFromZeroSpace` for p odd. It is a functor on the pointed homotopy category to KU/p-local spectra with Φ_p(Ω∞₀X)≃`heightOneLocalize X`. KTheoryFiniteLocalFields comes earlier in the merge order.

- **Scope paragraph:** now records that KTheoryFiniteLocalFields §0.4 owns that functor, and that §4.11 is the coherent functor for every prime and every n≥1.
- **§4.11:** says what it adds beyond §0.4: p=2, n≥2, the coherent finite-source formula and uniqueness. It states the comparison at n=1, p odd. The Ω∞ versus Ω∞₀ step holds because type-one sources are connected.
- **`*Needs:*` line:** §0.4 and §4.20 are added, for the comparison only.
- **"From TauCetiRoadmap.KTheoryFiniteLocalFields" contract and Layer 4 Dependencies:** §0.4 is added to both.

I rejected the reviewer's phrase "identified by that uniqueness". The supplied functor lives only on the homotopy category, and it is not given the coherent finite-source structure that §4.11's uniqueness needs. So the identification is stated as a comparison on homotopy categories, compatible with the two zero-space equivalences.

## RT-GeneralAlgebraicKTheoryPartII~2b/F02 (P3) — applied

Verified. §4.19 is stated only for L_n-local spectra. K(A) is arbitrary, and the reviewer's control A=Hℤ at p=2 holds: it is K(1)-acyclic, but L₁Hℤ=Hℚ.

- **§9.1 `*Needs:*`:** §4.19 → §4.4 and §4.20.
- **§9.1 route:** now says how each is used. §4.4 (or §4.20) turns the ring's K(1)-acyclicity into T(1)-acyclicity, and §4.20's equality of Bousfield classes turns the T(1)-equivalence into a K(1)-equivalence. The Hℤ control is included.
- **§6.7 `*Needs:*`:** §4.4 is added. §4.19 is kept there, because the ordinary-tower graded pieces are L_n-local.

I did not add BordismFormalGroups F6.3: §4.20 already gives Bousfield-class equality. The Layer 9 and Layer 6 Dependencies lines already list "Layer 4", so they need no change.

Pattern search over every §4.19 citation (§§4.20, 4.30, 5.4 Check, 6.7, 9.1): only §9.1 applied it to a spectrum that is not L_n-local.

## RT-GeneralAlgebraicKTheoryPartII~2b/F03 (P3) — applied differently

Correct: P(1)=1 and P(xy)=P(x)P(y) repeat the contract, and the wrong models satisfy them too. Instead of the reviewer's P(−1) text, I replaced the bullet with one that excludes the two named wrong models through stated laws:

- The pulled-back identity x↦c(x) gives res P(2)=2≠4.
- The pulled-back power x↦c(x^p) breaks additivity modulo transfer. c(4)−2=c(2)≠0 in E⁰(BC₂)/([2](z)/z), which is free over E₀ of rank 2^(h+1)−1 with 1 as a basis element (Weierstrass division).

The reviewer's P(−1) remark is true but excludes neither model. The same restated laws were also removed from the combined last Check of the block.

## Adversarial pass on changed text

| Statement | Instances | Values | Result |
|---|---|---|---|
| §6.1a nilpotence definition | R=KU_p^∧, K(1)-local; R=Hℚ[x] rational | colim of ×p on R is L_K(1)(R[1/p])=0, but colim π₀End(R)=ℚ_p, so R is not compact; rational unit is compact | definition now on compact localized modules, tensor nilpotence |
| §6.1a Check A≠0 | A=0 with R=KU_p^∧; R=0 | R/p compact, (R/p)^{⊗_R k}≠0 (π₀=𝔽_p), so R→0 does not detect; R=0: Mod_R=0, allowed | holds without compact unit |
| §8.9 ko route | Wood and Bott cofibers | cofib(η)=ku, cofib(β:Σ²ku→ku)=Hℤ, Hℤ has two ko-cells after two cofibers | Hℤ perfect over ko |
| §8.9 tmf route | p=2, 3; away from 6 | after inverting 6, Hℤ⊗_tmf Hℤ vanishes above degree 22 (= 8+12+2 from the c₄ and c₆ cofibers); mod 2 Tor algebra 𝔽₂[ξ₁,ξ₂,ξ₃]/(ξ₁⁸,ξ₂⁴,ξ₃²), dimension 8·4·2=64; Δ²⁴ in degree 576 | finite Tor amplitude; surviving power used |
| §4.11 n=1, p odd comparison | X=Hℤ_p; X=KU_p; Y=point | Φ₁Ω∞Hℤ_p=0=Φ_p(Ω∞₀Hℤ_p); Φ₁Ω∞KU_p=KU_p=heightOneLocalize KU_p; both send point to 0 | consistent with both supplied Checks |
| §4.11 Ω∞ versus Ω∞₀ | V connected type-one, X=Hℤ (π₀ only) | Map_*(V,Ω∞X)=Map_*(V,Ω∞₀X) for connected V; both sides give 0 | equal values |
| §9.1 route | A=Hℤ, p=2; A=H𝔽₃, p=3 | K(1)⊗Hℤ=0, so T(1)⊗Hℤ=0 (§4.4); L₁Hℤ=Hℚ≠Hℤ, so §4.19 does not apply; 𝔽₃[1/3]=0 and L_K(1)K(𝔽₃)=0 | route closes through §4.4 and §4.20 |
| §4.26 replacement Check | p=2: models c(x), c(x^p), true P | res: 2, 4, 4; mod transfer, P(2)−2: 0 for c(x), c(2)≠0 for c(x^p), 0 for true P | both wrong models excluded |

## Checks

- **Elaboration:** `lake env lean packages/GeneralAlgebraicKTheoryPartII/Suggested.lean` exited 0 with no output. The only change to `Suggested.lean` is the `module` header added for the gate failure (below). The file declares nothing, so the `#check @name` comparison has no entries. No changed target became statable.
- **Dependency check:**

```text
depcheck: 186 roadmaps, 1223 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The new supplier citation, KTheoryFiniteLocalFields §0.4, is earlier in the merge order.

- **Citation resolver:** no unresolved roadmap citation and no Lean name found nowhere.
- **Sources:** `sources.toml` and References both have 33 entries. The new one is `barwick-lawson`, open-repository and certified. No text is missing, so no `needs-references.toml` was written.

## Gate failure

- Warning that `import Mathlib` expects the module system: added a `module` header line before `import Mathlib` in `Suggested.lean`, following `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` on main. The import line is unchanged. The file declares nothing, so making declarations private by default affects nothing. Elaboration now exits 0 with no warning, and the dependency check output is unchanged.

## Notes for the maintainer

- §4.11 now cites KTheoryFiniteLocalFields §0.4 by its names `heightOneFromZeroSpace` and `heightOneLocalize`, at the head given by the roadmap service. If that roadmap renames them, §4.11, the scope paragraph and the supplier contract must follow.
- No declaration names changed, and no gaps were added or removed: `design/plan.json` is untouched.
- Ownership against open pull requests was checked for §0.4 through the roadmap service's grep and `show`.
- Neither review contained any instruction-like text.
