# Review of AutomorphicBundlesPartII (pull request #1823 at 3330afd)

**Verdict:** accepted

Incremental re-review of the 4 lines of `TauCetiRoadmap/AutomorphicBundlesPartII/README.md` changed since 2a5bbb5 (`Suggested.lean` and `metadata.toml` are untouched; nothing changed outside the folder). The change is exactly the two repairs the previous review asked for: the augmentation-ideal splitting in §5.0 is now written over the cover's group Δ(Π₀), and §5.1 no longer calls the §5.0 descent a "prime-to-p stabilizer" comparison. Both repairs were checked against BCGP21 at the locators and against every consumer of §5.0 in the README; neither introduces a new problem. No finding remains, the gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning. This roadmap folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: §5.0 line 873 now reads "the augmentation-ideal splitting f_*O_T≅O_S⊕(I_(Δ(Π₀))⊗_(ℤ[Δ(Π₀)])f_*O_T) of the cover, checked étale-locally where f_*O_T is the regular module O_S[Δ(Π₀)]". The same sentence already said the cover has group Δ(Π₀), which is what BCGP21 Proposition 3.8.3's proof gives (b4cc8b01 lines 2686–2687) and what Lemma 3.8.5 is stated for (lines 2696–2697, G the Galois group of f). `grep` for `I_Δ`, `ℤ[Δ]` and `O_S[Δ]` finds no residue.
- R02 — repaired: §5.1 line 919 reads "On a quotient apply the compactified direct-factor comparison of §5.0 to the completed coefficient." `grep "prime-to-p stabilizer"` finds nothing; the Conventions (line 31), the §5.0 API bullet (line 881), §5.1's *Needs* (line 933) and §5.13 (lines 1106–1112) all describe the same descent as compactified, at every reasonable level, with no hypothesis on p.

## Verified sound

**Gate.** Run by this review on 3330afd: `gate AutomorphicBundlesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate on the same head adds `build=0`. Dependency check: `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds README.md, Suggested.lean and metadata.toml only.

**Lean.** `lake env lean` on `TauCetiRoadmap/AutomorphicBundlesPartII/Suggested.lean` (unchanged since 6787f01): the only diagnostic is `warning: declaration uses sorry` at line 73. The `#check @` probe of the three declarations re-elaborated from a scratch copy: `dvrCoefficientRing : (O : Type u) → [CommRing O] → O → ℕ → Type u`; `integerCoherentCohomology : (R) → [CommRing R] → (X : Scheme) → [X.Over (Spec R)] → X.Modules → ℤ → ModuleCat R`; `finiteCoefficientSerreDuality` carries `[IsDomain O] [IsDiscreteValuationRing O]`, `Irreducible ϖ`, `n : ℕ`, `X` over `Spec (O ⧸ span {ϖ^n})`, `[SmoothOfRelativeDimension d]`, `[IsProper]`, `F` locally free of finite presentation, `i : ℤ`, concluding `Dual_A (Hⁱ(X, F ⟹ Λ^d Ω)) ≃ₗ[A] H^(d−i)(X,F)`: identical to the previous report and to README §1.6, no binder lost. The one-tactic padding probe and the library-name checks of the first report stand: the file and the pins are unchanged.

**Sources read at their locators for the changed passages.** BCGP21 (b4cc8b01): (3.3.14)–(3.3.16) at lines 2316–2318 (printed p. 210) define Δ, Δ(Π₀) and Δ(Kᵖ), with "these last two groups are finite" and Δ(Π₀) the stabilizer of a connected component (lines 2319–2322); the proof of Proposition 3.8.3 says the action of O_F^(×,+)(Π₀) on a component factors through Δ(Π₀) and that X_(K,c)→X^(G₁)_(K,π(c)) is a finite étale cover with group Δ(Π₀) (lines 2682–2687); Lemma 3.8.5 at lines 2696–2703 (pp. 220–221) is stated for a finite group G, the Galois group of a finite étale f: T→S, with f_*O_T=O_S⊕I_G⊗_(ℤ[G])f_*O_T checked étale-locally on the locally free O_S[G]-module. The repaired sentence is this lemma with G=Δ(Π₀). Lan17 Definition 8.5 and Propositions 7.5, 7.15 (the §5.1 locator) are unchanged by the diff.

**Consumers of the changed passages.** The seeded sample targets (1.4, 3.1, 3.12, 4.1, 5.3, 5.4, 5.6, 5.9, 5.15, 5.16, 6.1, 6.7, 6.9, 8.4, 8.6) do not fall in the diff; their rows carry from the earlier reports. Every citation of §5.0 was reread: the Conventions paragraph (line 31), §5.1 (lines 919, 933), §5.10 (lines 1068, 1070), §5.11 (line 1084) and §5.13 (lines 1106–1112). None mentions Δ in place of Δ(Π₀) and none carries a condition on p for the descent. No cross-roadmap citation and no Lean name changed; `roadmaps resolve` found nothing missing.

**Declared gaps and ownership.** The ten slugs of `design/plan.json` and their README contracts are untouched. The diff adds no construction, so ownership is as in the first report.

**Adversarial table.** Rows for the changed statements are computed here; rows for untouched statements are carried from the previous reports (`PRREVIEW-AutomorphicBundlesPartII~2`, "r2", and `~1`, "r1").

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §5.0 splitting over Δ(Π₀) (changed) | G=Δ(Π₀)=C_p over 𝔽_p, regular module | I_G⊗_(ℤ[G])O_S[G]=I_G⊗_ℤ O_S has rank p−1; O_S⊕ it has rank p=rank O_S[G]; ε(1)=1 so O_S·1∩I_G⊗O_S=0 | isomorphism as in Lemma 3.8.5, no 1/p used |
| same | trivial group Δ(Π₀)=1; G=S₃ | I_G=0, f=id, f_*O_T=O_S; 𝔽₃[S₃]=𝔽₃·1⊕I, rank 1+5=6 | true; splitting is of O_S-modules only, as stated |
| same, group identity | F=ℚ, Kᵖ neat | Δ=p^ℤ infinite, Δ(Π₀) finite (line 2319); cover group on one component is Δ(Π₀) (line 2687) | the written group is the cover's group; R01 closed |
| §5.1 quotient descent sentence (changed) | hyperspecial level, p=2; Iwahori level | §5.0 hypothesis set: reasonable level, none on p; §5.1 now asks the same | no stronger hypothesis than §5.0 supplies; R02 closed |
| §5.13 descent, §7.0 case (c), §8.2 weight-one Check, §8.7, §8.9 | as in r2 | r2: Prop. 3.9.15 no condition on p; {3/2,3/2,1/2,1/2} ⇒ (1,1); Ind(1,sgn) weight one; det ω|_∂=ω_E; #999 §§11.0g–11.0h lines 4409, 4423 | true (r2) |
| §1.6 / `finiteCoefficientSerreDuality` | A=ℤ/9, X=ℙ¹_A, F=O, d=1; n=0; d=0; i<0; i>d | r1: i=0: 0 and 0; i=1: A and A; n=0 both 0; A²≃Hom(A²,A); Dual(0)=0 vs 0 | true (r1) |
| §1.4, §1.5, §1.1–1.3 Checks | O=ℤ₃ n=0,1,2; 𝔽₅ δ=2; g=1 ψ₁=2,4 c=3; P_(123); (5,2) x=2 | r1: 𝔽₃, ℤ/9, 0; 3·2≡1; 3/2,3/4, product 3; f(m)=1 vs 0; 2⁷/4³=2 | Checks correct (r1) |
| §2.2, §2.3, §2.5, §3.5, §3.6 | trivial C₂-torsor/𝔽₂; Δ=1 N=O/ϖ n=2; R=𝔽₂[t]/t²; k=𝔽₂ Δ=C₂; O=ℤ₃ | r1: free rank 1; k not free over O/ϖ²; Tor₂=k→H₁⊗k iso; k⊗^L k = k in every degree; k in degrees −1,0 | Checks correct (r1) |
| §3.9–§3.12, §4.2, §4.3 | Bl_pt ℙ²; Spec k→𝔸¹; double cover; t↦t²; A=k[x]; F=(O/ϖ)[−1]; q=2 (1,3,2), q=1 (1,4,4) | r1: coker O_E(−1), H⁰=H¹=0; i^!O=k[−1]; trace 2, char 2: 0; (t)⊄(t²); x⁻¹∈H¹_(x); U=0,1 both; X⁴−3X³+14X²−24X+64; (X−1)⁴ | Checks correct (r1) |
| §5.3–§5.8 ranges | p=7, μ=0, t=1,2; (3,1),(6,1),(7,1); (4,2),(6,1),(7,1); (4,4),(7,4),(8,4); p=5 | r1: (4,2),(3,1); (5,3),(4,2); (5,5),(4,4); α+β=0,3,4<4; (0,0,1),(2,1,1); t=1, α=0,3,4; a∈[4,5], (p+1)/2=3 | matches CG20 pp. 22–24 (r1) |
| §5.16, §6.2, §6.3 | T=O[t]/(t(t−ϖ)); sl₂; f(y)=y, dy/y² | r1: characters 0,ϖ≡(ϖ,t), T⊗ℂ=ℂ²; dim sl₂/so₂=2, dim p_o/k_o=1; (y∂_y)ⁿy=y, ∫(log y)^(−2n)dy=∞ | Checks correct (r1) |
| §7.0 spin orbit, split weight, chambers; §7.2; §7.3 | (4,2),(5,2),(3,2;0); (a,2),(a,3−a),(1,b≤1); R_sing=5 | r1: (3/2,3/2,−3/2,−3/2) sum 0; (3/2,3/2,−5/2,−5/2); (7/2,7/2,3/2,3/2); chambers {0,1},{1,2},{0,1,2,3}; k=4 ok, k=3 fails | matches CG20 (r1) |
| §8.4 Satake, §8.7 algebraicity, §8.8 gaps and twist, §8.9 l₀ | q=2 α=1 β=2 u=4 D=2; (a,2); R_sep=3 R_gap=5; z=2; two real places | r1: X⁴−15X³+70X²−120X+64, T₂=30; (0,0,1−a,1−a)∈ℤ⁴; pairings 5,7,9,2 fail; |z|²=4; (d,2d),(d,d),(d,0) | Checks correct (r1) |

## Not verifiable

- GK19 Remark 10.1.3, p. 962 (§7.1): settled as uncertified in the manifest; cited by locator only (unchanged by the diff).
- H90 is an OCR'd scan: theorem numbers and printed headers were read in the earlier rounds; the fine print was checked for existence and page only (unchanged by the diff).
- Ownership against open pull requests whose files this brief does not give was not re-searched this round: the diff adds no construction, and the first report's search over the index stands.

## Source issues

- none (the three entries of the first report stand; the passages reread this round, BCGP21 lines 2312–2324 and 2680–2703, contain no new one)
