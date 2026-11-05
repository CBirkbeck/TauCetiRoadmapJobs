# GATE-RefinedTraceMethods~6

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/RefinedTraceMethods/README.md` §5.2 "THH relative to ku and KU": the sentence "Relative THH over ku carries no cyclotomic Frobenius unless the ku-structure is twisted" → in the decomposed case ku ⊗ `THH(S_R)` carries the tensor product of the trivial cyclotomic structure on ku (§2.9) with that of `THH(S_R)`, but the q-Hodge/Habiro comparisons use the modified cyclonic structure `THH(S_R/S_A)^cyct⊗_{S_A^cyct}S_A^triv` ⊗ cyclonic ku of §6.11, because over `S_A` the Frobenius is only semilinear over the Tate-valued Frobenius of `S_A` (w line 3134–3141, p. 70; w line 3142–3156, 5.43); §2.9 added to its *Needs:* line.

The same pattern was in §2.6 "THH relative to an E_∞-ring" (old: "relative versions with Frobenius require a Frobenius lift on k … ku with its ψ-operations, in Layer 6"): it now says the THH Frobenius induces none on THH(A/k) naturally in A in general, that relative Frobenii use a cyclotomic base structure (S[z], the spherical lifts `S_A` of §6.1), that over ku Layer 6 uses the cyclonic structures of §6.11 (in Wagner the Adams lifts live on `S_A`, not on ku), and that THH(k⊗B/k) ≃ k ⊗ THH(B) does carry the tensor cyclotomic structure.

## H02 (CBirkbeck) — applied differently

The comparison of `k⊗_𝕊k` with `k⊗_{𝔽_p}(𝔽_p⊗_𝕊𝔽_p)` is false for `k=𝔽_{p²}` (π₀ is `k×k` against `k`), as stated. The route in §2.6 "Bökstedt periodicity" is replaced by one that uses only inputs already declared, without adding spherical Witt vectors: base change of the comparison map `THH(𝔽_p)⊗_{𝔽_p}k→THH(k)` along `THH(𝔽_p)→𝔽_p` gives `k→HH(k/𝔽_p)` (§2.6 relative THH, README line 698), which is an equivalence because the levelwise Frobenius kills `HH_{>0}` of the simplicial commutative model while the Frobenius of k is bijective (kn line 246–253). Nakayama for connective `THH(𝔽_p)`-modules then finishes. KN Prop. 2.1 (kn line 233–241, the spherical-Witt splitting) is named as the alternative. A Check records the `𝔽_{p²}` π₀ computation and that KN Prop. 2.3 has `k⊗_{𝕊_{W(k)}}k` (kn line 262–274). The *Needs:* line gains §2.6 (THH relative to an E_∞-ring) and §1.1.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| ku^{triv} ⊗ THH(S_R) is cyclotomic | S_R = 𝕊 | THH(ku/ku) ≃ ku; Frobenius ku → ku^{hC_p} → ku^{tC_p} exists (§2.9 adjunction with Y = ku) | true; the old nonexistence claim is refuted |
| Frobenius of THH(S_R/S_A) not S_A-linear | S_A with (tC_p)-lift | it is semilinear over φ^{tC_p}: S_A → S_A^{tC_p} (w line 3138–3139); for S_A = 𝕊_p, φ^{tC_p} is the Segal map, so the two notions agree | qualifier "over a base S_A" kept |
| k → HH(k/𝔽_p) is an equivalence for perfect k | k = 𝔽_p; 𝔽_{p²}; 𝔽_p(t^{1/p^∞}); non-example 𝔽_p(t) | HH_0 = k in each case; HH_1 = 0 for the perfect ones; HH_1(𝔽_p(t)/𝔽_p) = Ω¹ ∋ dt ≠ 0 | perfectness needed; matches the existing Check |
| Nakayama step | R = THH(𝔽_p), π₀R = 𝔽_p; cofibre C connective (π₀ map k → k bijective) | C ⊗_R 𝔽_p = 0 ⇒ π_0 C = π_0(C ⊗_R 𝔽_p) = 0; induction gives C = 0 | holds for connective C |
| 𝔽_{p²} Check | k = 𝔽_{p²} | π₀(k⊗_𝕊k) = k⊗_{𝔽_p}k ≅ k×k (2 idempotents); π₀(k⊗_{𝔽_p}(𝔽_p⊗_𝕊𝔽_p)) = k⊗_{𝔽_p}𝔽_p = k | the two differ, as claimed |

## Build and gate

- `Suggested.lean` is unchanged (no declarations, so there was nothing to `#check`). `lake build TauCetiRoadmap.RefinedTraceMethods.Suggested`: `Build completed successfully (8976 jobs).`
- Gate (after commit c47abe48): `gate RefinedTraceMethods: … depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 55 roadmaps, 641 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- Ownership: no new construction was added. The H02 route avoids spherical Witt vectors, which no roadmap on main or earlier in the order supplies; the only open roadmap that constructs them is HabiroCohomologyFoundationsPartII, a downstream consumer. No new source was needed (w and kn are already in the manifest).
- Citation leads in citations.md (`AInf.Trace.completedTateComparison` and the others) are roadmap declaration names, not library names: they resolve in AInfCohomology README line 3834 (§AI.7.2) and PrismaticCohomologyPartIII README line 918 (§7.0). They are unchanged by this round.
