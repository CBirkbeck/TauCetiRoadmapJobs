# Review of HeckeStacksAndLocalShtukas (pull request #1252 at 5775c9b)

**Verdict:** accepted

Incremental re-review of the 42 lines changed since bcb41c1 (title, Summary sentence, VectorBundlesAndIsocrystals layer labels, the HS1.9 transport paragraph, the expanded HS4.2 torus Check and the new AG2.6-instance Check), plus everything that cites them. Two P3 notes; nothing blocks.

## R01 (P3) — The HS1.9 transport paragraph names the Weil element `γ_i` and then `τ_i`

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:995–996`: “Let `γ=(γ_i)∈W_E^I` act on `(Spd C)^I` over `(Div¹)^I` by `g_γ`, the automorphism `τ_i∘Frob^(−deg_ar(τ_i))` in the `i`-th leg”.

**Claim:** `g_γ` is the Drinfeld action of the tuple `γ`.

**Witness:** The sentence binds `γ_i` and then writes the automorphism in an unbound `τ_i`; the Conventions (line 162) use `τ` for a single Weil element, so the reader has to guess that `τ_i = γ_i`.

**Repair:** Write `γ_i∘Frob^(−deg_ar(γ_i))`.

## R02 (P3) — “Excluded by the homomorphism requirement” needs the non-abelian qualifier

**Location:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:2375` (end of the torus Check): “Taking the pullback `g_γ^*s=s·rec_HS(γ)⁻¹` for the transported section inverts both factors and is excluded by the homomorphism requirement of HS1.9.”

**Claim:** The pullback transport is not a homomorphism, so the torus witness cannot be computed with it.

**Witness:** On the torus instance both `γ ↦ χ(rec_HS(γ))` and `γ ↦ χ(rec_HS(γ))⁻¹` are homomorphisms `W_E → Λ^×` (the target is abelian). What excludes the pullback is the uniform requirement of HS1.9 for every `G`: `γ ↦ ψ_γ∘g_γ^*` composes as `ρ(γ)ρ(γ′) = ρ(γ′γ)`, an anti-homomorphism, which differs from a homomorphism exactly when the image is non-abelian (`GL_2`, `V` the standard representation, `γ, γ′` with non-commuting images).

**Repair:** “…and is excluded because the uniform transport of HS1.9 must be a left action of `W_E^I` for every `G`; on a torus alone both signs are homomorphisms.”

## Previous findings

- R01 — repaired: the value `χ(rec_HS(γ_1γ_2⁻¹))` is kept, HS1.9 (lines 995–1002) now pins the covariant transport (`ψ_γ⁻¹`, pushforward `γ(s)=(g_γ)_*s`), the Check at line 2375 computes the witness in that direction, and the new Check at line 2377 states AG2.6's instance and its `2`/`3` assignment explicitly. This is the second of the two repairs the previous report offered; the disagreement with the supplier is now visible and attributed (details under Verified sound).
- R02 — repaired: lines 7–8 read “chains on the imported global Hecke stack, twisted period spaces, …”.
- R03 — repaired: line 41 “Layers 0–6”; lines 266 and 323 “Layer 0's … (‘Marked untilt Cartier divisors and Cartier descent’)”; lines 424, 541, 1365, 1744 “Layer 5, ‘…’”; line 1168 “Layer 6, ‘The integral boundary and group torsors’”; the VB1 citation at line 1711 is dropped; line 1792 “Layers 0, 5 and 6”. All resolve at #1205 (table below).
- R04 — repaired: line 1 “# Roadmap: Hecke stacks and local shtuka cohomology”.

## Verified sound

**Gate, build, dependency check, outside diff.** The gate rerun on this head returns `OK` with every counter 0 (exit 0). `lake env lean` on `TauCetiRoadmap/HeckeStacksAndLocalShtukas/Suggested.lean` exits 0 with no output; the file still declares nothing (module docstring naming the six non-statable headline groups), so there is no signature to probe and no padding to test. The movable dependency check returns exactly

```text
depcheck: 205 roadmaps, 1671 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The merge order lists VectorBundlesAndIsocrystals at 110, AutomorphicGaloisRepresentationsPartII at 149, BunGAndNewtonStrata at 172 and this roadmap at 174: every supplier the diff touches is earlier.

**The R01 repair, checked.** Three things were verified.

1. *The source claim.* The new Check cites the proof of FS Theorem IX.7.2, p. 336. FS lines 13022–13031 (printed p. 336): for `A_N` concentrated on `Bun^{b_N}_G`, `b_N = bμ_N(π)`, and `V` of highest weight `μ_N`, `T_V(A_N)|_{Bun^b_G}` is `σ`, the unique modification being the pushout of the standard modification `O → O(1)` along `μ_N`. With FS's slope convention (FS lines 2205–2207: `O(n)` is the image of `(Ĕ, π^{−n}σ)`, the functor reverses slopes), `E_{bπ^N} = E_b(−N)` for `G_m`, so FS's `T_{χ_N}` carries the degree-`(d−N)` stratum to degree `d`: `T_{χ_1}` sends `d` to `d+1`, exactly AG2.6's `T_1` (AG2.6 line 2576) and HS1.2's `c_1: (L,D) ↦ L(−D)`. The README's sentence “the functors agree, not their labels” is therefore right, and AG2.6's sentence that its Satake labels are opposite to Fargues–Scholze's (AG2.6 lines 2620–2621, sourced to “the proof of Theorem IX.3.1, p. 324, for their labelling”) rests on FS's undefined `b ∈ B(G,μ)` at p. 324, the only occurrence of that symbol in the book (see Source issues). That is a defect of the supplier's Check, not of this roadmap; it is recorded here as data for AG2.6's author.
2. *The value.* With the torsor `P` of sections of `O(1)` with divisor `D`, on which `W_E` acts by pushforward `s ↦ s·rec_HS(γ)` (the definition of `rec_HS`, HS2.18 line 1749), the stalk of the character sheaf at `L(−D)` is `P ×^{E^×} V` through `t = (·s): L(−1) → L(−D)`, and the covariant action is `[t,v] ↦ [t∘rec_HS(γ), v] = [t, χ(rec_HS(γ))v]`: the leg of weight `1` contributes `χ(rec_HS(γ_1))`, the leg of weight `−1` (trivialization `g ↦ g/s`, scaling by `rec_HS(γ)⁻¹`) contributes `χ(rec_HS(γ_2))⁻¹`, product `χ(rec_HS(γ_1γ_2⁻¹))`. The previous report's `χ(rec_HS(γ_2γ_1⁻¹))` combined the inverse torsor `Isom(L(−D),O(d))` with the un-inverted contraction `[t·h,v]=[t,hv]`; with the contraction inverted along with the torsor the two descriptions agree on `χ(rec_HS(γ_1))`. The previous report's own “Not verifiable” entry already said FS fixes no sign here; the sign is fixed by the README's transport convention, which HS1.9 now states.
3. *Internal consistency.* HS1.9's cocycle `ψ_{γγ′} = ψ_{γ′}∘g_{γ′}^*ψ_γ` is the correct one for a left action (`g_{γγ′}^*F = g_{γ′}^*g_γ^*F`); at a fixed point it reads `ψ_{γγ′} = ψ_{γ′}ψ_γ`, so `γ ↦ ψ_γ⁻¹ = ψ_{γ⁻¹}` is the homomorphism and `γ ↦ ψ_γ` the anti-homomorphism, as the paragraph says; and `ψ_{γ⁻¹}∘(g_γ)_*` is “pushforward of sections then the inverse datum”, matching the sentence on `γ(s)`. The HS4.2 API bullets (`(γ,γ)∘create = create`, dependence on `γ_1γ_2⁻¹`), the Check at line 2376 (`(γ_0,1)∘create_V = χ(rec_HS(γ_0))·create_V`), the Layer HS4 example at line 2591 and the Conventions at lines 161–165 all carry the same value and direction. The new Check's reading of AG2.6 is accurate: AG2.6 lines 2664–2667 assign `2` to `geometricSpectralAction` and `2⁻¹ = 3` to the raw action, and lines 2628–2631 define the normalized action through `V ↦ T_{θ*V}`.

**Resolved supplier citations touched by the diff** (VectorBundlesAndIsocrystals at #1205 via `roadmaps show`; AutomorphicGaloisRepresentationsPartII at #1006).

| Citation (README line) | Where it resolves |
| --- | --- |
| VB Layers 0–6 (41) | `## Layer 0` … `## Layer 6` at #1205 lines 89, 210, 381, 760, 964, 1062, 1648 |
| VB Layer 0, “Marked untilt Cartier divisors and Cartier descent” (266, 323) | #1205 line 147, under Layer 0 |
| VB Layer 5, “Positive presentations and general two-term geometry” (424) | #1205 line 1179, under Layer 5 (line 1062) |
| VB Layer 5, “Basic section sheaves, Lubin–Tate geometry and projectivization” (541, 1365, 1744) | #1205 line 1064 |
| VB Layer 6, “The integral boundary and group torsors” (1168, HS2.3) | #1205 line 2011; its paragraph “Integral group torsors and Frobenius” states the equivalence of pro-étale `𝓖(ℤ_p)`-torsors with `φ⁻¹`-`𝓖`-torsors on `Y_[0,r](S)` for smooth affine `𝓖` with connected fibres, exactly HS2.3's input |
| VB Layer 5 (563), Layers 0, 5 and 6 (1792) | as above |
| AG2.6, “The parameter stack and geometric spectral action” (2377) | #1006 line 2599; its torus Check at lines 2664–2667 |
| FS Theorem IX.7.2, proof, p. 336 (2350) | FS lines 13022–13031 (printed p. 336, pdf 363) |
| FS Corollary II.2.4 and the following discussion, p. 61 (2350) | FS lines 2335–2349 (printed p. 61) |

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-HeckeStacksAndLocalShtukas~4, its table of 52 rows, every one “agree” except the HS4.2 excursion row, which is replaced below); the rows below are computed at this head.

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| HS1.9 cocycle and homomorphism | left action, `g_{γγ′} = g_γ∘g_{γ′}`; fixed point | `g_{γγ′}^*F = g_{γ′}^*g_γ^*F`, so `ψ_{γγ′} = ψ_{γ′}∘g_{γ′}^*ψ_γ`; at a fixed point `ψ_{γγ′} = ψ_{γ′}ψ_γ`; `ψ_1 = id` gives `ψ_{γ⁻¹} = ψ_γ⁻¹`; `γ ↦ ψ_γ⁻¹` multiplicative | agree |
| HS1.9 pullback transport | `ρ(γ) = ψ_γ∘g_γ^*` | `ρ(γ)ρ(γ′) = ψ_γ∘g_γ^*ψ_{γ′}∘g_{γ′γ}^* = ψ_{γ′γ}∘g_{γ′γ}^* = ρ(γ′γ)`: anti-homomorphism; on `GL_2` with non-commuting images not a homomorphism; on a torus both are | agree (R02 wording) |
| HS1.9 Drinfeld action is a left action | `deg_ar` a homomorphism, `Frob` central | `(γγ′)∘Frob^{−deg(γγ′)} = (γ∘Frob^{−deg γ})(γ′∘Frob^{−deg γ′})` | agree |
| HS4.2 torus witness, leg of weight `1` | `t = (·s): L(−1) → L(−D)`, `γ_*s = s·rec_HS(γ)` | `γ_*t = t∘rec_HS(γ)`; `[t∘rec,v] = [t, χ(rec)v]`: scalar `χ(rec_HS(γ_1))` | agree |
| HS4.2 torus witness, leg of weight `−1` | `t′ = (g ↦ g/s): L(1) → L(D)` | `γ_*t′ = t′∘rec_HS(γ)⁻¹`: scalar `χ(rec_HS(γ_2))⁻¹`; product `χ(rec_HS(γ_1γ_2⁻¹))`, matching the API bullet “depends only on `γ_1γ_2⁻¹`” | agree |
| HS4.2 torus witness, inverse-torsor description | `Isom(L(−D),O(d))`, `u = (÷s)`, right action `u·h = h⁻¹∘u` | `γ_*u = rec⁻¹∘u = u·rec`, `[u·rec, v] = [u, χ(rec)v]`: same scalar `χ(rec_HS(γ_1))` | agree (refutes the r4 inversion) |
| HS4.2 AG2.6 instance | `E = ℚ_11`, `ℓ = 5`, `χ(11) = 2`, `γ` geometric Frobenius | `deg_ar(γ) = −1`, `v_11(rec_HS(γ)) = −deg_ar = 1`, `χ(rec_HS(γ)) = χ(11) = 2`; `(1,γ)`: `2⁻¹` in `𝔽_5` is `3` (`2·3 = 6 ≡ 1`) | agree |
| HS4.2 Check 2376 from 2375 | `γ_2 = 1` | `χ(rec_HS(γ_0·1⁻¹)) = χ(rec_HS(γ_0))`; `≠ 1` by hypothesis | agree |
| HS4.2 claim on FS's labels | FS IX.7.2 proof, `G_m`, `V = χ_N` | source stratum `bπ^N`, `E_{bπ^N} = E_b ⊗ O(−N)` (FS line 2205), target stratum `b`: degree `d−N ↦ d`; `N = 1`: `d ↦ d+1`; AG2.6 `T_1`: `d ↦ d+1` | agree |
| AG2.6's “opposite labels” sentence | FS p. 324 `b ∈ B(G,μ)`, Kottwitz normalisation, `G_m`, `μ = z` | `b = π`, `E_b = O(−1)`: IX.3.1's `i_b^*T_μ(j_!…)` would need `0 ↦ −1`, against IX.7.2's `0 ↦ +1`; with `κ(b) = −μ♯` (SW 24.1.1, per the r4 report) both agree | supplier defect, not HS's |
| HS2.3 relabel | smooth affine `𝓖/ℤ_p` with connected fibres | VB Layer 6 states the `𝓖(ℤ_p)`-torsor ↔ `φ⁻¹`-torsor equivalence HS2.3 consumes; Layer 4 (the r4 suggestion) is bundle classification, not this | agree |
| Summary sentence | lines 7–8 | one subject list, verb “are”, no dangling “the imported Hecke stack” | agree |
| Title | line 1 | “Hecke” capitalised as in main's “Belyi maps”, “Heegaard Floer” titles | agree |

**Shape.** Unchanged since r4 apart from the two inserted passages, both prose with locators and both inside existing `*Needs:*` scopes (HS1.9 needs AG2.6's Hecke section, HS4.2 needs §HS2.18 and §HS1.9's descent API). No process words, pull-request numbers, LaTeX or local paths in the diff (`roadmaps resolve` lead `dim.trg` at line 215 is unchanged and is Fargues–Scholze's notation, as the r4 report found). `readme-ids-missing = 0`.

**Ownership against open pull requests.** Not re-run: the diff adds no construction, only a convention statement and Checks on objects the r4 report already placed (AG2.6 owns the functor and the spectral action; this roadmap owns the solid extension and the towers).

## Not verifiable

- The sign Fargues–Scholze intend in Proposition IX.6.5 (FS lines 12915–12931: “an easy consequence of Section II.2.1”, with the reciprocity normalisation of `Z¹(W_E,G_m) = Hom(E^×,G_m)` left unstated at line 12913–12914) cannot be read off the text; the README's value is fixed by its own stated transport convention, verified above.
- SW (Berkeley lectures) is not in the sources cache this round; no SW locator changed, and the r4 report's reading of Definition 24.1.1 is relied on for the supplier-defect row only.
- GLX's version of record remains uncertified, as the README states; no GLX locator changed.

## Source issues

- **Gap** in FS at IX.3, printed p. 324 (FS line 12546): the source says the local Shimura datum has `b ∈ B(G,μ) ⊂ B(G)` without defining `B(G,μ)` or its normalisation (the only occurrence of the symbol in the text); it should be the set with `κ(b) = −μ♯`, Kottwitz's `B(G,μ⁻¹)`, which the proof of Theorem IX.7.2 (p. 336) forces and which SW Definition 24.1.1 uses; affects nothing.
