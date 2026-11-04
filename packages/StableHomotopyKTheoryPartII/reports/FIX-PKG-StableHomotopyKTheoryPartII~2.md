# FIX-PKG-StableHomotopyKTheoryPartII~2

Repair of the four findings of REV-PKG-StableHomotopyKTheoryPartII. Every finding was checked against the cached legal sources, the cited sibling roadmap at its open head, and a computation. All four are right and all four were applied. Files edited: `packages/StableHomotopyKTheoryPartII/README.md`, `packages/StableHomotopyKTheoryPartII/Suggested.lean` (docstring only) and `packages/StableHomotopyKTheoryPartII/sources.toml` (`cited_for` of `bmms86`). `design/plan.json` is unchanged because no new supplier gap is needed.

## F01 (P1) — applied

Old: §1.1 fixed only t⁻¹e. §6.2 read `Σ P^i(x)t^((p−1)i)+Σ βP^i(x)t^((p−1)i)e`, and §6.3 had components P^i and βP^i.
New: §1.1 fixes t=u⁻¹ and e=b·u⁻¹ with u=βb, so βe=1. The formula is now `Σ(−1)^iP^i(x)t^((p−1)i)+(−1)^nΣ(−1)^iβP^i(x)t^((p−1)i)e`, with coefficients on the right. The §6.3 components are now (−1)^iP^i, θ_i=(−1)^iβ_LP^i, and (−1)^iP^i∘r for Hℤ.

Verification:
- **Odd part.** I recomputed it. With the Koszul rule (e·z=−z·e), the unsigned formula gives F(x)F(z)=xz+(xw−yz)e but F(xz)=xz+(yz−xw)e on BC₃×BC₃.
- **General proof of the repair.** Write F(x)=A(x)+(−1)^{|x|}β(A(x))e, where A is the total operation (a ring map by Cartan). Then F is multiplicative by the Leibniz rule and e²=0.
- **Even part.** The Euler class of L⊗ℂ[C₃] is v(v+u)(v+2u)=v³−vu². Its coefficient of v is −u². Dividing by it gives v−v³u⁻²=v−v³t². Since t^(p−1)=u^(−(p−1)) does not depend on the choice of t, no rescaling of t can repair the unsigned formula.
- **Source.** bmms86 line 4481 (Proposition 2.4(vi), scan PDF p.134) and bmms86 line 4501 (χ=m!u^m and ω=m!bu^(m−1), scan PDF p.135) give the same signs by Wilson's theorem (m!)²=(−1)^(m+1).
- **Reading of the source.** I confirmed that reading BMMS with the X-classes on the left agrees with its Proposition 2.2(ii). The opposite reading fails that test.

Changes made in the same pattern elsewhere:
- Conventions: Tate coefficients are written on the right.
- §6.1: the monomial splitting.
- §6.2: the statement, the proof route and four Checks, including the two p=3 negative controls.
- §6.3: the statement, the Checks and a new Check on the odd component.
- §1.1: two new Checks (βe=1 and the (−t,−e) control; independence of the choice of b).
- Layer 1 Examples, Layer 6 Examples and Worked examples.
- The `Suggested.lean` docstring.

## F02 (P2) — applied

Old: §7.4 stated and proved (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧≠0 as a target owned here.
New: §7.4 is deleted. The old §7.5 and §7.6 become §7.4 and §7.5, and the reference in the §3.4 Check now reads §7.5. RefinedTraceMethods §2.3 is named as owner in Scope and ownership and in its supplier contract. The p=2 and p=3 values (π₀=ℤ₂, ℤ₃; mod-p quotients 𝔽₂, 𝔽₃; zero input gives 0) are kept as applications in the Layer 7 Examples.

Verification: `roadmaps show RefinedTraceMethods` at its open head, §2.3, under "The Tate fixpoint lemma", states the same equivalence for S with trivial action and cites NS18 Example I.2.3(i). RefinedTraceMethods comes before this roadmap in the merge order.

Other changes for this finding:
- The Layer 7 Dependencies line drops "AInfCohomology §AI.7.2 (Tate orbit lemma)", which only the deleted target used, and adds RefinedTraceMethods §2.3.
- Downstream consumers now lists the two local counterexamples plus the imported one.
- The `Suggested.lean` docstring drops the sphere counterexample from the bullet of locally owned headlines.

## F03 (P3) — applied

Old: in the §5.2 Check, restricting −ρ to the trivial subgroup gave "π₁R on each side, rather than π₋₁R".
New: it gives "π_pR on each side, rather than π₁R or π_(−p)R". This is because −ρ restricts to the trivial virtual bundle of rank −p, and §5.1 gives R^(triv(−p))(pt)=π_pR. Two p=2 controls were added: R=ΣHℤ gives 0 (the old reading gave ℤ), and R=Σ²Hℤ gives ℤ (the old reading gave 0).

The rank −1 Check of §5.1 and the Layer 5 Examples are correct and unchanged. I also checked the twist ranks in the §§5.3–5.5 Checks; they are correct.

## F04 (P3) — applied

Old: "§5.2, Theorem 5.9, p.903" in two places: the §2.6 statement and its proof route.
New: "§5.2, Theorem 5.9 and proof, pp.902–903" in both places.

Evidence:
- lnr12 line 1934 is the printed page marker for p.902.
- lnr12 line 1964 begins Theorem 5.9.
- lnr12 line 1973 is the marker for p.903, where the proof begins.

The References entry and the manifest locator already cover pp.902–903.

## Checks run

- **Elaboration.** `lake env lean packages/StableHomotopyKTheoryPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. No `TauCeti.*` import is used.
- **Signatures.** `Suggested.lean` declares nothing; it is a docstring and an empty namespace. So there was nothing to `#check @name` and no binder that could be lost. No declaration was added.
- **Direction.** Full output of the depcheck:

      depcheck: 52 roadmaps, 587 edges, 0 problem(s)

  Exit status 0. There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation or Lean name that resolves nowhere.
- **Ownership.** The only ownership question raised (F02) was checked against RefinedTraceMethods at its open head. No new construction was introduced, so no further ownership search was needed.
- **Sources.** No new source was fetched and `needs-references.toml` was not created. All repairs use texts the manifest already records: bmms86, lnr12 and ns18.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §1.1 normalization t=u⁻¹, e=b·u⁻¹ | b↦λb at p=3 (λ=2); (t,e)↦(−t,−e) | λ=2: u'=2u, t'=2t, e'=e, t'²=4t²=t². Negated pair: t⁻¹e=b unchanged, β(−e)=−1 | e and t^(p−1) are canonical; the negated pair is excluded; added as Checks |
| §1.1 weights after normalization | a∈𝔽_p^× acting on b by a⁻¹ | u=βb: a⁻¹; t=u⁻¹: a; e=b/u: 1; t⁻¹e=b: a⁻¹ | Agrees with the existing weight statements and Checks |
| §6.2 even coefficient | v∈H²(ℂP∞;𝔽₃); BMMS 2.4(vi) at q=2, m=1 | Euler: v³−vu², quotient v−v³t². BMMS: (−1)^m(m!)²u²v+v³=v³−vu² | Sign (−1)^i; the unsigned v+v³t² is refuted |
| §6.2 even coefficient at p=5 | m=2 | (m!)²=4≡−1=(−1)^(m+1); χ^(−2)=−u^(−4)=−t⁴; coefficient (−1)^(mi)·(−1)^((m+1)i)=(−1)^i | Formula holds at p=5 |
| §6.2 odd coefficient | x,z∈H¹(BC₃×BC₃), n=1,2 | Repaired: (x−ye)(z−we)=xz+(yz−xw)e=F(xz). Unsigned: product xz+(xw−yz)e but F(xz)=xz+(yz−xw)e | (−1)^n added; unsigned version added as a negative-control Check |
| §6.2 general multiplicativity | F(x)=A(x)+(−1)^{|x|}βA(x)e | Odd part of F(x)F(y) is (−1)^{|xy|}[βA(x)A(y)+(−1)^{|x|}A(x)βA(y)]e=(−1)^{|xy|}βA(xy)e | Holds for every degree |
| §6.2 at p=2 | u∈H¹(ℝP∞), Euler class of λ⊗(1⊕sign) | u(u+b), divided by b gives u+u²s | No change at p=2; added as an independent Check |
| §6.2 degenerate n=0 | unit 1∈H⁰(*) | P^i1=0 for i>0, β1=0; F(1)=1 | Unital |
| §6.2 leading-coefficient argument | unit relating Thom and Tate-suspension identifications | Lies in Ĥ^(n(p−1))(C_p;𝔽_p)=𝔽_p·u^(mn), which has even degree, so it commutes with every coefficient | The relative signs of terms survive division; this is stated in the proof route |
| §6.2 BMMS reading (X-classes left vs right) | q=1, p=3, multiplicativity of 2.2(ii) | X-left: −(P_πx)(P_πz)=−xzχ²−(yz−xw)ωχ=P_π(xz). Bπ-left: −χ²xz+ωχ(yz−xw)≠−χ²xz−ωχ(yz−xw) | X-left reading used |
| §6.3 component θ_i | left suspension ι×x | (−1)^(n+1+i)βP^i(ι×x)=(−1)^(n+i)ι×βP^ix. Unsigned: β(ι×x)=−ι×βx | θ_i is a stable operation; the unsigned family is not; stated |
| §6.3 values at p=3 | v (n=2); x (n=1); xz (n=2) | −P¹v=−v³=2v³; θ₁v=0; θ₀x=−y; θ₀(xz)=yz−xw | New and recomputed Checks |
| §6.3 Hℤ components | p=3, i=0,1 | i=0: reduction r; i=1: −P¹∘r | Sign added; p=2 unchanged (signs vanish mod 2) |
| §6.1 summand degrees | p=3 | t² (homotopy degree 4) and t²e (degree 5) | Unchanged; splitting now named by monomials |
| §5.2 Check, n=−1 | p=2; R=ΣHℤ, Σ²Hℤ | −ρ restricts to rank −2: π₂(ΣHℤ)=0, π₂(Σ²Hℤ)=ℤ. Old reading π₁: ℤ, 0 | Corrected; controls added |
| §5.1 rank −1 Check (same pattern) | V of rank −1 at a point | R^(−1)(pt)=π₁R | Correct, unchanged |
| Imported sphere counterexample (Layer 7 Examples) | p=2, 3; zero spectrum | π₀=ℤ₂, ℤ₃; mod-p quotients 𝔽₂, 𝔽₃; zero gives 0 | Matches RefinedTraceMethods §2.3 |
| §3.4 Check reference | KU at p=2, degree 0 | KU₂^∧/2 is 𝔽₂; T₂(KU)/2=0 by the renumbered §7.5 | Reference updated |
| LNR Theorem 5.9 locator | lnr12 lines 1934, 1964, 1973 | Statement on p.902, proof on p.903 | Corrected at both occurrences |

## For the maintainer

- **Design files.** `design/plan.json` (outside its `gaps` list, which this job may not touch) and `design/README.md` still carry:
  - the unsigned §6.2 formula and v+v^p t^(p−1) (plan.json lines 2326 and 2335; design README lines 1121 and 1134);
  - the target `PO.7/fixed-sphere-counterexample`;
  - the "Theorem 5.9, p.903" locator.

  The package README is the authoritative text. The `ns18` manifest `cited_for` keeps `PO.7/fixed-sphere-counterexample`, because the plan id still exists there.
- **Renumbering.** Layer 7 is renumbered: the KU orbit counterexample is now §7.4 and the unbounded Segal failure is now §7.5. No roadmap on main or at an open head cites this roadmap's sections (`roadmaps grep` found no match).
- **Possible upward dependency in RefinedTraceMethods.** The sphere counterexample in RefinedTraceMethods §2.3, and its line "S^{tC_p}≃S_p^∧", need the Segal conjecture for C_p. This roadmap proves that conjecture in §2.7, later in the merge order. Supplying it to RefinedTraceMethods is a question for that roadmap or for the merge order, not for this package. This package only consumes the statement.
- **Source issue for the errata register (as in the review).** The unsigned total-power formula of ns18 Proposition IV.1.16 (ns18 line 5167) is wrong under the Koszul convention, in both its even sign (−1)^i and its degree-dependent Bockstein sign (−1)^n. The 2019 correction does not address it.
- **Untrusted text.** The review contained no instruction-like or suspicious passages.
