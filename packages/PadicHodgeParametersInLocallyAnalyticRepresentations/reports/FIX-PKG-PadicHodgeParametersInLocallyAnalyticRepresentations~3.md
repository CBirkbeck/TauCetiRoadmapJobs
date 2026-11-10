# Repair round 3: PadicHodgeParametersInLocallyAnalyticRepresentations (package)

All nine findings of the round-2 review were checked against DING25, the supplier READMEs and the pins. All nine are correct. Each is repaired below, and the same pattern was repaired wherever else it occurred. Files changed: `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md`, `Suggested.lean` (docstring only), and `design/plan.json` (top-level `gaps` only). No new source was fetched, and nothing was added to `needs-references.toml`.

## R01 (P1) — applied

**Change.** In §4.1, ℒ_Π was the kernel of Ext¹_σ(A,π⁻) ⊕ Ext¹_σ(A,π⁺) → Ext¹_σ(A,Π); it is now the kernel of E⁻_F ⊕ E⁺_G → Ext¹_σ(A,Π), where E⁻_F and E⁺_G are the push-forward images of `𝔈_{σ,F}` and `𝔈_{σ,G}`. Added: a surjectivity proof, the dimensions, a sign Check, a negative control, a definition of `𝔈_{σ,F_P}`, and a Source-corrections entry for (3.53)–(3.54).

**Evidence.**
- At n = 3, π^± = `π_{1,σ}` and Ext¹_σ(A, π^±) = 𝔈_σ has dimension 10. The full-Ext sum map is 20 → 9, with an 11-dimensional kernel, while 𝒱_σ has dimension 14.
- DING25 lines 2485–2487 define the lower-left term of (3.52) as a push-forward image.
- The image spaces give 7 + 7 → 9, with a 5-dimensional kernel. This matches TriangulineVarietyAndItsLocalModel §13.14 (14 = 9 + 5).
- Surjectivity: `𝔈_{σ,F}` + `𝔈_{σ,G}` = 𝔈_σ (LocallyAnalyticRepresentationsOfLocalGroups §10.7), and 𝔈_σ ↠ Ext¹_σ(A,Π) (§3.7).
- "TV" was expanded to the supplier's name.

**Pattern.** §§2.2, 3.2 and 3.7 already use images, so they needed no change.

## R02 (P1) — applied

**Change.** Renumbered 45 trianguline citations: 9.1–9.3 → 10.1–10.3, 9.6 → 10.5, 9.8 → 10.7, 9.9 → 10.8, 10.k → 11.k, 11.k → 12.k, 12.k → 13.k. Also fixed the bare §12.8 in §3.1 and rewrote the contract. Conventions now call D regular in the sense of §10.1. D_σ is consumed through §10.5, and `gap:embedding-selective-modification` is retired (README and plan.json).

**Evidence.** These are the section titles at the supplier's open head:
- §10.1: ΦΓ_nc, with weakly decreasing weights allowed.
- §10.5: modified endpoints; D_σ is imported there from PadicHodgeTheory §5.2.
- §10.7: the rank-three example. §10.8: surjectivity of 𝔗_σ.
- §§11.1–11.8: refinement tangents. §§12.1–12.7: partial de Rham spaces.
- §13.8: spanning. §§13.13–13.14: the relation and its exact sequence. §13.16: partial spanning.

**Pattern.** This roadmap's separate gap asked PadicHodgeTheory §4.5 for the same D_σ that the supplier already asks of PadicHodgeTheory §5.2. That duplicate request was retired, and Scope, the PadicHodgeTheory contract, §3.6 and the Layer 3 Dependencies now route D_σ through TriangulineVarietyAndItsLocalModel §10.5.

## R03 (P1) — applied

**Change.** All 75 "LR.k slug" citations became "LocallyAnalyticRepresentationsOfLocalGroups §x.y", for example ext-pi1 → §8.12 and zeta-fp-bijective (3) → §9.6 (3). This covers Scope, Conventions, the contract, every Needs and Dependencies line, and Source corrections. The LR Citations convention was replaced. "LocallyAnalyticDistributionsPartII ND.0–ND.3" became "PadicLocalLanglandsForGL2Qp §0.1, reached through Layers 0–1".

**Evidence.**
- `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` has §§0.9, 1.5, 1.7–1.9, 4.1, 6.1, 7.1–7.3, 8.1–8.14, 9.1–9.7 and 10.1–10.7 with the cited content: for example §8.12 gives dim 𝔈 = n + (2^n − 1)d_L, and §9.4 gives 7 at n = 3 with blocks (2,1).
- `packages/LocallyAnalyticDistributionsPartII/README.md` (Summary and Scope) takes D(H,K), the Fréchet–Stein structure and coadmissibility from PadicLocalLanglandsForGL2Qp §0.1. That §0.1 at its open head constructs them.

## R04 (P2) — applied

**Change.** Deleted the LieHighestWeight contract and `gap:split-gln-harish-chandra` (README and plan.json). The contract now imports LocallyAnalyticRepresentationsOfLocalGroups §4.1 (iv) with the variable μ = ν + θ: since ρ − θ is central, w·(μ−θ) = w(μ) − θ. Scope and §2.6 Needs and Dependencies were updated. The §2.6 Check adds s·(3,2) = (1,4) ↦ (1,3) = s(h).

**Evidence.** The supplier's §4.1 (iv) gives Z(U(𝔤)) ≅ S(𝔥)^(W,·) and equality of infinitesimal characters exactly on dot orbits, for split reductive 𝔤 over any field of characteristic zero and as a product over σ. The supplier is earlier in the order (253 < 260).

## R05 (P3) — applied

**Change.** The `Suggested.lean` module docstring gains the item "Compatibility with parabolic induction" (README §§3.1–3.2; Proposition 3.27 and Remark 3.28). It lists the missing carriers: admissible representations of GL_n(K) and its Levis, closed parabolic induction, completed tensor products over Levi blocks, the parabolic subspaces with ζ_{F_P} and κ_{F_P}, and t_D, t_{M_i}. No declaration was added.

## R06 (P3) — applied

**Change.** The §4.2 flag Check now specifies the Hodge plane span(e₁+e₂, e₁+ae₂+e₃) and the Hodge line E(e₁+ae₂+e₃), for crystalline D over ℚ_p with generic unramified φ. It cites TriangulineVarietyAndItsLocalModel §10.7 and DING25 Example 2.9 (pp. 14–15, DING25 line 617). It computes the a = 2 and a = 3 values, the diagonal-isomorphism obstruction (x = y), and the map diag(1,1,1/2) relating the two planes.

**Evidence.**
- Plane normal: (1,1,0) × (1,a,1) = (1, −1, a−1). The line (1,a,1) is orthogonal to it.
- With x = y, the image (x, 2x, z) of the a = 2 line is never proportional to (1, 3, 1).

## R07 (P3) — applied

**Change.** Two negative-control Checks are now qualified by 𝒦_D ≠ 0, i.e. n ≥ 3:
- §2.2: the cokernel of f_D embeds in 𝒦_D ⊗ Ext¹(A,A), of dimension 4 at n = 3 over ℚ_p. For n ≤ 2 that term is 0 and f_D is the identity.
- §2.4: the split extension has socle A⊕A at n = 3. For n ≤ 2 the split extension is V = π_min(D) and satisfies (1).

**Pattern.** The §2.1 split-extension Check was already qualified.

## R08 (P2) — applied

**Change.** §0.3 keeps the spanning identity for all n ≥ 1 and all abelian H_char. Non-directness is now asserted only for n ≥ 2 and H_char ≠ 0, with the witness (a,…,a) + (−a,…,−a) = 0; the README notes that Hom(K^×,E) has dimension 1 + d_K ≥ 2. Added Checks: n = 1 and H_char = 0 as positive controls, and n = 2 over ℤ.

**Pattern.** The other non-directness claims (§0.2 and §1.3 Checks, Worked examples, Source corrections) are at n = 3 with nonzero characters, so they stand.

## R09 (P3) — applied

**Change.** "Layers 2 and 5 depend on Layer 1 but not on each other" became: Layer 2 depends on Layer 1; Layer 5 depends on Layer 1, and §5.5 also on §2.1; nothing in Layer 2 uses Layer 5; Layer 3 depends on Layers 1–2, and Layer 4 on Layer 3.

**Evidence.** A grep finds no §5 citation inside Layer 2.

## Checks run

- **Elaboration.** `lake env lean` on `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean`, run from the content checkout, exited 0 with no output. The file has zero declarations, so there was no `#check @name` comparison to make and no Tau Ceti build was needed.
- **Dependency check.** Output, complete:

  ```text
  depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
  ```

  There were no UPWARD, CYCLE or moved lines. Merge-order positions: LocallyAnalyticRepresentationsOfLocalGroups 253, TriangulineVarietyAndItsLocalModel 259, this roadmap 260. PadicLocalLanglandsForGL2Qp (33), PadicHodgeTheory (123) and LieHighestWeight (on main) are also earlier.
- **`roadmaps resolve`** found one lead: "LocallyAnalyticRepresentationsOfLocalGroups §4.1: no roadmap … on main or in an open pull request". This is a false positive as a verdict. That supplier is a board package, earlier in the order, and its §4.1 exists in `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`. It was already this roadmap's supplier before this round.
- **Ownership.** `roadmaps grep` over main and the open heads found no other owner of Ding's recovery relation or π_min(D)_σ, and no other owner of split Harish-Chandra theory over E.
- **Overlaps.** The overlap report lists no pull request that changes this roadmap and no dropped ids. This roadmap's own section numbers are unchanged.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.3 spanning | n=3, v=(5,2,−1) | (−1,−1,−1)+(3,0,0)+(3,3,0)=(5,2,−1) | holds for all n, H |
| §0.3 non-directness | n=1, H=ℤ; H=0; n=2, H=ℤ | n=1: kernel 0; H=0: all zero; n=2: (1,1)+(−1,−1)=0 | false without n≥2, H≠0; hypotheses added |
| §2.2 cokernel Check | n=2; n=3, d=1; n=3, d=2 | Ext¹(A,0)=0; 1·4=4; 2·5=10 | qualified by 𝒦_D≠0 |
| §2.4 split Check | n=2; n=3, d=1; n=4, d=1 | socle multiplicity 1; 2; 6 | qualified; n≤2 split extension equals π_min |
| §4.1 E⁻_F, E⁺_G, ℒ_Π | n=3; n=4 | n=3: 7, 7, 9, kernel 5 (=2+3); n=4: 12−1=11 each, 14, kernel 8 (=2+6) | matches TriangulineVarietyAndItsLocalModel §13.14 (14=9+5) |
| §4.1 negative control | n=3, full Ext | 10+10 → 9, kernel 11; 20 ≠ 14 | full Ext excluded |
| §4.1 sign Check | b∈𝔈_g nonzero, p=2 | (b⁻,b⁺) ↦ 2f(b)≠0 (Ker t_D ∩ 𝔈_g = 0; char E = 0) | sign matters |
| §4.2 flag Check | a=2, 3; a=0, 1 | dot products 1−2+1=0, 1−3+2=0; diagonal: x=y, (x,2x,z)∦(1,3,1); a=0: zero line coordinate; a=1: normal (1,−1,0) | distinct classes; planes alone related by diag(1,1,1/2) |
| HC translation | n=1, 2, 3 | ρ−θ = 0; (1/2,1/2); (1,1,1); s·(3,2)=(1,4), +θ=(1,3) | dot action in ν equals ordinary action in μ |
| R09 graph | §5.5 | edge 2.1→5.5, no Layer 2→5 edge | acyclic |
| Renumbering | old §12.8 / §9.8 / §10.4 | head §13.8 spanning; §10.7 a=2 normal (1,−1,1); §11.4 dim Q=9 at n=3 | content matches |

## For the maintainer

- **Two supplier gaps retired** (README and plan.json `gaps`):
  - `gap:split-gln-harish-chandra` → now LocallyAnalyticRepresentationsOfLocalGroups §4.1 (iv);
  - `gap:embedding-selective-modification` → now TriangulineVarietyAndItsLocalModel §10.5, whose own gap asks PadicHodgeTheory §5.2 for D_σ. This removes a duplicate request for one object.

  Only `gap:principal-series-bernstein-completion` remains. It is stronger than the related `gap:ordered-character-map` of LocallyAnalyticRepresentationsOfLocalGroups (it needs the completion isomorphism 𝒥_w), so it is kept.
- **Citation basis.** Citations of TriangulineVarietyAndItsLocalModel now follow its open head's numbering. It is a new-roadmap pull request already earlier in the order, so this adds no dependency on a revision.
- **Nothing renamed here.** No section of this roadmap and no Lean name was renamed or dropped, so roadmaps that cite this one are unaffected.
- **Untrusted text.** No suspicious instructions were found in any text read.
