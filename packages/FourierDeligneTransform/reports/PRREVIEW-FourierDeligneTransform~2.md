# Review of FourierDeligneTransform (pull request #2132 at ec08a18)

**Verdict:** accepted

Incremental re-review of the 14 lines changed since ac17818 (`README.md` only; `Suggested.lean`,
`metadata.toml` and everything outside the folder are unchanged). No finding. Both findings of the
previous report are repaired and the repairs introduce no new problem. The gate passes on this head
and the dependency check shows no UPWARD or CYCLE line.

## Previous findings

- R01 — repaired: README:320 now reads "`RΓ_c(U, F) ⊗^L_Λ 𝔽 ≅ RΓ_c(U, F ⊗ 𝔽)` (EtaleCohomologyFoundations §0.8, the compatibility of `Rf_!` with derived scalar extension under Tor bounds, `F` being `Λ`-flat; …)"; README:321 lists §0.8 and no longer §F.2.7.
- R02 — repaired: README:583 now reads "the vanishing on `A × s'` is the universal local acyclicity of `A → Spec k` relative to `K` (EtaleCohomologyFoundations §F.3, `VanishingCycles.genericLocalAcyclicity` …), base-changed to `A'` and tensored with the lisse sheaf `ℒ_ψ(x x')`"; §§F.2.3, F.3 added at README:584 and README:617.

## Verified sound

**The five changed passages.**

1. README:65 (supplier contract): `VanishingCycles.genericLocalAcyclicity` is added under §F.3
   "over a field as base, universal local acyclicity of every bounded constructible complex".
   EtaleCohomologyFoundations on main, README:746–750: finite-type `f : Y → B` over a field, integral
   `B`, bounded constructible `K` with coefficients invertible on `B`, a dense open of `B` over which
   `(f, K)` is ULA. For `B = Spec k` the only nonempty open is `B`, so the contract sentence is
   exactly the instance the supplier states.
2. README:200 (§1.3 `*Needs:*`): §0.8 is added for the change of coefficients.
   EtaleCohomologyFoundations §0.8 on main (README:567) states compatibility of `Rf_!` with
   "coefficient transformations, retaining the Tor bounds needed to stay in `D⁺` under derived scalar
   extension"; on `Dᵇ_ctf` the Tor bound holds, so §0.8 covers the sentence of §1.3. The added clause
   "`Λ'` need not be of finite Tor amplitude over `Λ`, so §F.2.7 does not give it" is correct: §F.2.7
   (main README:759–767) needs `L ∈ Dᵇ_ctf(S, Λ)`, and `ℤ/7` over `ℤ/49` has `Tor_i = ℤ/7` for all `i`.
   The Layer 1 Dependencies (README:223) already list §§0.7–0.8.
3. README:320–321 (§2.7 route and `*Needs:*`): as under R01. `F` is free of rank `n` over `Λ`, so
   `F ⊗^L_Λ 𝔽 = F ⊗ 𝔽` and the Tor bound of §0.8 holds. §F.2.7 is cited nowhere else in §2.7, so
   dropping it from the `*Needs:*` line loses nothing; the Layer 2 Dependencies (README:349) list
   §§0.7–0.8 and F.2.4–F.3a.
4. README:583–584 (§5.5 route and `*Needs:*`): as under R02. The chain is: (`A → Spec k`, `K`) ULA
   (§F.3 at the point); ULA is stable under base change, so (`A × A' → A'`, `pr^*K`) is ULA (§F.2.3,
   main README:546); `ℒ_ψ(x x')` is locally constant of rank one, hence perfect of Tor amplitude
   `[0,0]`, so the tensor is ULA (§F.2.3 tensor stability, main README:547–548); local acyclicity over
   the henselization of `A'` at `s'` is `RΦ = 0` (LefschetzPencilsAndVanishingCycles §0.5, read at its
   open head, which states the equivalence with the §F.2.3 predicate). LAU87 lines 996–997 derive (i)
   of (2.3.2.1) the same way, from the lissity of `ℒ(x x')` on `A × A'` and the finiteness theorem over
   a field. For `U × ∞'`: §3.3 (README:389) is the acyclicity of `ℙ¹ × 𝔸¹ → ℙ¹` relative to
   `(j × 1)_!ℒ_ψ`; with `ℙ¹ = D'` and `𝔸¹ = A` this is `pr' : D' × A → D'`, and over `U × D'` the factor
   `pr^*F` is lisse, so tensor stability applies; LAU87 lines 1028–1029 take (1.3.1.2) with
   `A_1 = A'`, `D_1 = D'`, `A_2 = A`, the same substitution. Layer 5 fixes field coefficients
   (README:501), so over a finite field every bounded constructible complex is ctf and `ℒ_ψ`, `F` are
   perfect; the `E` and `ℚ̄_ℓ` cases are levelwise by the Conventions (README:25).
5. README:617 (Layer 5 Dependencies): §§F.2.3, F.3 added, matching README:584.

**Seeded sample.** Of the sampled targets the diff touches §1.3 and §2.7; only route citations and
`*Needs:*` lines changed there, and the supplier sections they now cite were read on main as above.
LAU87 lines 986–1000 and 1015–1034 (the two propositions behind the fourth and sixth bullets of §5.5)
were reopened: numbers, hypotheses and the proof steps the README names agree. The remaining sampled
targets (§§1.1, 1.2, 2.1, 2.6, 2.8, 3.3, 3.4, 3.6, 4.1, 4.2, 5.2, 5.3, 5.4) are untouched; their
locators stand as verified in the previous report (review of ac17818, "Sources").

**Gate and elaboration.** Gate rerun on ec08a18: all counters 0 (set_option, sorry-data, imports,
statement-hygiene, readme-ids-missing, depcheck, stray-files, outside-folder, … ), `OK`.
`lake env lean` on `TauCetiRoadmap/FourierDeligneTransform/Suggested.lean`: exit 0, no output (module
docstring, empty namespace, no declaration; so no `#check @name` comparison and no one-tactic probe
applies, as in the previous report). `git diff --stat origin/main...HEAD` outside the folder: empty.

**Dependency check** (output): `depcheck: 235 roadmaps, 2132 edges, 0 problem(s)`. The diff adds no
roadmap name: every new citation is a section of EtaleCohomologyFoundations, on main and earlier in
the merge order.

**Citations resolved this round (6).** EtaleCohomologyFoundations on main: §0.8 (README:565–567),
§F.2.3 (:540–553), §F.2.7 (:759–767), §F.3 *Generic local acyclicity* (:746–750) with the names
`VanishingCycles.localAcyclicity` and `VanishingCycles.genericLocalAcyclicity` present there;
LefschetzPencilsAndVanishingCycles §0.5 at its open head (local acyclicity ⇔ `RΦ = 0`); this README's
§3.3 (:389). `scratch/citations.md`: no cross-roadmap citation unresolved; its 22 Lean names are the
supplier roadmap's target names, `genericLocalAcyclicity` now among them and present in the supplier.
`scratch/overlaps.md`: no other pull request changes this roadmap and no cited id is dropped. The
four declared gaps are untouched by the diff.

**Adversarial table — changed passages** (values computed here).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §2.7 reduction `RΓ_c(U,F) ⊗^L_Λ 𝔽 ≅ RΓ_c(U, F⊗𝔽)` via §0.8 | `Λ=ℤ/49`, `𝔽=ℤ/7`, `ψ(1)=18`, `F=ℒ_ψ(x²)` on `𝔸¹` over `𝔽̄_3`; `Λ=𝔽`; non-flat control `F=ℤ/7` over `ℤ/49` | `18³=5832=119·49+1`; `RΓ_c=(ℤ/49)[−1]`, reduction `(ℤ/7)[−1]` = `RΓ_c(ℒ_{ψ mod 7}(x²))`, rank `1=d−1` both sides; identity; `ℤ/7 ⊗^L ℤ/7` unbounded, excluded by "`F` being `Λ`-flat" | holds; hypothesis used is stated |
| §1.3 coefficient change via §0.8 | `Λ=ℤ/ℓ² → ℤ/ℓ`, `X=𝔸¹`, `Y=S=pt`, `𝒦=Λ`, `K=Λ_X` | `Φ(K)=(ℤ/ℓ²)(−1)[−2]`, `⊗^L ℤ/ℓ = (ℤ/ℓ)(−1)[−2] = Φ(K ⊗^L ℤ/ℓ)`; `Tor_i^{ℤ/ℓ²}(ℤ/ℓ,ℤ/ℓ)=ℤ/ℓ` all `i`, so `Λ'` is not ctf over `Λ` | holds; §F.2.7 rightly not the source |
| §5.5 vanishing on `A × s'` | `K=j_!Λ[1]`, `j: 𝔾_m → A`, at `(0,s')`; `K=i_{0*}Λ` at `(0,s')`; `K=Λ[1]` | `pr^*j_!Λ ⊗ ℒ_ψ(xx')` restricted to `0 × A'` is `0` on every fibre and on the Milnor fibre's `x=0` part: `Φ=0`; `pr^*i_{0*}Λ ⊗ ℒ = (0×A')`-constant `Λ` (since `ℒ_ψ(0·x')` trivial), smooth constant over `A'`: `Φ=0`; lisse: `Φ=0` | holds; route now covers the non-lisse points |
| §5.5 vanishing on `U × ∞'` via §3.3 exchanged | `K=Λ[1]`, `U=A`: stalk of `(1×α')_!ℒ_ψ` at `(u,∞')` is `0`, nearby fibre is `ℒ_ψ(u x')` near `∞'` | `u≠0`: totally wild, `H^*(I_{∞'}, ℒ_ψ(ux'))=0`; `u=0`: needs the two-variable statement of §3.3, the punctured neighbourhood of `(0,∞')` carrying `ℒ_ψ(xx')` with no invariants; `RΨ=0=`stalk | holds; it is §3.3 with `ℙ¹=D'` |
| Supplier contract `genericLocalAcyclicity` at a point | `B=Spec k`; control `B=𝔸¹`, `x ↦ x²`, `p≠2` | dense open of a one-point space = the point; over `𝔸¹` the open excludes `0` (supplier Check), so the field base is what gives "universal" | consistent with the supplier |

**Adversarial table — carried rows.** The statements below are untouched by the diff; their rows,
with the values computed, are in the review of ac17818 ("Adversarial table") and are carried
unchanged: §0.1 (`ℤ/7`, `ℤ/7×ℤ/7`, `ℤ/49`, `ℤ/9`, zero ring), §0.2 inversion and Plancherel
(`𝔉𝔉δ_1(2)=17≡3=3·δ_1(1)` in `ℤ/7`), §1.1 (`Λ(−1)[−2]` vs `Λ`), §1.2, §1.4, §2.1 (`Fⁿ(t)=t+N(x)`),
§2.2–2.3 (trace `ψ(1)=2`, opposite convention `4`), §2.4, §2.5, §2.6 (`χ(−1)−1` unit), §2.7 completion
comparison and Euler–Poincaré values (`1`, `0`, `0`, `−1`), §2.8, §3.2, §3.3 headline
(`σ'_*Λ(−1)[−1]`; trivial `ψ` fails), §3.4 (`FT FT i_{0*}Λ = i_{0*}Λ(−1)`, trace `q`), §3.5, §3.6,
§3.8 (`−q` at `0'`), §4.1, §4.2, §5.1, §5.2, §5.3, §5.4 (`g=4`, `g²=5` in `𝔽_11`), §5.5 rank formulas
and the sequence at `0'`, §5.5 autoequivalence, §5.6. The two rows of that table marked with R01 and
R02 are replaced by the first and third rows above.

**Remarks on untouched text** (no change requested): none.

## Not verifiable

- SGA45-ST and KW01: recorded as uncertified in the manifest and cited by locator only; not read.
  No changed passage cites them.
- The items of the previous report (LAU87 extraction line 971, a possibly lost prime; KL85 line 446,
  a garbled symbol) are unchanged and no changed passage depends on them.

## Source issues

- none
