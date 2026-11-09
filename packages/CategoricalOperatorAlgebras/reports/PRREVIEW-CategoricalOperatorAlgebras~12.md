# Review of CategoricalOperatorAlgebras (pull request #888 at 7362bb7)

**Verdict:** needs changes

This is an incremental re-review of the 55 lines of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` that changed since `363a7e3`. The changes are: the ownership sentence and the Downstream consumers list (QuantumGroups removed), the Kosaki basic-extension paragraph, the canonical-extension and modular-endomorphism locators in CA9, and the References entries for Jones–Penneys *Realizations*, Masuda–Tomatsu 2009, Izumi 2003 and Kosaki 1986. `Suggested.lean` and `metadata.toml` are unchanged. Two of the three previous findings are repaired. The one left is the P2 ownership conflict with the QuantumGroups revision. It is carried below, and the edit made for it at this head moves the README away from main without settling anything.

## R01 (P2) — This README and the QuantumGroups revision at #1705 each claim to be the single home of the CA1a/CA2a objects

Re-raised: R01. The repair report at `7362bb7` marks this applied, and the report at `61c5422` answered it (as H01) with the argument that the conflict lies in the QuantumGroups revisions and in the merge order, which this pull request cannot edit. That is right about where most of the fix lies. But under the overlap rule the double ownership is a P2 whichever side has to edit. Also, the `7362bb7` edit deleted the sentence that the `61c5422` answer relied on, the one that agreed with main. So the finding stands, and only a human can settle it.

**Location.** `README.md` lines 40–45: "C*-categories, their finite additive and Karoubi completion and the finite-Hilbert and Hilbert-module examples (CA1a), and C*-tensor categories with solutions of the conjugate equations, … signed self-dualities (CA2a) have their single home here." The clause "QuantumGroups consumes CA1a and CA2a" and the QuantumGroups bullet of `## Downstream consumers` (now lines 2141–2146) are deleted.

**Claim.** This roadmap is the single owner of these objects. The README no longer says who consumes them outside TemperleyLiebOperatorAlgebras.

**Witness.**
- QuantumGroups #1705 at `b4e4777`, `TauCetiRoadmap/QuantumGroups/README.md` lines 33–41 say "Section 0.2 is the single home of C*-categories … conjugate solutions, standard solutions, intrinsic dimension and signed self-dualities". They also say CategoricalOperatorAlgebras CA1a–CA2a "consume these objects from §§0.2–0.3". Line 300 defines `bar(r) r=ε φ_X`, and lines 1777–1781 list this roadmap as a consumer of §0.2.
- On main, `TauCetiRoadmap/QuantumGroups/README.md` line 42 still cites "CategoricalOperatorAlgebras CA1a,CA2a" as a supplier. That citation is exactly what the deleted lines recorded.
- QuantumGroups #1649 at `79e1cb6`, lines 29–36, agrees with this README: the general theory is "owned later in the build by CategoricalOperatorAlgebras, from which nothing is imported here". Its §0.1 still restates the instances (line 201 has the same signed condition).

So at this head the README agrees with neither side. #1705 says that §0.2 is the home and that this roadmap consumes it. Main says QuantumGroups consumes CA1a/CA2a, and this README no longer records that consumer.

**Repair.** A human must place QuantumGroups in the merge order. The brief's rule, "placed after its last supplier", read with main's line 42, puts it after this roadmap. Then:
- If QuantumGroups comes after this roadmap: restore the two deleted statements in this folder (the scope clause "QuantumGroups consumes CA1a and CA2a for these tensor-category inputs" and the Downstream consumers bullet), and keep lines 40–45. The QuantumGroups revisions then delete #1705 §0.2 (lines 274–300) and #1649 §0.1's restatements and cite CA1a/CA2a as main does.
- If QuantumGroups stays ahead of this roadmap: once a QuantumGroups revision with Layer 0 has merged, replace "single home here" for those objects with a citation of that layer. Keep here what QuantumGroups does not build: W*-categories and W*-Cauchy completion, unitary dual functors and Penneys's Theorem A, the grading groupoid, and the braided sign law.

**Tested.** The test object is the sign ε of a simple self-dual object. At this head it is defined three times: in this README at line 393, in #1705 at line 300 and in #1649 at line 201. After either resolution exactly one roadmap defines it. The restored lines passed the dependency check at `363a7e3` with 0 problems (previous report), so the first option introduces no supplier edge.

## Previous findings

- R01 — not repaired: lines 40–45 still read "(CA2a) have their single home here", while #1705 at `b4e4777` (lines 33–41) still calls its §0.2 the single home. The only change was deleting the QuantumGroups consumer clause and bullet, which main's QuantumGroups line 42 still supports. Carried as R01.
- R02 — repaired: line 1702 reads "(Izumi 2003, Definition 3.1, p. 7, for a type III factor; Masuda–Tomatsu 2009, §4.2, p. 33, for a factor of any type)". Lines 1711–1713 read "Lemma 4.10(2), p. 34, for type II∞; for type III_λ, Izumi 2003, Theorem 3.3 with Remark 3.8, pp. 9 and 17". Izumi 2003 is in the References.
- R03 — repaired: line 1568 reads "(Kosaki 1986, §3, Lemma 3.2, as recalled in Burns, …, Proposition 2.1.21, pp. 12–13; over a II₁ base N this is the form `⟨M,N⟩=J_φN′J_φ` of Jones–Penneys …)". The dual expectation is cited to "Kosaki 1986, §3; Burns, p. 13", and Kosaki 1986 is in the References.

## Verified sound

**Gate, build and form.**
- My run of `gate … --base origin/main` at `7362bb7` exits 0 and ends `OK`, with every counter 0: `set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`. The worker's run at this head adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/CategoricalOperatorAlgebras'` is empty. The files that `changes.md` lists outside the folder come from the merge of main (`8755fd0`), not from this pull request. The folder holds `README.md` (2274 lines), `Suggested.lean` (51 lines) and `metadata.toml`.
- `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 in 6 s with no diagnostic. The file is unchanged since `363a7e3`: `import Mathlib`, one module docstring "target signatures" naming every CA2a–CA10 headline with its missing carrier, and an empty namespace. With no declaration there is nothing for `#check` comparison or the one-tactic probe, and nothing is padding. The headline list and the carriers missing at the pins are as in the previous report, unchanged.

**Dependency check.** `gate --depcheck … --movable --content …` prints `depcheck: 239 roadmaps, 2320 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line. In the merge order this roadmap is at 227. No gaps are declared. `overlaps.md` lists no dropped id, no id only an open revision defines, and no other pull request changing this roadmap. Its closest roadmaps are QuantumGroups #1705 and #1649 (R01), TemperleyLiebOperatorAlgebras #867, OperatorAlgebraDynamics #1137 and OperatorKTheory #866.

**New locators, each read at the text:**
- `Burns2011` line 481: Proposition 2.1.21 is attributed to "Kosaki [21] Lemma 3.2". Items (i) `e₁xe₁=E(x)e₁`, (ii) `N=M∩{e₁}′`, (iii) `Je₁J=e₁` and (iv) `M₁=JN′J` are at lines 482–485, printed p. 12. Item (v) is at line 488, p. 13. The expectation `E_M(x)=J₀E′(J₀xJ₀)J₀` with `E′=τE⁻¹`, `Ind(E_M)=Ind(E)=τ⁻¹` and `E_M(e₁)=τ` is at lines 472 and 489–491, p. 13. [21] is J. Funct. Anal. 66(1), 123–140, 1986 (lines 6460–6461), as in the README's entry. The README's `j(x)=Jx*J` gives the same E₁: E⁻¹ preserves adjoints, so `J(E′(Jx*J))*J=JE′(JxJ)J`.
- `JonesPenneys2017Realizations` line 650 (II₁ base N) and line 670 (Definition 3.3(1), `⟨M,N⟩={M,e_N}′′=J_φN′J_φ`, p. 15, footer at line 674) support the README's "over a II₁ base" and the new References wording at line 2168.
- `Izumi2003`: Theorem 2.4 is at lines 208–212, p. 5 (type III factor, `ρ̃(λ_φ(t))=d(ρ)^(it)[Dφ∘φ_ρ:Dφ]_tλ_φ(t)`, the README's `ρ̃(u_t)` formula). Definition 3.1 is at lines 286–294, p. 7. Theorem 3.3 is at lines 376–383, p. 9: δ_m is a bijection onto `⋃H¹(F_M,U(n))`, grade-preserving. Remark 3.8 is at lines 716–721, p. 17: for III_λ, 0<λ≤1, every modular endomorphism decomposes into modular automorphisms. Masuda–Tomatsu cite the same numbers ("[17, Definition 3.1]" at `MasudaTomatsu2008` line 1484, "[17, Theorem 3.3]" at line 1506) and give [17] as Amer. J. Math. 125 (2003), 1–56 (lines 2700–2701), which matches the README's entry.
- `MasudaTomatsu2008` §3.1 starts at line 680, p. 15, for "M a factor" (line 682). The formula for ρ̃ is at lines 699–702, top of p. 16. §4.2 is at lines 1481–1484, p. 33. Lemma 4.10(2)–(3) is at lines 1496–1498, p. 34, with (3) and (4) attributed to Izumi at line 1506.

**Seeded sample.** I drew 15 of the 109 lines of CA1–CA10 that carry a page locator, using `shuf` seeded with the head SHA followed by `-12`: 379, 524, 626, 830, 1179, 1280, 1303, 1354, 1355, 1569, 1571, 1616, 1847, 1848, 2071. Lines 1569 and 1571 fall in the changed passage and are checked above (Burns pp. 12–13; Realizations p. 15). I also spot-checked 1847–1848: `HenriquesPenneys2020` Theorem B is at line 112, p. 3, and Theorem 6.8 at line 1866, p. 37, both for hyperfinite factors that are both type II or both III₁, as stated. The other lines are in text the diff leaves untouched and the previous report's sample checked.

**Ownership.** I ran `roadmaps grep -i` over 468 open heads and main for "Kosaki", "basic extension", "modular endomorphism" and "canonical extension of (an )?endomorphism". The only hits outside this roadmap are Fack–Kosaki s-numbers (NoncommutativeGeometry #1143, NoncommutativeIntegration on main), a "basic extension" phrase in TopologicalKTheory, and a Brauer-class title in KatoEulerSystems #1804, none of them these objects. The changed passages add no object and no supplier citation.

**Remarks on text the diff re-wrapped but did not change (not findings):** the basic-extension paragraph (lines 1565–1578) picks "ψ a faithful normal state on N", so it presupposes σ-finite factors. Burns states that hypothesis (`Burns2011` line 452), and CA9 uses the construction only on factors with separable predual. The References entry for Kosaki gives "Proposition 2.1.21 (pp. 12–13)" for the dual expectation too, which sits just after the proposition on p. 13. The body's "Burns, p. 13" is the exact locator.

### Adversarial table

Rows for changed statements (new values):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Basic extension, lines 1565–1578: `M₁=JN′J`, `e_Exe_E=E(x)e_E`, `N=M∩{e_E}′`, `Je_EJ=e_E` | `ℂ⊂M₂` with `E=tr`; `N=M`, `E=id`; wrong model e = projection onto the closure of Mξ | `L²(M₂,tr)=ℂ⁴`, `e=\|1̂⟩⟨1̂\|` of rank 1; `xe=ex ⇒ x̂∈ℂ1̂ ⇒ x∈ℂ=N`; `J1̂=1̂ ⇒ JeJ=e`; `JN′J=B(ℂ⁴)`, dim 16 `=span(M₂eM₂)`. `N=M`: `e=1`, `M₁=JM′J=M`. Wrong model: `e=1`, `M∩{1}′=M₂≠ℂ` | as stated, and (ii) excludes the wrong model | none |
| Dual expectation: `E₁(e_E)=Ind(E)⁻¹`, `Ind(E₁)=Ind(E)` | `ℂ⊂M₂`; `σ=id⊕id` on type III M (carried) | `Ind(tr)=4`; `E₁=id⊗tr` on `M₂⊗M₂^op`, `E₁(\|Ω⟩⟨Ω\|)=(½)(½)·1=¼`; `Ind(E₁)=4`. `id⊕id`: `4=d_σ²`, `E₁(e)=¼` | matches `Burns2011` lines 489–491 | none |
| Kosaki locator vs base type | III base `σ(M)≅M` (previous R03 instance) | Burns's setting is σ-finite factors of any type (line 452), so the type III instance is covered. Realizations is now cited only for a II₁ base (line 650) | repaired | none |
| Canonical extension locator (lines 1655–1657) | II∞ inner amplification n=2 (README's regression); type III | Izumi Thm 2.4 needs type III (line 208), so the II∞ instance needs MT §3.1 ("M a factor", line 682). Formula: `ρ̃(u_t)=2^(it)·2^(-it)u_t=u_t`, the same in Izumi's normalization `d(ρ)^(it)[Dφ∘φ_ρ:Dφ]_t`. MT's dual action `e^(-ist)` (line 695) versus the README's `e^(ist)`: ρ̃ commutes with both, since `θ⁻_s=θ_(-s)` | both locators needed and correct | none |
| Modular endomorphism definition (line 1702) | `ρ=Σv_i·v_i*`, two isometries, type III; α with `mod(α)≠id` | implementing system n = d(ρ) = 2 (Izumi Thm 3.3(5), lines 382–383). α: an inner ρ̃ fixes Z(core) pointwise, but `ρ̃\|Z=mod(α)≠id`, so α is not modular | definition discriminates | none |
| Irreducible modular endomorphisms of III_λ (lines 1709–1713) | `R_½`; III₀ | flow of weights periodic, stabilizer ≅ ℤ, `H¹(F,U(1))=Hom(ℤ,U(1))≅ℝ/(2π/log 2)ℤ`: σ_t up to inner, t mod `T(R_½)`. U(n) cocycles split into U(1) ones (Remark 3.8). III₀ has higher-dimensional irreducible ones (Izumi lines 722–724), so 0<λ is necessary | as stated | none |
| II∞ case (Lemma 4.10(2)) | modular irreducible ρ on a II∞ factor | the trace core gives `Hom(id,ρ)≠0` (MT line 1510 argument), so ρ is inner | as stated | none |
| Single owner of ε (lines 40–45) | this README; #1705 `b4e4777`; #1649 `79e1cb6`; main QuantumGroups | line 393; line 300; line 201; main line 42 cites CA1a,CA2a, but the README no longer lists QuantumGroups | two single-home claims | R01 |

Rows carried from the previous report (PRREVIEW-CategoricalOperatorAlgebras~11) for statements the diff leaves untouched:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 486 Penneys Theorem C | `P_(0,±)` of the dictionary | connected ⇔ `1_±` simple; `1₊` of Example 4.7 has `n₊` simples | supported (~11) | none |
| 541 bipartite Check | `u₁—w—u₂` | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ` | as stated (~11) | none |
| 627 CHJP 3.36/3.37 | `Q=1⊕g` in `Hilb(ℤ/2)` | `n₀²+n₁²=1=2n₀n₁` has no solution in ℕ | splits only in QSys(C) (~11) | none |
| 711 JP Theorem 3.20 | `A(a)=Hom(a,1)` | cyclic module C, basepoint 1 | supported (~11) | none |
| 721 Stinespring Check | `A=M₂`, `θ=½Tr` | dim K=4; `½·1` has rank 2 | discriminating (~11) | none |
| 1269 HP II Theorem 6.13 | TL(δ), `δ²=2,3,4` | `N=3,4,5`; depths 2, 4, ∞ | valid (~11) | none |
| 1304 Remark 5.17 | TL(√2) | `Tr f(0)=Tr f(2)=1`, `[f(0)]≠[f(2)]` | as stated (~11) | none |
| 1355 HNP 7.4 | handedness | source left, README right with note | consistent (~11) | none |
| 1387 HP2015 Lemma 3.4 | `M_n`; `R_λ` | `M_n⊗̄R₁≅R₁`; `R_λ⊗̄R₁≅R_λ` | type I excluded (~11) | none |
| 1398/1409 HP2020 | `Hilb(ℤ/2)` in `R_λ` | one centrally free, one centrally trivial representation | restriction needed (~11) | none |
| 1586 ultrapower | `M_n`, `L(F₂)`, R | `(M_n)_ω=ℂ`, `L(F₂)_ω=ℂ`, `R_ω≠ℂ` | supported (~11) | none |
| 2063 HPT Corollary 3.9 | `Hilb_fd` | `E⊠M≃M` | agrees (~11) | none |
| CA2a Theorem A | `Hilb(ℤ/2)`; t=4 | `χ²=1⇒χ=1` in ℝ>0; `2/5=2/5`, `1≠¼` | as stated (~11) | none |
| CA2a sign law | `J(a,b)=(−b̄,ā)` | `J²=−1`, `(J⊗J)²=+1` | as stated (~11) | none |
| CA3 normalization | `M_n` | `m′m′†=1`, `i′†i′=n²`; wrong one gives `n⁻²` | as stated (~11) | none |
| CA4 Theorem A | trivial object | `d_Q=1`, `A(1)=ℂ` | as stated (~11) | none |
| CA5 | `N⋊ℤ/2`, `N⋊ℤ` | `d_Q=2`; ℤ connected, not compact | as stated (~11) | none |
| CA6 | `Hilb_fd`, `x=ℂ^k`; `Hilb(ℤ)` | `k^n` vs `k^(2n)`; infinite support | discriminating (~11) | none |
| CA7 Katsura 8.6 | `ℂⁿ`, n=1,2,3; `ℓ²(I)` | `(ℤ,ℤ)`, `(0,0)`, `(ℤ/2,0)`; `K₀=ℤ`, `K₁=0` | as stated (~11) | none |
| CA7 HP I 5.25 | `μ=(16,1)`; loop | `4=4`; `¼` vs `64`; `C([−2,2])` | as stated (~11) | none |
| CA8 Watatani Check | `ℂ⊂ℂ²` | `(3,3/2)`; `2·1` | as stated (~11) | none |
| CA9 HNP 7.4 | `HS(ℂ²,ℂ³)` | 6 vs 1 | discriminating (~11) | none |
| CA9 Theorem D | factor | invariant state automatic | as stated (~11) | none |
| Definition 4.1 ⇔ V12 `Ct(M)` | ω-centralizing vs predual-centralizing | subsequence extraction both ways | equivalent (~11) | none |
| Lemma 4.11 | `Ad u∘σ_t^φ` on `R_λ` | `ρ̃=Ad(u·λ_t)` inner | sound (~11) | none |
| Theorem 4.12 II∞ / III₁ | `ρ⊗id`, flip; `σ_t⊂ρρ̄` | `Hom(id⊗id,ρ⊗ρ̄)≠0`; `σ_(nt)` pairwise outer | as stated (~11) | none |
| `T(M)={0}` for III₁ | `σ_T^φ=Ad u` | `Γ⊆(2π/T)ℤ≠ℝ` | sound (~11) | none |
| Definition 4.13 | `M⊗1⊂M⊗M₂` | `‖φ−φ‖=0` | centrally non-trivial (~11) | none |
| Lemma 4.15 Check | `R_½`, `σ_(t₀)`, `t₀=π/log 2` | `λ^(it₀)=−1`, `t₀∉(2π/log 2)ℤ` | hypothesis necessary (~11) | none |
| `M⊂M₁≅σ̄(M)⊂M` | common cyclic separating vector | Dixmier–Maréchal; `σ⁻¹γ=σ̄` | route valid (~11) | none |
| Theorem 4.16 vs Izumi 1993 3.5 | III₁, k=1 | first-stage form | attribution correct (~11) | none |
| Theorem 4.18 | k≤n | `(σσ̄)^k≺(σσ̄)^n` | as stated (~11) | none |
| Corollary 4.19 | `σ=id⊕ρ` | `[σσ̄]=[id]⊕[ρ]⊕[ρ̄]⊕[ρρ̄]` | as stated (~11) | none |
| HP Corollary 3.8 | II∞; III₁ | inner ⇒ `α_X≅α_1`; t=0 | sound (~11) | none |
| `L(F₂)⊗̄B(ℓ²)` Check | `b⁻ⁿhaⁿ` | distinct; `M_ω=ℂ` | not centrally free (~11) | none |
| CA10 tube algebras | ℤ/2, ℤ/3, S₃ | 4, 9, 36 | as stated (~11) | none |

## Not verifiable

- **Kosaki 1986**, §3 and Lemma 3.2 (J. Funct. Anal. 66): the DOI resolves only to a paywalled page, and the manifest records it as `uncertified`. The README cites it through Burns's restatement, which I checked. That Lemma 3.2 sits in §3 is not checked.
- **Izumi 2003**, published numbering (Amer. J. Math. 125): I read the arXiv v1 text. The README says it uses the arXiv page numbers. Masuda–Tomatsu cite the journal version with the same theorem numbers (Definition 3.1, Theorem 3.3), which corroborates the numbering.
- **Popa 1995**, Theorem 3.5(ii) and Corollary 4.4: no legal open copy (`uncertified`). Unchanged since the previous report.

## Source issues

- **Misprint** in `Burns2011` at Lemma 2.1.22 (pull-down lemma), printed p. 13: the source gives the element as `τ⁻¹E_M(xe₁)`, defined through itself; it should be `τ⁻¹E_M(ze₁)` for the given z∈M₁; affects nothing.
