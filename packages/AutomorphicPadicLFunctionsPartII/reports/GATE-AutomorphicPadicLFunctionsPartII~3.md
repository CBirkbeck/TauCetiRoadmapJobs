# GATE-AutomorphicPadicLFunctionsPartII~3: answers to the human review of head ff6772c

Review answered: CBirkbeck, 2026-10-26T08:42:40Z. It has two numbered findings and a "checked and found sound" list. Finding 1 makes two separable points, split here into H01 and H02:
- H01: the approximation in the cross-type Check is impossible.
- H02: the Check is not an independent validation of the sign.

Finding 2 is H03. Repairs are in commit `f7bcdd50` on top of `ff6772c`. Only `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/README.md` changed; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied

§8.5, cross-type Check (README line 1323). The old text "Choose finite-order η_k on G_f converging uniformly to ψ" is replaced by finite linear combinations, as the review suggests:
- integers r(x) represent x∈(ℤ/5^n)× with r(−x)=−r(x);
- φ_n(q_f(u,v))=r(u mod 5^n)⁻¹, with |φ_n−ψ|≤5^(−n);
- φ_n=Σ_η c_(n,η)η, and the limit statement is Σ_η c_(n,η)U(χ₃η)→∓U(χ₄).

Oddness of φ_n in u forces η(q_f(−1,1))=−1 for every η with c_(n,η)≠0. So the parity diagnostic survives, and the kernel Check (line 1324) now refers to "every χ₃η in the sums above". The impossibility is recorded as a negative control in the same Check: at g=q_f(6,1), ψ(g)=1/6 and |1/6−1|₅=1/5, while |ζ−1|₅≥5^(−1/4) for every root of unity ζ≠1, so |η(g)−ψ(g)|₅≥1/5 for every finite-order η.

The same defect, density claimed for the individual characters rather than for their span, also occurred in three other places. All now speak of the linear span:
- §8.3 API bullet (line 1256): "density of finite-order twists" → "density of the linear span of the finite-order twists".
- §8.4 proof route (line 1292): "they span … hence are dense" → "their linear span is … hence is dense". A sentence was added: two distinct finite-order characters are at uniform distance at least p^(−1/(p−1)), so density is used only through finite linear combinations.
- §8.5 statement (line 1307), two places:
  - "the finite-order twists of one critical character are dense" → "… span a dense subspace of C(G_f,ℂ_p)";
  - "uniqueness from the finite-order-twist density" → "from the density of the span of the finite-order twists".

The correct span statement already in §8.3 (line 1238) is unchanged.

## H02 (CBirkbeck) — applied differently

**Wording.** The cross-type Check (line 1323) now says it is a necessary condition only: it shows that at most one of the two formulas holds, not which. The §8.5 statement (line 1307) now says "That exclusion does not choose between them". It gives the actual reason for choosing ε: the construction's own moments carry it.

**Construction-side computation.** A new Check (line 1325) computes the two endpoint values from the construction rather than from the target.
- χ₃ and χ₄ are unramified at 5, so Local=1 and no Fourier kernel or Gauss sum enters. This removes the character and Gauss-sum transport the review flags.
- At d=1, β=0 the type-dependent part of the moment's sign is that of ∂_z^a(z+λ)⁻¹=(−1)^a·a!·(z+λ)^(−a−1).
- So, after division by δ_c, the moments are +U(χ₃) at a=2 and −U(χ₄) at a=3, with U(χ₃)≠0 (|χ₃(v)|=5^(−3/2)≠1).

**External check (BK-2010).** BK-2010 is cited as a normalization matched at these characters and derived without KS-v4 §3. Its three steps:
- the Laurent coefficient of z^(b−1)w^a of the Kronecker theta function is (−1)^(a+b−1)e*_(a,b)/(a!A^a) (Theorem 1.17, BK-2010 line 769);
- the measure's moments carry the same sign (Proposition 3.3, line 1625);
- Katz's interpolation for type (k,−l), k>l≥0, has the factor (−1)^(k+l−1)(k−1)!, with Gauss sum 1 for a character unramified at p (Theorem 3.11, line 1996).

The match with the roadmap:
- With χ=φ⁻¹ and (k,l)=(α,β), BK's factor equals ε(1,α−1,β)·(α−1)!. At l=0 its period powers Ω^k and Ω_p^k equal those of 𝒩_(α,0) and §8.5.
- Its torsion point α₀Ω with α₀≡1 mod f matches x=Ω mod fΩ of §8.3.
- The values are +2 at χ₃ and −6 at χ₄.

**Why "differently".** The review asked that the limit itself be computed from the construction or a matched normalization. The Check states the three inputs that fix it for the measure built here:
- the endpoint moments above;
- the independence of the sign from the finite-order twist within one type (§8.3);
- the inverse kernel of §7.3 (kernel Check).

A bare endpoint computation would not be enough. The translate δ_(q_f(−1))*μ_f is also bounded. Its moments at the unramified χ₃ and χ₄ are both −U, a type-independent sign. Only the twisted moments, where χ_fin(−1)=−1, rule it out.

**On the earlier objection.** The review's status paragraph is right that the density argument alone proves only mutual exclusion. The decision for ε now rests on two things stated in the README: the construction-side sign (−1)^a, and BK-2010's independent d=1 derivation. A sign depending on the type does not come from a normalization choice. Negating the Betti generator multiplies both sides by (−1)^(|α|+|β|): the torsion point, Ω and Ω∨ all change sign. That is checked in the pass below.

## H03 (CBirkbeck) — answered

This concerns the pull-request description, which this job may not edit. The README makes no claim about other authors' pull requests. The point is correct, as rechecked:
- The roadmap consumes AbelianSchemesAndArithmeticModuliPartII P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4 and P4.1–P4.3 only.
- At its head fe15b146, that roadmap cites LieGroupoidsPoisson G0.1 at lines 37, 303, 305, 1425, 1455 and 1752. The only target that consumes it is B2.10 (lines 1423–1461), and line 1752 is the Layer B2 Dependencies list; both lie outside the consumed P0–P4 prefix. Lines 37, 303 and 305 are its scope and supplier-contract sections.
- The roadmaps index lists LieGroupoidsPoisson (kim-em) as open at f1e1e4c.

So the whole-pull-request merge chain includes #1543 → #1405 → #1050, but no consumed interface depends on it. The worker should either drop the sentence "depends on no other author's open pull request" from the description, or list this transitive prerequisite and say that the consumed P0–P4 interfaces do not use it.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| No finite-order η is close to ψ (line 1323) | g=q_f(6,1), p=5 | ψ(g)=1/6; \|1/6−1\|₅=\|−5/6\|₅=1/5. ζ primitive 5th root: \|ζ−1\|₅=5^(−1/4)≈0.669. Primitive 25th root: 5^(−1/20). Prime-to-5 order: 1. So \|ζ−1/6\|₅=\|ζ−1\|₅≥0.669>0.2, and η(g)=1 gives 0.2 | holds; confirms H01 | negative control added |
| Uniform distance ≥p^(−1/(p−1)) (line 1292) | p=2, 3, 5; trivial group | p=2: \|−1−1\|₂=1/2=2^(−1). p=3: \|ω−1\|₃=3^(−1/2). p=5: 5^(−1/4). Trivial group: no two distinct characters, so the statement is vacuous | holds | added |
| φ_n construction, n=1 | (ℤ/5)×={1,2,4,3}=2^(0..3); r(1)=1, r(4)=−1, r(2)=2, r(3)=−2 | φ₁=(1, 1/2, −1, −1/2). Characters η_j(2)=i^j: c₀=¼(1+½−1−½)=0; c₂=¼(1−½−1+½)=0; c₁=(2−i)/4; c₃=(2+i)/4. Reconstruction: φ₁(1)=c₁+c₃=1, φ₁(2)=i·c₁−i·c₃=½. Both nonzero coefficients sit at odd characters: η₁(4)=i²=−1, η₃(4)=i⁶=−1 | oddness forces η(−1,1)=−1 | — |
| \|φ_n−ψ\|≤5^(−n) | u=6, u=4 at n=1 | \|1−1/6\|₅=1/5; \|−1−1/4\|₅=\|−5/4\|₅=1/5 | ≤5^(−1) | — |
| χ₃φ_n→χ₄ | \|χ₃\| on G_f | \|u⁻³\|₅=1, so ‖χ₃φ_n−χ₄‖≤5^(−n) | holds | — |
| Kernel flip on the sums (line 1324) | each η with c≠0 | Σ-component of (χ₃η)_fin(−1)=η(q_f(−1,1))=−1; χ₄: 1. Flipped kernel gives −Σc·U(χ₃η)→−U(χ₄), i.e. Σc·U(χ₃η)→+U(χ₄) | reverses the limit | wording |
| Endpoint signs from ∂_z (line 1325) | a=2, 3 | ∂_z²(z+λ)⁻¹=+2(z+λ)⁻³; ∂_z³(z+λ)⁻¹=−6(z+λ)⁻⁴; ε(1,2,0)·2!=+2, ε(1,3,0)·3!=−6 | agrees with the §4.3 Check (−1)^(a+β)a! | added |
| BK-2010 Theorem 1.17 sign | a=0, b=3 and b=4 at w=0 (direct, via ζ(z₀+z)) | the z² coefficient is ζ″(z₀)/2=Σ(z₀+γ)⁻³=+e*_(0,3); the z³ coefficient is ζ‴(z₀)/6=−Σ(z₀+γ)⁻⁴=−e*_(0,4); formula (−1)^(b−1) gives +, − | consistent | cited |
| BK-2010 Theorem 3.11 ↔ ε | (k,l)=(3,0), (4,0), (3,1) | (−1)^(k+l−1)(k−1)!: +2, −6, −2. ε(1,α−1,β)(α−1)!: +2, −6, ε(1,2,1)·2=−2 | equal | cited |
| BK type ↔ roadmap type | BK Proposition 1.6 ii) with type (a,b), b>a | Σφ(α)\|α\|^(−2s)=Σ barα^(b−a)\|α\|^(−2(s−a)) means φ((α))=α^a barα^b; so φ((α))=α^k barα^(−l) and χ=φ⁻¹=λ^(−k)barλ^l, i.e. α=k, β=l; e*_(l,k)=E^(l,k) | matches | — |
| U(χ₃)≠0 | v above 5; L-series | \|χ₃(a)\|=Na^(−3/2), so the sum converges by ζ_K(3/2). \|χ₃(v)⁻¹/5\|=√5≈2.236≠1 and \|χ₃(v̄)\|=5^(−3/2)≈0.089≠1, so both Euler factors are nonzero; Local=1 | nonzero | added |
| δ_c at the endpoints | c=(7): 7≡−1 mod (1+i)³, so λ=−7 | χ₃((7))=(−7)⁻³=−1/343, δ=49+343=392; χ₄((7))=7⁻⁴, δ=49−2401=−2352 | both nonzero | — |
| Translate δ_(q_f(−1))*μ_f | χ₃, χ₄, χ₃η | multipliers χ(q_f(−1)): χ₃: −1, so −U(χ₃); χ₄: +1, so −U(χ₄); χ₃η: (−1)(−1)=+1, so +U(χ₃η) | type-independent at unramified endpoints only | stated why twists are needed |
| Betti generator −Ω (the claim in H02) | χ₄, d=1 | the torsion point −x gives E^(β,α)(−t)=(−1)^(α+β)E(t), so 1 on both sides at (4,0); Ω^αΩ∨^β→(−1)^(α+β), so 𝒩 also gives 1 at (4,0); at (3,0) both sides give −1 | both sides change together | — |
| Agreement by density (lines 1256, 1292) | δ_b*μ_(f,c) and δ_c*μ_(f,b) | equal on twists, hence on their span by linearity, hence on its closure C(G_f) by boundedness | holds | wording |

## Signatures, ownership, sources

- **Signatures.** `Suggested.lean` is unchanged, so no `#check` was rerun.
  - The four elaborated types in the job's `signatures.md` were compared with README §§3.3–3.4 (lines 574–627).
  - The binders d, `0<d`, Λ, `DiscreteTopology`, `IsZLattice`, h with positivity, ν, z and w all appear, and Λd with its alternating-dual membership hypothesis. None is dropped.
- **Ownership.** No new construction, carrier or target was added. BK-2010 is cited as evidence for a sign, not as a supplier. No `*Needs:*` line or supplier contract changed.
- **Sources.**
  - BK-2010 was read through the sources service from arXiv, an open repository: arXiv:math/0610163v4, dated 11 Dec 2007. It is published in Duke Mathematical Journal 153 (2010), 229–295, DOI 10.1215/00127094-2010-024.
  - Locators use the arXiv v4 numbering: Theorem 1.17 p.17, Proposition 3.3 p.36, Theorem 3.11 p.44, as stated in the README reference entry.
  - `sources.toml` is outside this job's edit scope. The worker should record `BK-2010`: locator_scheme theorem; locator Theorem 1.17, Proposition 3.3, Theorem 3.11; cited_for 8.5; both `arxiv` and `doi`; version_note "arXiv v4 numbering".
  - The board's `sources.toml` still lists only KS-v4 and BKO-2021. HT-1993, HK-2018 and Sch-2014, all cited in the README, also need entries.
  - No text was missing; `needs-references.toml` was not created.
- **Suspicious text.** None found in the review.

## Build and gate

- `lake build TauCetiRoadmap.AutomorphicPadicLFunctionsPartII.Suggested`: **Build completed successfully (8976 jobs)**. There are two `declaration uses 'sorry'` warnings, at lines 67 and 90.
- Gate summary line, after commit `f7bcdd50`: `gate AutomorphicPadicLFunctionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`--depcheck --movable`): `depcheck: 55 roadmaps, 638 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
