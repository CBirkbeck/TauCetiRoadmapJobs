# FIX-PKG-InertAnticyclotomicCMMainConjecture~7: repair report

Review settled: `REV-PKG-InertAnticyclotomicCMMainConjecture~6` (five findings, all P3). Changed files: `packages/InertAnticyclotomicCMMainConjecture/README.md` and `packages/InertAnticyclotomicCMMainConjecture/sources.toml`. `Suggested.lean`, `metadata.toml` and the `gaps` list of `design/plan.json` are unchanged: no finding needs a new supplier gap.

## F01 (P3) — applied

I checked the claim against the source. AHII05 (3.3), p.616 (AHII05 line 220), is the (signed, relaxed) sequence. AHII05 (4.3), p.617 (AHII05 lines 266–268), comes from a separate use of global duality, with S_str=0 already used. The old §4.1 did not state that second sequence.

- **§4.1:** retitled "The signed global-duality sequences". It now states a second sequence `0 → S_str → S_s → H^s → X_rel → X_s → 0` and names its maps (localisation; the dual of localisation, through H^s≃(lim_res H¹/L_∞^s)^∨; the dual of inclusion).
- **§4.1 route:** names the two pairs of conditions.
- **§4.1 Checks:** the n=0 Check is repaired; it said "s=ε" but meant s=+. One new Check separates the two sequences.
- **§4.4:** "the second sequence of §4.1"; §4.1 added to *Needs:*.
- **Same pattern elsewhere:** §6.1 (statement and route) now says "the first sequence"; the Scope line now says the sequences are two.

## F02 (P3) — applied

Verified against LubinTateFormalModulesAndQuasiCanonicalLifts at the head of its open pull request:
- no `LT.k` identifiers and no table of a former numbering;
- headings §2.4 (Lubin–Tate character, `Gal(K_π/K)≅O_K^×`), §2.5 (`χ_π(σ)=u⁻¹`, norm groups `π^ℤ·U(K,m)`), §8.2 (conjugation on κ-values), §8.3 (`[Ψ_n:Φ]=p^n`, Ψ∞/ℚ_p Galois with C₂ acting by inversion);
- "conductor" occurs only in §6.4.

Changes: line 23 "LT.0–LT.2 and LT.8" → "Layers 0–2 and 8"; the supplier paragraph now cites §§2.4, 2.5, 8.2, 8.3 with what each supplies; "conductor filtration" now points to AnticyclotomicLocalUnits §0.1; §0.2 *Needs:* and Layer 0 Dependencies → "§§2.4–2.5, 8.2–8.3"; §1.2 *Needs:* and Layer 1 Dependencies → "§2.4". No other occurrence of `LT.` remains.

## F03 (P3) — applied differently

ModularIwasawaMainConjecturesPartII (README line 33 at its head) consumes nothing from this roadmap and restates none of it, as the review says. The suggested sentence is wrong about CMRankZeroConverse. Its line 12 says only that the anticyclotomic theories of NonordinaryCMSpecialValues and of this roadmap "supply different main-conjecture statements" from the cyclotomic CM equality it uses. It does not name this roadmap as owner of the rank bounds. New first sentences:
- both roadmaps cite this one without consuming a target;
- the first names it as owner of BKO21 Theorems 6.1–6.2;
- the second keeps its own cyclotomic statement apart from the anticyclotomic one here.

The second sentence of the section is kept.

## F04 (P3) — applied

Verified. By the Conventions and the §1.5 API, the χ⁻¹-specialisation of a dual is the dual of the χ-eigen-submodule; in the §1.5 model these are M^∨ and M, which are not equal.
- §5.3: now "identifies X_s⊗_(Λ_R,χ⁻¹)L_χ … with the L_χ-linear dual of the χ-part of the rational signed Selmer group over K_n, through the coefficient trace of §0.4 and the duality of §1.5; in particular the same L_χ-dimension"; §0.4 added to its *Needs:*.
- §6.3 route: now "gives dim Sel_(−ε)(K_n,V_pE)^χ=dim(X_(−ε)⊗_(Λ_R,χ⁻¹)L_χ)".

I also searched for "identif", "χ-part", "specialisation" and "eigen": §§1.5, 3.3, 5.4 and 5.6 already have the dual form.

## F05 (P3) — applied

- **§5.2:** "pp.618–619" → "p.618". The lemma and its proof are AHII05 lines 318–338, and page 619 begins at line 341.
- **§1.5:** "p.612–613" → "pp.612–613". A regex search for `p.N–M` and for a single-page `pp.N` finds no other case.
- **Layer 1 Dependencies:** `TauCeti.completedGroupAlgebra` added. A script compared every layer's *Needs:* lines with its Dependencies line, and this was the only gap.
- **sources.toml, AHII05:** `cited_for` = ["Conventions", "Layers 0–6", "Worked examples"]. AHII05 is also cited in the Conventions (line 43).
- **Same pattern in other entries:**
  - BKO21 is cited in the Summary and the Worked examples, so its `cited_for` = ["Summary", "Layers 0–6", "Worked examples"].
  - RUB91 claimed "3.1", but §3.1 never cites RUB91 (only through the gap in the supplier contracts), so its `cited_for` = ["3.5", "Exact supplier contracts"].

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Second sequence 0→S_str→S_s→H^s→X_rel→X_s→0 | Poitou–Tate (F⊂G on T′, F*⊃G* on W) with F=strict, G=signed | G_𝔭/F_𝔭=L_n^(s,⊥)≃(H¹(W)/L_n^s)^∨; F*=all → Sel_rel; G*=L^s → Sel_s | Exact; stated |
| Same, Λ-ranks | s=ε; s=−ε (ranks from §§3.3–3.4, 4.2) | 0,1,1,1,1, alternating sum 0; 0,0,1,1,0, alternating sum 0 | Consistent |
| Same, base layer | n=0, R=O, s=+ | L_0⁺=0, L_0^(+,⊥)=H¹(Φ,T′) of R-rank 2; first sequence: two identities, local term 0; second sequence: the strict–relaxed sequence | Not an instance of the first; Check added |
| Same, base layer | n=0, s=− | L_0⁻ = ordinary image of corank 1, annihilator of rank 1; Sel_−=Sel at n=0 | Consistent |
| Equivariance of H^s→X_rel | ⟨γa,γb⟩=⟨a,b⟩ | functional of γa is b↦⟨a,γ⁻¹b⟩=(γf_a)(b) | Λ_R-linear with the contragredient action |
| §4.1 model Check | H^ε=Λ_R, S_ε=S_rel=(T), S_str=0, s=ε | first sequence: S_rel→H/H^ε is 0, gives 0→Λ_R→X_ε→X_str→0; second: (T)→Λ_R injective, cokernel Λ_R/(T), gives 0→Λ_R/(T)→X_rel→X_ε→0 | With H/H^ε in its place the map out of S_ε is 0, which is not exact since S_str=0 |
| §4.4(1) via the second sequence | same model | torsion parts: 0→Λ_R/(T)→(X_rel)_tors→(X_ε)_tors→0; a torsion element of X_ε lifts to a torsion element because Λ_R/(T) is torsion | Identity 1 route holds |
| Old Check "s=ε … plus condition 0" | ε=− | at n=0, L_0⁻ ≠ 0 | False for ε=−; now stated for s=+ |
| §5.3 dual form | §1.5 model M=L/R, γ=ζ₅ | χ-eigen-submodule M, specialisation M^∨=𝔇⁻¹; L-dimension 1 and 1 after inverting p | Dual, equal dimension; restated |
| §5.3 zero sets | χ vs χ⁻¹ | ω_n^s has integer coefficients and Ξ^± is inversion-stable, so χ(ω_n^s)=0 ⟺ χ⁻¹(ω_n^s)=0 | The χ⁻¹-specialisation of X_s/ω_n^sX_s equals that of X_s |
| §6.3 | χ∈Ξ^ε, R=O | dim Sel^χ = dim of χ⁻¹-specialisation ≤ ord_(χ⁻¹)L_p = ord_χ L_p | Holds; restated |
| F02 citations | LT §2.5 at x=π^r u | χ_π(σ)=u⁻¹, the README's κ(Art_Φ(u))=u⁻¹ at r=0 | Agree |
| F02 citations | LT §8.3 at n=1, p=5 | [Ψ₁:Φ]=5 | Agrees with §0.2's Check |
| F03 text | the two consumer READMEs | lines 33 and 12 quoted above | Accurate wording |

## Checks run

- **Lean.** From the content checkout, `lake env lean` on `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean`: exit 0, no output. No `TauCeti.*` import needed building. The file is unchanged and declares nothing, so the `#check @name` comparison has nothing to compare. None of its headline docstring entries (§§4.2, 4.4, 4.6, 6.4) changed statement. No Lean process of this job is left running.
- **Dependency check** (complete output):

```text
depcheck: 245 roadmaps, 2240 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. Every supplier cited for the first time in this round (only LubinTateFormalModulesAndQuasiCanonicalLifts sections, already a supplier) is earlier in the merge order.
- **`roadmaps resolve`:** no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures:** none were listed for this round.

## For the maintainer

- **Ownership against open work.** I read three roadmaps at their open heads: LubinTateFormalModulesAndQuasiCanonicalLifts, ModularIwasawaMainConjecturesPartII and CMRankZeroConverse. `scratch/overlaps.md` lists no pull request that changes this roadmap, no dropped id and no second copy. The second duality sequence is an application of SelmerIwasawaCohomology §2.19 to this roadmap's signed conditions, so it belongs here. No new object was introduced.
- **Names other roadmaps may cite.** The heading of §4.1 changed from "The signed global-duality sequence" to "The signed global-duality sequences". The section number is unchanged, and `roadmaps grep` finds no roadmap that cites this one's §4.1.
- **Changes beyond the review's suggestions:**
  - The §4.1 Check that said "s=ε" while reasoning about the plus condition was false for ε=−. It now reads s=+.
  - The manifest's `cited_for` of BKO21 and RUB91 was corrected by the same pattern as AHII05.
- **Untrusted text.** Nothing in the review or the supplier texts asked for any action outside this brief.
